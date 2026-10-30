#!/bin/sh
set -eu

PORT_DIR=/mnt/sdcard/roms/ports/froggytux
cd "$PORT_DIR"
rm -f /mnt/sdcard/cubegm/port_error.txt
exec /mnt/sdcard/cubegm/picoarch \
    "$PORT_DIR/froggytux_libretro.so" \
    "$PORT_DIR/SuperTux.sf2k"
