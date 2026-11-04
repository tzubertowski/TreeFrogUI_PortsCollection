#!/bin/sh
set -eu

PORT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
: "${MIPS_PREFIX:?Set MIPS_PREFIX to the target MIPS Linux toolchain prefix, including the trailing dash}"

# Safe flags only (no -ffast-math, no -mdspr2); see source/README-SF3500.md.
for game in "" xatrix rogue; do
    ( cd "$PORT_DIR/source" && GAME=$game ./build_sf3500.sh )
    case "$game" in
        "")     cp "$PORT_DIR/source/vitaquake2_libretro.stripped.so" "$PORT_DIR/quake2_libretro.so" ;;
        *)      cp "$PORT_DIR/source/vitaquake2-${game}_libretro.stripped.so" "$PORT_DIR/quake2_${game}_libretro.so" ;;
    esac
done
chmod +x "$PORT_DIR"/quake2*_libretro.so

# The game loader.
( cd "$PORT_DIR/source/sf3500/quakeloader" && make CC="${MIPS_PREFIX}gcc" STRIP="${MIPS_PREFIX}strip" )
cp "$PORT_DIR/source/sf3500/quakeloader/quakeloader.mipsel" "$PORT_DIR/quakeloader.mipsel"
chmod +x "$PORT_DIR/quakeloader.mipsel"
