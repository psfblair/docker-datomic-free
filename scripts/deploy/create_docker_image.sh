#!/bin/bash

# -------------------------------------------------------------------
# Creates new version of docker image based on Dockerfile
# Default location of Dockerfile is /docker_data/Dockerfile

# Before executing this be sure that build was successful

DOCKERFILE_PATH=/docker_data/Dockerfile
REPOSITORY=tauho
IMAGE_NAME=datomic-free

VERSION_TAG=0.9.4699
REPO_TAG=latest

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

