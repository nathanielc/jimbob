#!/bin/bash

# Get root dir
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Disable bash hashing so path updates are immediate
set +h

# Set umask
umask 022

# Export paths
export JB_ROOT_FS=$DIR/rootfs
export JB_CT_SRC=$DIR/ct_sources
export JB_SRC=$DIR/sources
export JB_FW=$DIR/firmware
export JB_TOOLS=$DIR/tools
export JB_CROSS_TOOLS=$DIR/cross-tools
export LC_ALL=POSIX
export PATH=${JB_CROSS_TOOLS}/bin:/bin:/usr/bin

# Unset compile flags
unset CFLAGS
unset CXXFLAGS

# Export arch info
export JB_ABI="aapcs-linux"
export JB_HOST=$(echo ${MACHTYPE} | sed "s/-[^-]*/-cross/")
export JB_TARGET="arm-unknown-linux-uclibcgnueabi"
export JB_ARCH="arm"
export JB_ENDIAN="little"
export JB_ARM_ARCH="armv6zk"
export JB_ARM_MODE="arm"
export JB_FLOAT="hard"
export JB_FPU="vfp"

# Number of jobs make can run in parallel
if [ $1 ]
then
	export JB_N_JOBS=$1
else
	export JB_N_JOBS=1
fi
