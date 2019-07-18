#!/bin/bash

CAPD_VERSION=5.0.64
IMAGE=capd/capd-ubuntu_x86:${CAPD_VERSION}

docker run --rm -ti  --volume $PWD:$PWD --workdir $PWD $IMAGE $*
