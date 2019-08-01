#!/bin/bash

CAPD_VERSION=5.1.1
IMAGE=capd/capd-ubuntu_x86:${CAPD_VERSION}

docker run --rm -ti  --volume $PWD:$PWD --workdir $PWD --user $(id -u):$(id -g) $IMAGE $*
