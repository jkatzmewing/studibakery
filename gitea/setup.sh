#!/bin/bash
# Set up gitea with MySQL

gitea_version="$1"
gitea_data_dir="$2/gitea"
gitea_db_dir="$2/gitea_mysql"

echo "MySQL root password?"
read -r mysql_root_pw

echo "MysQL user password?"
read -r mysql_user_pw

sudo docker pull mariadb:latest
sudo docker pull gitea/gitea:"$gitea_version"

sudo mkdir -p "$gitea_db_dir"

sudo docker network create net-gitea

sudo docker run -d \
	-e MYSQL_ROOT_PASSWORD="$mysql_root_pw" \
	-e MYSQL_USER=gitea \
	-e MYSQL_DATABASE=gitea \
	-e MYSQL_PASSWORD="$mysql_user_pw" \
	--name db \
	--network net-gitea \
	-v "$gitea_db_dir":/var/lib/mysql \
	mariadb:latest

sudo docker run -d \
	-e MYSQL_USER=gitea \
	-e MYSQL_DATABASE=gitea \
	-e MYSQL_PASSWORD="$mysql_user_pw" \
	--name web \
	--network net-gitea \
	-v "$gitea_data_dir":/data \
	-p 3000:3000 \
	-p 2222:22 \
	gitea/gitea:"$gitea_version"
