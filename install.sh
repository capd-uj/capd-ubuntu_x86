#!/bin/bash

set -e

tar xzf capd-${CAPD_VERSION}-dev-ubuntu_x86-x86_64.tar.gz  --strip-components=1 -C /
echo /usr/local/lib >> /etc/ld.so.conf.d/local.conf
ldconfig

g++ CubicalBettiNumbers.cpp $(capdRedHom-config --libs --cflags) -o CubicalBettiNumbers
./CubicalBettiNumbers
