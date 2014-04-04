#!/bin/bash

# Note trailing - is intentional
TARGET="${JB_TARGET}-"

export CC="${TARGET}gcc"
export CXX="${TARGET}g++"
export AR="${TARGET}ar"
export AS="${TARGET}as"
export LD="${TARGET}ld"
export RANLIB="${TARGET}ranlib"
export READELF="${TARGET}readelf"
export STRIP="${TARGET}strip"
