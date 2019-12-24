#!/bin/bash

./common/packages.sh

./host/docker/setup.sh
./host/apache/setup.sh "hottestgirlinthe.club"
./host/certbot/setup.sh "hottestgirlinthe.club"

./nextcloud/setup.sh "17" "/mnt/data"

# Set correct hostname in Nextcloud
sudo docker exec --user www-data nextcloud php occ config:system:set overwritehost --value="hottestgirlinthe.club:443"
sudo docker stop nextcloud && sudo docker start nextcloud