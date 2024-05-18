#!/bin/bash
sudo ln -sf ~/am-toolchains/brcm-arm-hnd /opt/toolchains

#export LD_LIBRARY_PATH=$LD_LIBRARY:/opt/toolchains/crosstools-arm-gcc-10.3-linux-4.19-glibc-2.32-binutils-2.36.1/usr/lib
export LD_LIBRARY_PATH=$LD_LIBRARY:/opt/toolchains/crosstools-arm_softfp-gcc-10.3-linux-4.19-glibc-2.32-binutils-2.36.1/usr/lib
export TOOLCHAIN_BASE=/opt/toolchains
export PATH=$PATH:/opt/toolchains/crosstools-aarch64-gcc-10.3-linux-4.19-glibc-2.32-binutils-2.36.1/usr/bin
#export PATH=$PATH:/opt/toolchains/crosstools-arm-gcc-10.3-linux-4.19-glibc-2.32-binutils-2.36.1/usr/bin
export PATH=$PATH:/opt/toolchains/crosstools-arm_softfp-gcc-10.3-linux-4.19-glibc-2.32-binutils-2.36.1/usr/bin

