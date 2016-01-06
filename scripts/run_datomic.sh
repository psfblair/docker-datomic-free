#!/bin/bash

# -------------------------------------------------------------------
# Runs datomic on pre-built image
#
# Maintainer: Timo Sulg, timo@tauho.com
# Version: 1.0


IMAGE=tauho/datomic-free
TAG=0.9.5344
IN_PORT=4334 # guest's side port
OUT_PORT=4334 # port on host


echo "pulling ${IMAGE}:${TAG} from docker index"
docker pull $IMAGE:$TAG

echo "start datomic container"
CID=$(docker run -d -n=true -p $IN_PORT:$OUT_PORT $IMAGE:$TAG)

#show metainfo of the running container
docker inspect $CID
