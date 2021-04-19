#!/bin/bash

./common/packages.sh

./host/docker/setup.sh

./host/certbot/setup.sh "hottestgirlinthe.club"
./host/certbot/setup.sh "janalexandrakatz.com"

./host/apache2/setup.sh "hottestgirlinthe.club"
./host/apache2/setup.sh "janalexandrakatz.com"

./nextcloud/setup.sh "21" "/mnt/data"
./gitea/setup.sh "1.14" "/mnt/data"

# Set correct hostname in Nextcloud
sudo docker exec --user www-data nextcloud php occ config:system:set overwritehost --value="hottestgirlinthe.club:443"
sudo docker exec --user www-data nextcloud php occ config:system:set overwriteprotocol --value="https"
sudo docker restart nextcloud
