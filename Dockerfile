FROM capd/capd-builder-ubuntu_x86:5.0.64

ARG DOCKER_TAG
ENV CAPD_VERSION=${DOCKER_TAG}
LABEL CAPD_VERSION=${CAPD_VERSION}

RUN mkdir /tmp/capd/ /workdir
WORKDIR "/tmp/capd"


RUN curl -L https://sourceforge.net/projects/capd/files/${CAPD_VERSION}/bin/capd-${CAPD_VERSION}-dev-ubuntu_x86-x86_64.tar.gz/download -o capd-${CAPD_VERSION}-dev-ubuntu_x86-x86_64.tar.gz && curl -L http://svn.capdnet.ii.uj.edu.pl/capdRedHom/examples/apiRedHom/CubicalBettiNumbers.cpp -o CubicalBettiNumbers.cpp

ADD install.sh .
RUN ./install.sh

RUN cd / && rm -fr /tmp/capd

WORKDIR /workdir
CMD bash
