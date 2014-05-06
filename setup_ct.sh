#!/bin/bash

set -e
echo $JB_CROSS_TOOLS
rm -rf ${JB_CROSS_TOOLS}
mkdir -p ${JB_CROSS_TOOLS}/${JB_TARGET}
ln -sfv . ${JB_CROSS_TOOLS}/${JB_TARGET}/usr
