#!/bin/bash
# Set up local Nextcloud with SQLite

sudo docker pull nextcloud

sudo mkdir -p /mnt/data/nextcloud

sudo docker network create net-nextcloud-sqlite

sudo docker run -d \
	-v /mnt/data/nextcloud:/var/www/html \
	--name nextcloud \
	--network net-nextcloud-sqlite \
	-p 3080:80 \
	nextcloud
