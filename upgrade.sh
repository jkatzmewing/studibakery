#!/bin/bash

sudo apt-get update && sudo apt-get -qqy dist-upgrade

./bin/occ.sh maintenance:mode --on
./nextcloud/upgrade.sh "latest" "/mnt/data"
sleep 3 # give things time to settle so turning off maintenance mode succeeds
./bin/occ.sh maintenance:mode --off

./gitea/upgrade.sh "1.16" "/mnt/data"
