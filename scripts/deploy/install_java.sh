#!/bin/bash

#--------------------------------------------------------------------
# Installs the java onto Vagrant host image
# source: http://www.webupd8.org/2012/09/install-oracle-java-8-in-ubuntu-via-ppa.html
#
# Maintainer: Timo Sulg, timo@tauho.com
# version: 1.0
#

# add new APT source for Oracle's JDK
echo "Adding Oracle JDK into APT sources"
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update

#autoaccept quirky license info
echo "Going to install java"
echo debconf shared/accepted-oracle-license-v1-1 select true | \
    sudo debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | \
    sudo debconf-set-selections
#echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections

sudo apt-get -y install oracle-java7-installer

#set JAVA environment variables
sudo apt-get -y install oracle-java7-set-default

# print out installed Java version
#java -version
