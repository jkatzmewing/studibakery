#!/bin/bash

if grep -i ubuntu /proc/version; then
	# Docker is included in the Ubuntu repos :)
	sudo apt-get update
	sudo apt-get install docker.io
else # Assume we're on Debian
	# Docker repo key
	curl -fsSL "https://download.docker.com/linux/$distro/gpg" | sudo apt-key add -
	# Verify to the user that the key installed correctly
	# See the docs at:
	# https://docs.docker.com/install/linux/docker-ce/debian/#set-up-the-repository
	if [ "$distro" = "debian" ]; then
		sudo apt-key fingerprint 0EBFCD88
		# Add and enable the repo
		sudo add-apt-repository \
			"deb [arch=amd64] https://download.docker.com/linux/debian \
			$(lsb_release -cs) \
			stable"
	elif [ "$distro" = "ubuntu" ]; then


	sudo apt-get update
	sudo apt-get install -y docker-ce
fi
