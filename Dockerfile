FROM ubuntu:18.04
LABEL maintainer="Steve Tsang <mylagimail2004@yahoo.com>"

USER root
# Install all OS dependencies for notebook server that starts but lacks all
# features (e.g., download as all possible file formats)
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get -yq dist-upgrade \
 && apt-get install -yq --no-install-recommends \
    build-essential \
    apt-utils \
    wget \
    nano \
    curl \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
 
WORKDIR /opt/
RUN wget --no-check-certificate http://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/2.10.4/sratoolkit.2.10.4-ubuntu64.tar.gz
RUN tar -xzf sratoolkit.2.10.4-ubuntu64.tar.gz
WORKDIR /opt/sratoolkit.2.10.4-ubuntu64
ENV PATH "$PATH:/opt//sratoolkit.2.10.4-ubuntu64/bin/"
