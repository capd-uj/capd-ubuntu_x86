FROM capd/capd-builder-ubuntu_x86:5.0.64

ARG DOCKER_TAG
ENV CAPD_VERSION=${DOCKER_TAG}
LABEL CAPD_VERSION=${CAPD_VERSION}

RUN mkdir /tmp/capd/ /workdir
WORKDIR "/tmp/capd"

ADD install.sh .
RUN ./install.sh

RUN cd / && rm -fr /tmp/capd

WORKDIR /workdir
CMD bash
