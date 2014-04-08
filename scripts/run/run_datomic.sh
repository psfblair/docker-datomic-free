#!/bin/bash

# -------------------------------------------------------------------
# Runs datomic on pre-built image

IMAGE=tauho/datomic-free
TAG=0.9.4699

sudo docker run -d -n=true $IMAGE:$TAG

