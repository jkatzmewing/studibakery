#!/bin/bash
# Set up Nextcloud with MySQL

nextcloud_data_dir="$1/nextcloud"
mysql_data_dir="$1/nextcloud-mysql"

echo "MySQL root password?"
read -r mysql_root_pw

echo "MySQL user password?"
read -r mysql_user_pw

echo "Nexctloud admin username?"
read -r nextcloud_admin

echo "Nextcloud admin password?"
read -r nextcloud_admin_pw

sudo docker pull mariadb
sudo docker pull nextcloud

sudo mkdir -p "$mysql_data_dir" "$nextcloud_data_dir"

sudo docker network create net-nextcloud-mysql

sudo docker run -d \
	-e MYSQL_ROOT_PASSWORD="$mysql_root_pw" \
	-e MYSQL_USER=nextcloud \
	-e MYSQL_DATABASE=nextcloud \
	-e MYSQL_PASSWORD="$mysql_user_pw" \
	--name mysql \
	--network net-nextcloud-mysql \
	-v "$mysql_data_dir":/var/lib/mysql \
	mariadb

sudo docker run -d \
	-e MYSQL_USER=nextcloud \
	-e MYSQL_DATABASE=nextcloud \
	-e MYSQL_PASSWORD="$mysql_user_pw" \
	-e NEXTCLOUD_ADMIN_USER="$nextcloud_admin" \
	-e NEXTCLOUD_ADMIN_PASSWORD="$nextcloud_admin_pw" \
	-v "$nextcloud_data_dir":/var/www/html \
	--name nextcloud \
	--network net-nextcloud-mysql \
	-p 3080:80 \
	nextcloud
