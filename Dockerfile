FROM ubuntu:focal
LABEL maintainer="Antonio Aloisio <gnuton@gnuton.org>"

ENV DEBIAN_FRONTEND noninteractive
ENV TOOLCHAIN_BASE /opt/toolchains
#ENV LANG C.UTF-8
ENV TERM xterm-256color


WORKDIR /build

RUN \
    # Install latest packages
    apt-get -y dist-upgrade && \
    dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get -y \
      install lib32ncurses-dev dos2unix libtool-bin cmake libproxy-dev   \
      uuid-dev liblzo2-dev autoconf automake bash bison bzip2 diffutils  \
      file flex m4 g++ gawk groff-base libncurses5-dev libtool libslang2 \
      make patch perl pkg-config shtool subversion tar texinfo zlib1g    \
      zlib1g-dev git gettext libexpat1-dev libssl-dev cvs gperf unzip    \
      python2 libxml-parser-perl gcc-multilib libxml2-dev g++-multilib   \
      gitk libncurses5 mtd-utils libvorbis-dev autopoint autogen sed     \
      build-essential intltool libelf1 libglib2.0-dev xutils-dev         \ 
      lib32z1-dev lib32stdc++6 xsltproc gtk-doc-tools libelf-dev:i386    \
      libelf1:i386 libltdl-dev openssh-server curl nano lzip patchelf    \
      automake gosu bc rsync sudo xxd && \

    # Clean up env
    apt -y autoremove && \
    apt -y autoclean && \

    # Set bash as default shell
    ln -s bash /bin/sh.bash && \
    mv /bin/sh.bash /bin/sh && \

    # Set "docker" as root password
    echo "root:docker" | chpasswd && \

    # Adds docker user
    useradd -m docker && \
    echo "docker:docker" | chpasswd && adduser docker sudo && \
    echo "docker ALL=(ALL:ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/docker && \

    # Sets up toolchains
    gosu docker bash -c 'cd ~ && git clone https://github.com/RMerl/am-toolchains'


COPY envs /home/docker/envs
RUN chown docker /home/docker/envs/* && \
    chmod 755    /home/docker/envs/*

RUN echo '[ ! -z "$TERM" -a -r /etc/motd ] && cat /etc/motd' \
    >> /etc/bash.bashrc \
    ; echo "This Docker image would allow you to build AsusWRT firmware." > /etc/motd \
    ; echo "To initialize correctly the env, please run" >> /etc/motd \
    ; echo " 'source /home/docker/envs/[bcm-hnd-802.11ax.sh, bcm-hnd.sh, bcm-sdk.sh]'" >> /etc/motd

# Set docker as default
USER docker:docker

CMD ["bash"]
