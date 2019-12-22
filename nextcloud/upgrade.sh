#!/bin/bash
# Upgrade Nextcloud containers

nextcloud_data_dir="$1/nextcloud"
mysql_data_dir="$1/nextcloud-mysql"

sudo docker pull mariadb
sudo docker pull nextcloud

sudo docker stop nextcloud
sudo docker rm nextcloud
sudo docker stop mysql
sudo docker rm mysql

sudo docker run -d \
	--name mysql \
	--network net-nextcloud-mysql \
	-v "$mysql_data_dir":/var/lib/mysql \
	mariadb

sudo docker run -d \
	-v "$nextcloud_data_dir":/var/www/html \
	--name nextcloud \
	--network net-nextcloud-mysql \
	-p 3080:80 \
	nextcloud
