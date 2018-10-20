#!/bin/bash
# Set up local Nextcloud (with MySQL) for use over SSH tunnels

echo "MySQL root password?"
read -r mysql_rootpw

echo "MySQL user password?"
read -r mysql_userpw

sudo docker pull mariadb
sudo docker pull nextcloud


sudo mkdir -p /mnt/data/nextcloud-mysql

sudo docker network create net-nextcloud-mysql

sudo docker run -d \
	-e MYSQL_ROOT_PASSWORD="$mysql_rootpw" \
	-e MYSQL_USER=nextcloud \
	-e MYSQL_DATABASE=nextcloud \
	-e MYSQL_PASSWORD="$mysql_userpw" \
	--name mysql \
	--network net-nextcloud-mysql \
	mariadb

sudo docker run -d \
	-v /mnt/data/nextcloud:/var/www/html \
	--name nextcloud \
	--network net-nextcloud-mysql \
	-p 3080:80 \
	nextcloud
