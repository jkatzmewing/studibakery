#!/bin/bash

my_domain="$1"

sudo apt-get update && sudo apt-get -qqy install certbot
sudo certbot certonly --standalone -d "$my_domain"

