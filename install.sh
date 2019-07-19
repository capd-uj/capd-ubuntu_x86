#!/bin/bash

set -e
set -x

echo "CAPD_VERSION: ${CAPD_VERSION}, DOCKER_TAG: ${DOCKER_TAG}"

curl -L https://sourceforge.net/projects/capd/files/${CAPD_VERSION}/bin/capd-${CAPD_VERSION}-dev-ubuntu_x86-x86_64.tar.gz/download -o capd-${CAPD_VERSION}-dev-ubuntu_x86-x86_64.tar.gz
curl -L http://svn.capdnet.ii.uj.edu.pl/capdRedHom/examples/apiRedHom/CubicalBettiNumbers.cpp -o CubicalBettiNumbers.cpp

tar xzf capd-${CAPD_VERSION}-dev-ubuntu_x86-x86_64.tar.gz  --strip-components=1 -C /
echo /usr/local/lib >> /etc/ld.so.conf.d/local.conf
ldconfig

g++ CubicalBettiNumbers.cpp $(capdRedHom-config --libs --cflags) -o CubicalBettiNumbers
./CubicalBettiNumbers
