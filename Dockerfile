FROM ubuntu:18.04
LABEL maintainer="Steve Tsang <mylagimail2004@yahoo.com>"

USER root
# Install all OS dependencies for notebook server that starts but lacks all
# features (e.g., download as all possible file formats)
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get -yq dist-upgrade \
 && apt-get install -yq --no-install-recommends \
    build-essential \
    gcc-multilib \
    apt-utils \
    autotools-dev \
    autoconf \
    autogen \
    automake \
    zlib1g-dev \
    vim-common \
    libncurses5-dev \
    autotools-dev \
    autoconf \
    perl \
    r-base \
    python \
    python-pip \
    libbz2-dev \
    liblzma-dev \
    libz-dev \
    ncurses-dev \
    libcurl3 \
    libcurl4-openssl-dev \
    libxml2-dev \
    wget \
    bzip2 \
    ca-certificates \
    sudo \
    locales \
    fonts-liberation \
    python3 \
    python3-pip \
    pkg-config \
    python-dev \
    graphviz \
    libgraphviz-dev \ 
    libtool \
    libgd-gd2-perl \
    nano \
    curl \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
 
WORKDIR /opt/
RUN wget http://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/2.10.4/sratoolkit.2.10.4-ubuntu64.tar.gz
RUN tar sratoolkit.2.10.4-ubuntu64.tar.gz
WORKDIR /opt//sratoolkit.2.10.4-ubuntu64
ENV PATH "$PATH:/opt//sratoolkit.2.10.4-ubuntu64/bin/"
