FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install -y wget && \
    apt-get install -y build-essential && \
    apt-get install zlib1g-dev && \
    apt-get install -y libbz2-dev && \
    apt-get install liblzma-dev

RUN wget https://github.com/samtools/bcftools/releases/download/1.9/bcftools-1.9.tar.bz2 && \
    tar -vxjf bcftools-1.9.tar.bz2

WORKDIR /bcftools-1.9
RUN ./configure --prefix=/usr/bin/bcftools && \
    make && \
    make install

ENV PATH="$PATH:/usr/bin/bcftools/bin"
