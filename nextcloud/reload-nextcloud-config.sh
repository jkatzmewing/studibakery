#!/bin/bash
# Upgrade Nextcloud container, refresh config, and respawn

sudo docker pull nextcloud

sudo docker stop nextcloud
sudo docker rm nextcloud

sudo cp nextcloud/resources/config.php \
	/mnt/data/nextcloud/config/config.php

sudo docker run -d \
	-v /mnt/data/nextcloud:/var/www/html \
	--name nextcloud \
	--network net-nextcloud-mysql \
	-p 3080:80 \
	nextcloud
