
_cross_compile="$_target-"
export CC="${_cross_compile}gcc"
export CXX="${_cross_compile}g++"
export AR="${_cross_compile}ar"
export AS="${_cross_compile}as"
export LD="${_cross_compile}ld"
export RANLIB="${_cross_compile}ranlib"
export READELF="${_cross_compile}readelf"
export STRIP="${_cross_compile}strip"

export PATH=$_ct_gcc_path:$PATH
