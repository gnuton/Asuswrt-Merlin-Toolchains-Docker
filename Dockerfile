FROM ubuntu:16.04
MAINTAINER Antonio Aloisio <gnuton@gnuton.org>

ENV PATH ${PATH}:/opt/brcm-arm/bin:
ENV DEBIAN_FRONTEND noninteractive
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV LANGUAGE en_US:en

WORKDIR /build

RUN \
    dpkg --add-architecture i386 && \
    apt update && \
    apt install -y locales libmpc*:i386 libtool-bin cmake libproxy-dev uuid-dev liblzo2-dev autoconf automake bash bison bzip2 diffutils file flex m4 g++ gawk groff-base libncurses-dev libtool libslang2 make patch perl pkg-config shtool subversion tar texinfo zlib1g zlib1g-dev git-core gettext libexpat1-dev libssl-dev cvs gperf unzip python libxml-parser-perl gcc-multilib gconf-editor libxml2-dev g++-multilib libncurses5 mtd-utils libncurses5-dev libvorbis-dev git autopoint autogen sed build-essential intltool libelf1 libglib2.0-dev xutils-dev lib32z1-dev lib32stdc++6 xsltproc gtk-doc-tools libelf1:i386 tzdata && \
    ln -s /usr/lib/i386-linux-gnu/libmpc.so.3.0.0 /usr/lib/i386-linux-gnu/libmpc.so.2 && \
    ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime && \
    dpkg-reconfigure --frontend noninteractive tzdata && \
    sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8 && \
    cd /opt && \
    git clone --single-branch -b master https://github.com/RMerl/am-toolchains && \
    ln -s $PWD/am-toolchains/brcm-arm-sdk/hndtools-arm-linux-2.6.36-uclibc-4.5.3 /opt/brcm-arm && \
    echo "PATH=$PATH:/opt/brcm-arm/bin" >> ~/.profile \
