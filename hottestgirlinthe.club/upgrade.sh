#!/bin/bash

sudo apt-get update && sudo apt-get -qqy dist-upgrade

./nextcloud/upgrade.sh "18" "/mnt/data"
