#!/bin/bash

# -------------------------------------------------------------------
# Creates new version of docker image based on Dockerfile
# Default location of Dockerfile is /docker_data/Dockerfile

# Before executing this be sure that build was successful

DOCKERFILE_PATH=/docker_data/Dockerfile
REPOSITORY=tauho
IMAGE_NAME=datomic-free

VERSION_TAG=0.9.5344
REPO_TAG=latest

# create data folder on host
mkdir /root/datomic_data
mkdir /root/datomic_configs

#copy datomic configs from mounted volumes into vagrant datasystem
# because vagrant mounts volumes later than scripts are running

cp -r /datomic_configs /root/datomic_configs

# build new image
sudo docker build\
  --no-cache --rm=true\
  --tag=$REPOSITORY/$IMAGE_NAME:$VERSION_TAG\
  - < $DOCKERFILE_PATH

#authorize on index.docker.org
#sudo docker login
#push a repository to it's registry
# NB! Be sure that image is working before committing
#sudo docker push $REPOSITORY/$IMAGE_NAME
