#!/bin/sh
set -eu

PORT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
SOURCE_DIR="$PORT_DIR/source"
: "${MIPS_PREFIX:?Set MIPS_PREFIX to the target MIPS Linux toolchain prefix, including the trailing dash}"
: "${SYSROOT:?Set SYSROOT to the target Linux sysroot}"

CC=${CC:-${MIPS_PREFIX}gcc}
CXX=${CXX:-${MIPS_PREFIX}g++}
STRIP=${STRIP:-${MIPS_PREFIX}strip}
LUA_DIR="$SOURCE_DIR/vendor/lua-5.1.5/src"
TMP_DIR=$(mktemp -d)
trap 'rm -rf "$TMP_DIR"' EXIT HUP INT TERM

COMMON_FLAGS="-O3 -fPIC -G0 -mips32r2 -mtune=74kc -mhard-float -mfp32 -EL --sysroot=$SYSROOT -DSCREEN_WIDTH=320 -DSCREEN_HEIGHT=240 -I$SOURCE_DIR/include -I$SOURCE_DIR/vendor -I$LUA_DIR -I$SOURCE_DIR/libretro"
C_FLAGS="$COMMON_FLAGS -ffast-math -funroll-loops -fomit-frame-pointer -fno-math-errno -fno-trapping-math -ffunction-sections -fdata-sections"
CXX_FLAGS="$C_FLAGS -std=gnu++11 -fno-strict-aliasing"
OBJECTS=

for source in "$LUA_DIR"/*.c; do
    case "${source##*/}" in lua.c|luac.c|print.c) continue ;; esac
    object="$TMP_DIR/lua_$(basename "${source%.c}").o"
    "$CC" $C_FLAGS -c "$source" -o "$object"
    OBJECTS="$OBJECTS $object"
done

for source in "$SOURCE_DIR/vendor/miniz.c" "$SOURCE_DIR/vendor/bit.c"; do
    object="$TMP_DIR/vendor_$(basename "${source%.c}").o"
    "$CC" $C_FLAGS -c "$source" -o "$object"
    OBJECTS="$OBJECTS $object"
done

for source in "$SOURCE_DIR"/src/*.cpp "$SOURCE_DIR/libretro/libretro_core.cpp"; do
    object="$TMP_DIR/$(basename "$(dirname "$source")")_$(basename "${source%.cpp}").o"
    "$CXX" $CXX_FLAGS -c "$source" -o "$object"
    OBJECTS="$OBJECTS $object"
done

# shellcheck disable=SC2086
"$CXX" --sysroot="$SYSROOT" -shared -Wl,--no-undefined -Wl,-Bsymbolic-functions \
    -mips32r2 -mtune=74kc -mhard-float -mfp32 -EL \
    -o "$TMP_DIR/ddlc_libretro.so" $OBJECTS -lm
"$STRIP" "$TMP_DIR/ddlc_libretro.so"
cp "$TMP_DIR/ddlc_libretro.so" "$PORT_DIR/ddlc_libretro.so"
