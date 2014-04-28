#!/bin/bash

# -------------------------------------------------------------------
# Runs datomic on pre-built image

IMAGE=tauho/datomic-free
TAG=0.9.4699
IN_PORT=4334 # guest's side port
OUT_PORT=4334 # port on host

sudo docker run -d -n=true -p $IN_PORT:$OUT_PORT $IMAGE:$TAG

