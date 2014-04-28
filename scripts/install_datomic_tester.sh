#!/bin/bash

#--------------------------------------------------------------------
# Install Leiningen and sets up datomic-tester to test functionality
#
# Maintainer: Timo Sulg, timo@tauho.com
# version: 1.0

HOME_PATH=/home/vagrant
LEININGEN_URL=https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein
DATOMIC_TESTER_URL=https://github.com/tauho/datomic_tester

# install prerequirements
sudo apt-get -y install curl nmap git

# install Leiningen

mkdir $HOME_PATH/bin
curl --output $HOME_PATH/bin/lein --location $LEININGEN_URL
sudo chmod a+x $HOME_PATH/bin/lein
echo "PATH=${HOME_PATH}:$PATH" >> $HOME_PATH/.bashrc
source $HOME_PATH/.bashrc

#clone tester repository
git clone $DATOMIC_TESTER_URL $HOME_PATH/datomic_tester

