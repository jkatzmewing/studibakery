#!/bin/bash

./common/packages.sh

./host/docker/setup.sh
./host/apache/setup.sh "hottestgirlinthe.club"
./host/certbot/setup.sh "hottestgirlinthe.club"

./nextcloud/setup.sh "18" "/mnt/data"

# Set correct hostname in Nextcloud
sudo docker exec --user www-data nextcloud php occ config:system:set overwritehost --value="hottestgirlinthe.club:443"
sudo docker exec --user www-data nextcloud php occ config:system:set overwriteprotocol --value="https"
sudo docker restart nextcloud
