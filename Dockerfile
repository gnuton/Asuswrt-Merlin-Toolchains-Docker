FROM ubuntu:focal
MAINTAINER Antonio Aloisio <gnuton@gnuton.org>

#ENV PATH ${PATH}:/opt/brcm-arm/bin:
ENV DEBIAN_FRONTEND noninteractive
#ENV LANG en_US.UTF-8
#ENV LC_ALL en_US.UTF-8
#ENV LANGUAGE en_US:en


ENV TOOLCHAIN_BASE /opt/toolchains
ENV LANG C.UTF-8
ENV TERM xterm-256color


WORKDIR /build

RUN \
    dpkg --add-architecture i386 && \
    apt update && \
    apt -y install curl vim sudo git libtool-bin cmake libproxy-dev uuid-dev liblzo2-dev autoconf automake bash bison \
    bzip2 diffutils file flex m4 g++ gawk groff-base libncurses5-dev libtool libslang2 make patch perl pkg-config shtool \
    subversion tar texinfo zlib1g zlib1g-dev git gettext libexpat1-dev libssl-dev cvs gperf unzip \
    python libxml-parser-perl gcc-multilib gconf-editor libxml2-dev g++-multilib gitk libncurses5 mtd-utils \
    libncurses5-dev libvorbis-dev git autopoint autogen sed build-essential intltool libglib2.0-dev \
    xutils-dev lib32z1-dev lib32stdc++6 xsltproc gtk-doc-tools automake-1.15 locales libelf1:i386 gosu bc && \
    rm -rf /var/lib/apt/lists/*;


RUN ln -s bash /bin/sh.bash && \
    mv /bin/sh.bash /bin/sh

RUN useradd -m docker && echo "docker:docker" | chpasswd && adduser docker sudo

RUN echo "Setting up toolchains" && \
    ln -s /home/docker/am-toolchains/brcm-arm-hnd /opt/toolchains && \
    ln -s /home/docker/am-toolchains/brcm-arm-sdk/hndtools-arm-linux-2.6.36-uclibc-4.5.3 /opt/brcm-arm && \
    gosu docker bash -c 'cd ~ && \
    git clone https://github.com/RMerl/am-toolchains && \
    echo "export LD_LIBRARY_PATH=$LD_LIBRARY:/opt/toolchains/crosstools-arm-gcc-5.3-linux-4.1-glibc-2.22-binutils-2.25/usr/lib" >> ~/.profile && \
    echo "export TOOLCHAIN_BASE=/opt/toolchains" >> ~/.profile && \
    echo "PATH=\$PATH:/opt/toolchains/crosstools-arm-gcc-5.3-linux-4.1-glibc-2.22-binutils-2.25/usr/bin" >> ~/.profile && \
    echo "PATH=\$PATH:/opt/toolchains/crosstools-aarch64-gcc-5.3-linux-4.1-glibc-2.22-binutils-2.25/usr/bin" >> ~/.profile && \
    echo "export LD_LIBRARY_PATH=$LD_LIBRARY:/opt/toolchains/crosstools-arm-gcc-5.5-linux-4.1-glibc-2.26-binutils-2.28.1/usr/lib" >> ~/.profile && \
    echo "PATH=\$PATH:/opt/toolchains/crosstools-arm-gcc-5.5-linux-4.1-glibc-2.26-binutils-2.28.1/usr/bin" >> ~/.profile && \
    echo "PATH=\$PATH:/opt/toolchains/crosstools-aarch64-gcc-5.5-linux-4.1-glibc-2.26-binutils-2.28.1/usr/bin" >> ~/.profile && \
    echo "PATH=\$PATH:/opt/brcm-arm/bin" >> ~/.profile;'

USER docker:docker
