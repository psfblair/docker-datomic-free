#!/bin/bash

# -------------------------------------------------------------------
# Install the latest docker onto the Ubuntu 13.10
# taken from the official documentation of Docker
# http://docs.docker.io/en/latest/installation/ubuntulinux/
#
# Maintainer: Timo Sulg, timo@tauho.com
# version 1.0


# install AUFS filesystem

sudo apt-get update
sudo apt-get install linux-image-extra-`uname -r`

# install key for docker image

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9

# install docker
sudo sh -c "echo deb http://get.docker.io/ubuntu docker main\
> /etc/apt/sources.list.d/docker.list"

sudo apt-get update
sudo apt-get install -y lxc-docker

# add the docker group
sudo addgroup docker

# add the connected user to the docker group
sudo gpasswd -a vagrant docker
sudo gpasswd -a ${USER} docker
sudo service docker restart

#add fix for JVM memory allocation in the running container
#source: http://devashish.co.in/2013/09/28/docker-containers-memory-troubleshooting/
# source: https://github.com/dotcloud/docker/issues/1555

sudo dd if=/dev/zero of=/root/myswapfile bs=1M count=1024
sudo chmod 600 /root/myswapfile
sudo mkswap /root/myswapfile
sudo swapon /root/myswapfile

# fix locale issue
sudo locale-gen en_US.UTF-8

