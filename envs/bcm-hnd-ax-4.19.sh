#!/bin/bash
sudo ln -sf ~/am-toolchains/brcm-arm-hnd /opt/toolchains

export LD_LIBRARY_PATH=$LD_LIBRARY:/opt/toolchains/crosstools-arm-gcc-9.2-linux-4.19-glibc-2.30-binutils-2.32/usr/lib
export TOOLCHAIN_BASE=/opt/toolchains
export PATH=$PATH:/opt/toolchains/crosstools-aarch64-gcc-9.2-linux-4.19-glibc-2.30-binutils-2.32/usr/bin
export PATH=$PATH:/opt/toolchains/crosstools-arm-gcc-9.2-linux-4.19-glibc-2.30-binutils-2.32/usr/bin