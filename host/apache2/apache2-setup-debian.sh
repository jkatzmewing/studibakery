#!/bin/bash

my_domain="$1"

sudo apt-get update
sudo apt-get install apache2

sudo a2dissite 000-default default-ssl
sudo a2enmod ssl proxy proxy_http headers

resource_dir="host/apache2/resources"
sudo cp "$resource_dir"/"$my_domain".conf /etc/apache2/sites-available
sudo systemctl reload apache2
