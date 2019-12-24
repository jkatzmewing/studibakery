#!/bin/bash

./common/packages.sh

./host/docker-setup-debian.sh
./host/apache/apache2-setup-debian.sh "hottestgirlinthe.club"
./host/certbot/cert-setup.sh "hottestgirlinthe.club"

./nextcloud/nextcloud-mysql-docker-setup.sh "17" "/mnt/data"
