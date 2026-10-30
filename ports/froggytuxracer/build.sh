#!/bin/sh
set -eu

PORT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
SOURCE_DIR="$PORT_DIR/source"
: "${MIPS_PREFIX:?Set MIPS_PREFIX to the MIPS Linux toolchain prefix, including the trailing dash}"
: "${SYSROOT:?Set SYSROOT to the target Linux sysroot}"
CC=${CC:-${MIPS_PREFIX}gcc}
STRIP=${STRIP:-${MIPS_PREFIX}strip}
TMP_DIR=$(mktemp -d)
trap 'rm -rf "$TMP_DIR"' EXIT HUP INT TERM

"$CC" -std=gnu11 -O2 -fPIC \
    -mips32r2 -mtune=74kc -mhard-float -mfp32 -EL \
    --sysroot="$SYSROOT" \
    -I"$SOURCE_DIR/include" -I"$SOURCE_DIR/src" \
    -shared -Wl,--no-undefined \
    -o "$TMP_DIR/tuxracer_libretro.so" "$SOURCE_DIR"/src/*.c -lm
"$STRIP" "$TMP_DIR/tuxracer_libretro.so"

cp "$TMP_DIR/tuxracer_libretro.so" "$PORT_DIR/tuxracer_libretro.so"
mkdir -p "$PORT_DIR/assets"
cp -a "$SOURCE_DIR/assets/." "$PORT_DIR/assets/"
