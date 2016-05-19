#! /bin/bash

sudo apt-get update

# Add certificates for HTTPS access
sudo apt-get install apt-transport-https ca-certificates

# GPG Key addition
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

sudo sh -c 'echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" >> /etc/apt/sources.list.d/docker.list'
echo "<======== KEYS ADDED ========>"

sudo apt-get update
sudo apt-get purge lxc-docker*
sudo apt-cache policy docker-engine
echo "<===========  OLD DOCKER REMOVED =======>"

sudo apt-get update
sudo apt-get install linux-image-extra-$(uname -r)
echo "<========  LINUX UPDATE DONE ========>"

# Needed for Ubuntu 14.04
sudo apt-get install apparmor
echo "<======== apparmor INSTALLED ========>"

sudo apt-get update
sudo apt-get install docker-engine
echo "<========= DOCKER INSTALLED ===========>"

sudo docker run hello-world
echo "<======== SAMPLE DOCKER APP CHECKED =======>"

sudo usermod -aG docker $(whoami)
echo "<======== USER added to DOCKER group =====>"

# Docker compose installation
sudo curl -L https://github.com/docker/compose/releases/download/1.7.0/docker-compose-`uname -s`-`uname -m` > ~/docker-compose
sudo mv ~/docker-compose /usr/local/bin
sudo chmod +x /usr/local/bin/docker-compose
