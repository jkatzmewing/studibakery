#!/bin/bash
# Upgrade Nextcloud containers

nextcloud_version="$1"

nextcloud_data_dir="$2/nextcloud"
mysql_data_dir="$2/nextcloud-mysql"

sudo docker pull mariadb:latest
sudo docker pull nextcloud:"$nextcloud_version"

sudo docker stop nextcloud
sudo docker rm nextcloud
sudo docker stop mysql
sudo docker rm mysql

sudo docker run -d \
	--name mysql \
	--network net-nextcloud-mysql \
	-v "$mysql_data_dir":/var/lib/mysql \
	--innodb_read_only_compressed=OFF \
	mariadb:latest

sudo docker run -d \
	-v "$nextcloud_data_dir":/var/www/html \
	--name nextcloud \
	--network net-nextcloud-mysql \
	-p 3080:80 \
	nextcloud:"$nextcloud_version"
