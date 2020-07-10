FROM ubuntu:bionic

LABEL "version"="1.0.0"
LABEL "repository"="https://github.com/aabadie/riot-action"
LABEL "homepage"="https://github.com/aabadie/riot-action"
LABEL "maintainer"="Alexandre Abadie <alexandre.abadie@inria.fr>"

LABEL "com.github.actions.name"="GitHub Action for RIOT-OS"
LABEL "com.github.actions.description"="GitHub Action for RIOT-OS static tests."
LABEL "com.github.actions.icon"="package"
LABEL "com.github.actions.color"="blue"

ENV DEBIAN_FRONTEND noninteractive

ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8

RUN \
    dpkg --add-architecture i386 >&2 && \
    apt-get update && \
    apt-get -y --no-install-recommends install \
        autoconf \
        automake \
        build-essential \
        cmake \
        coccinelle \
        curl \
        cppcheck \
        doxygen \
        git \
        graphviz \
        libhidapi-dev \
        libtool \
        libusb-1.0-0-dev \
        libudev-dev \
        pcregrep \
        python3 \
        python3-pip \
        python3-setuptools \
        python3-wheel \
        vera++ \
        wget \
        xsltproc && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY requirements.txt /tmp/requirements.txt
RUN pip3 install --no-cache-dir -r /tmp/requirements.txt && \
    rm -f /tmp/requirements.txt

COPY entrypoint.sh /

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "--help" ]
