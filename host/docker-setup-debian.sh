#!/bin/bash

sudo apt-get update
sudo apt-get dist-upgrade

# Prereqs
sudo apt-get install -y \
	apt-transport-https \
	bash-completion \
	ca-certificates \
	certbot \
	cron-apt \
	dirmngr \
	fail2ban \
	git \
	gnupg2 \
	software-properties-common

# Docker repo key
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
# Verify to the user that the key installed correctly
# See the docs at:
# https://docs.docker.com/install/linux/docker-ce/debian/#set-up-the-repository
sudo apt-key fingerprint 0EBFCD88
# Add and enable the repo
sudo add-apt-repository \
	"deb [arch=amd64] https://download.docker.com/linux/debian \
	$(lsb_release -cs) \
	stable"

sudo apt-get update
sudo apt-get install -y docker-ce
