#!/bin/bash
sudo ln -sf ~/am-toolchains/brcm-arm-hnd /opt/toolchains

export LD_LIBRARY_PATH=$LD_LIBRARY:/opt/toolchains/crosstools-arm-gcc-5.5-linux-4.1-glibc-2.26-binutils-2.28.1/usr/lib
export TOOLCHAIN_BASE=/opt/toolchains
export PATH=$PATH:/opt/toolchains/crosstools-arm-gcc-5.5-linux-4.1-glibc-2.26-binutils-2.28.1/usr/bin
export PATH=$PATH:/opt/toolchains/crosstools-aarch64-gcc-5.5-linux-4.1-glibc-2.26-binutils-2.28.1/usr/bin
