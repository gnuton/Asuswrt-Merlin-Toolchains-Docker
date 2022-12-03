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
RUN apt-get update
RUN apt-get -y dist-upgrade
RUN dpkg --add-architecture i386
RUN apt-get update
#RUN apt-get -y install "linux-headers-$(uname -r)"
RUN apt-get -y install lib32ncurses-dev dos2unix libtool-bin cmake libproxy-dev uuid-dev liblzo2-dev autoconf automake bash bison bzip2 diffutils file flex m4 g++ gawk groff-base libncurses5-dev libtool libslang2 make patch perl pkg-config shtool subversion tar texinfo zlib1g zlib1g-dev git gettext libexpat1-dev libssl-dev cvs gperf unzip python2 libxml-parser-perl gcc-multilib libxml2-dev g++-multilib gitk libncurses5 mtd-utils libvorbis-dev autopoint autogen sed build-essential intltool libelf1 libglib2.0-dev xutils-dev lib32z1-dev lib32stdc++6 xsltproc gtk-doc-tools libelf-dev:i386 libelf1:i386 libltdl-dev openssh-server curl nano lzip patchelf automake
RUN apt-get -y install gosu bc rsync sudo xxd
RUN apt -y autoremove
RUN rm -rf /var/lib/apt/lists/*
#RUN usermod -aG sudo docker && \

RUN ln -s bash /bin/sh.bash && \
    mv /bin/sh.bash /bin/sh

RUN echo "root:docker" | chpasswd
RUN useradd -m docker && \
    echo "docker:docker" | chpasswd && adduser docker sudo && \
    echo "docker ALL=(ALL:ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/docker

RUN echo "Setting up toolchains" && \
    gosu docker bash -c 'cd ~ && git clone https://github.com/RMerl/am-toolchains' && \
    ln -s /home/docker/am-toolchains/brcm-arm-hnd /opt/toolchains

USER docker:docker
