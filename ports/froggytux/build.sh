#!/bin/sh
set -eu

PORT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
SOURCE_DIR="$PORT_DIR/source"
: "${MIPS_PREFIX:?Set MIPS_PREFIX to the MIPS Linux toolchain prefix, including the trailing dash}"
: "${SYSROOT:?Set SYSROOT to the toolchain sysroot root, before its mipsel-r2-hard directory}"

CC="${MIPS_PREFIX}gcc"
CXX="${MIPS_PREFIX}g++"
STRIP="${MIPS_PREFIX}strip"
TMP_DIR=$(mktemp -d)
trap 'rm -rf "$TMP_DIR"' EXIT HUP INT TERM
cp -a "$SOURCE_DIR/platform" "$TMP_DIR/platform"
cp "$SOURCE_DIR/src/supertux.cpp" "$TMP_DIR/supertux.cpp"
cp "$SOURCE_DIR/src/title.cpp" "$TMP_DIR/title.cpp"
patch -d "$TMP_DIR" -p1 < "$PORT_DIR/hardfloat-fiber.patch"
patch -d "$TMP_DIR" -p1 < "$PORT_DIR/title-demo.patch"

COMMON_FLAGS="-O2 -fPIC -G0 -mips32r2 -mtune=74kc -mhard-float -mfp32 -EL --sysroot=$SYSROOT -DNOOPENGL -D_GNU_SOURCE -DDATA_PREFIX=\"./data\" -I$SOURCE_DIR/include -I$SOURCE_DIR/src -I$SOURCE_DIR/platform -I$SOURCE_DIR/libretro"
CXX_FLAGS="$COMMON_FLAGS -std=c++11 -fno-exceptions -fno-rtti -fno-threadsafe-statics -Wno-deprecated -Wno-narrowing -Wno-write-strings -include cstring -include cstdio -include cstdlib"
OBJECTS=

for source in "$TMP_DIR"/platform/*.c "$SOURCE_DIR"/libretro/*.c; do
    object="$TMP_DIR/$(basename "$(dirname "$source")")_$(basename "${source%.*}").o"
    # CFLAGS are intentionally word-split into compiler arguments.
    "$CC" $COMMON_FLAGS -c "$source" -o "$object"
    OBJECTS="$OBJECTS $object"
done

for source in "$SOURCE_DIR"/src/*.cpp; do
    if [ "${source##*/}" = supertux.cpp ]; then
        source="$TMP_DIR/supertux.cpp"
    elif [ "${source##*/}" = title.cpp ]; then
        source="$TMP_DIR/title.cpp"
    fi
    object="$TMP_DIR/src_$(basename "${source%.*}").o"
    # CXXFLAGS are intentionally word-split into compiler arguments.
    "$CXX" $CXX_FLAGS -c "$source" -o "$object"
    OBJECTS="$OBJECTS $object"
done

"$CC" $COMMON_FLAGS -c "$TMP_DIR/platform/sdl_fiber_mips.s" \
    -o "$TMP_DIR/platform_sdl_fiber_mips.o"
OBJECTS="$OBJECTS $TMP_DIR/platform_sdl_fiber_mips.o"

# shellcheck disable=SC2086
"$CXX" --sysroot="$SYSROOT" -shared -Wl,--no-undefined -Wl,-Bsymbolic-functions \
    -mips32r2 -mtune=74kc -mhard-float -mfp32 -EL \
    -o "$PORT_DIR/froggytux_libretro.so" $OBJECTS -lm
"$STRIP" "$PORT_DIR/froggytux_libretro.so"
