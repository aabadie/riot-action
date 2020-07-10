FROM ubuntu:18.04

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

RUN apt-get update && \
    apt-get -y --no-install-recommends install \
        autoconf \
        automake \
        build-essential \
        ca-certificates \
        cmake \
        git \
        libhidapi-dev \
        libtool \
        libudev-dev \
        libusb-1.0-0-dev \
        libusb-dev \
        pkg-config && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY entrypoint.sh /

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "--help" ]
