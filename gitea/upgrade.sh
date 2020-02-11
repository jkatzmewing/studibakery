#!/bin/bash
# Upgrade gitea containers

gitea_version="$1"
gitea_data_dir="$2/gitea"
gitea_db_dir="$2/gitea_mysql"

sudo docker pull mariadb:latest
sudo docker pull gitea/gitea:"$gitea_version"

sudo docker stop web
sudo docker rm web
sudo docker stop db
sudo docker rm db

sudo docker run -d \
	--name db \
	--network net-gitea \
	-v "$gitea_db_dir":/var/lib/mysql \
	mariadb:latest

sudo docker run -d \
	--name web \
	--network net-gitea \
	-v "$gitea_data_dir":/data \
	-p 3000:3000 \
	-p 2222:22 \
	gitea:"$gitea_version"
