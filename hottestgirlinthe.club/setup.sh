#!/bin/bash

./common/packages.sh

./host/docker/setup.sh
./host/apache/setup.sh "hottestgirlinthe.club"
./host/certbot/setup.sh "hottestgirlinthe.club"

./nextcloud/setup.sh "17" "/mnt/data"
