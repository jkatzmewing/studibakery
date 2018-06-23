#!/bin/bash
# Upgrade Nextcloud containers

sudo docker pull mariadb
sudo docker pull nextcloud

sudo docker stop nextcloud
sudo docker rm nextcloud
sudo docker stop mysql
sudo docker rm mysql

sudo docker run -d \
	--name mysql \
	--network net-nextcloud-mysql \
	-v /mnt/data/nextcloud-mysql:/var/lib/mysql \
	mariadb

sudo docker run -d \
	-v /mnt/data/nextcloud:/var/www/html \
	--name nextcloud \
	--network net-nextcloud-mysql \
	-p 3080:80 \
	nextcloud
