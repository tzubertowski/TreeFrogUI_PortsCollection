#!/bin/sh
set -eu

PORT_DIR=/mnt/sdcard/roms/ports/froggytux
LOG=/mnt/sdcard/cubegm/logs/froggytux.log
cd "$PORT_DIR"
mkdir -p "$(dirname "$LOG")"
rm -f /mnt/sdcard/cubegm/port_error.txt
printf '\n--- FroggyTux launch %s ---\n' "$(date)" >> "$LOG"
exec >> "$LOG" 2>&1
exec /mnt/sdcard/cubegm/picoarch \
    "$PORT_DIR/froggytux_libretro.so" \
    "$PORT_DIR/SuperTux.sf2k"
