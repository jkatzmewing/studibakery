#!/bin/bash
# Set up local Nextcloud (with MySQL) for use over SSH tunnels

echo "MySQL root password?"
read mysql_root

echo "MySQL user password?"
read mysql_user

sudo docker pull mariadb
sudo docker pull nextcloud


sudo mkdir -p /mnt/data/nextcloud-mysql

sudo docker network create net-nextcloud-mysql

sudo docker run -d \
	-e MYSQL_ROOT_PASSWORD="$mysql_root" MYSQL_PASSWORD="$mysql_user" \
	--name mysql \
	--network net-nextcloud-mysql \
	mariadb

sudo docker run -d \
	-v /mnt/data/nextcloud:/var/www/html \
	--name nextcloud \
	--network net-nextcloud-mysql \
	-p 3080:80 \
	nextcloud
