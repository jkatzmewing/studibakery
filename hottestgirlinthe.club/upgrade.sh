#!/bin/bash

sudo apt-get update && sudo apt-get -qqy dist-upgrade

./bin/occ.sh maintenance:mode --on
./nextcloud/upgrade.sh "18" "/mnt/data"
./bin/occ.sh maintenance:mode --off
