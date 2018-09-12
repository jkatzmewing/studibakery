#!/bin/bash

sudo apt-get update
sudo apt-get install apache2

sudo a2dissite 000-default default-ssl
sudo a2enmod ssl

resource_dir="host/apache2/resources"
sudo cp "$resource_dir"/*.{css,html} /var/www/html/
sudo cp "$resource_dir"/hottestgirlintheclub.conf /etc/apache2/sites-available
sudo systemctl reload apache2
