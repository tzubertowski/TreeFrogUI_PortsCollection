#!/bin/sh
# SPDX-License-Identifier: MIT
# Builds the shipped programs, fxi.mipsel (the Fenix 0.80 interpreter) and launcher.mipsel (the port's
# launcher), from the source/ submodule. The build starts from three upstream tarballs (SDL2, SDL2_mixer,
# libxmp-lite; see source/README.md) and is reproducible: the same sources give the same bytes wherever they
# are checked out.
#
#   SF3500_TC=/path/to/toolchain/host DEPS=/path/to/tarballs ./build.sh
set -eu
PORT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
: "${SF3500_TC:?Set SF3500_TC to the SF3500 MIPS toolchain host directory}"
( cd "$PORT_DIR/source" && ./build_sf3500.sh )
B="$PORT_DIR/source/build-sf3500"
cp "$B/fxi.mipsel" "$B/launcher.mipsel" "$PORT_DIR/"
chmod +x "$PORT_DIR/fxi.mipsel" "$PORT_DIR/launcher.mipsel"
rm -rf "$B"
echo "built fxi.mipsel and launcher.mipsel in $PORT_DIR"
