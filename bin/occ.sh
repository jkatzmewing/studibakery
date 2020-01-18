#!/bin/bash
sudo docker exec -ti --user www-data nextcloud php occ "$@"
