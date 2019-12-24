#!/bin/bash

my_domain="$1"

sudo apt-get update && sudo apt-get -qqy install certbot python-certbot-apache
sudo certbot certonly --apache -d "$my_domain"

