#!/bin/bash

ln -sf ~/am-toolchains/brcm-arm-sdk/hndtools-arm-linux-2.6.36-uclibc-4.5.3 /opt/brcm-arm

export LD_LIBRARY_PATH=$LD_LIBRARY:/opt/brcm-arm/lib
export PATH=$PATH:/opt/brcm-arm/bin
