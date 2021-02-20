#!/bin/bash

sudo apt-get update && sudo apt-get -qqy dist-upgrade

./bin/occ.sh maintenance:mode --on
./nextcloud/upgrade.sh "21" "/mnt/data"
sleep 3 # give things time to settle so turning off maintenance mode succeeds
./bin/occ.sh maintenance:mode --off

./gitea/upgrade.sh "1.13" "/mnt/data"
