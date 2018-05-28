#!/bin/bash
# Set up local Nextcloud (with SQLite) for use over SSH tunnels

sudo docker pull nextcloud
sudo mkdir -p /mnt/data/nextcloud
sudo docker run -d \
	-v /mnt/data/nextcloud:/var/www/html \
	--name nextcloud \
	-p 3080:80 \
	nextcloud
