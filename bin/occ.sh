#!/bin/bash
sudo docker exec --user www-data nextcloud php occ "$@"
