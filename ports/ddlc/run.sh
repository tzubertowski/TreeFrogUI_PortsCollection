#!/bin/sh
set -eu

PORT_DIR=/mnt/sdcard/roms/ports/ddlc
if ! /mnt/sdcard/cubegm/port_check.sh \
    ddlc \
    https://github.com/tzubertowski/TreeFrogUI_PortsCollection/blob/main/docs/setup/ddlc.md \
    /mnt/sdcard/frogui/port-help/ddlc.png \
    "$PORT_DIR" game/assets/fonts/F25_Bank_Printer.ttf; then exit 0; fi
cd "$PORT_DIR"
rm -f /mnt/sdcard/cubegm/port_error.txt
exec /mnt/sdcard/cubegm/picoarch \
    "$PORT_DIR/ddlc_libretro.so" \
    "$PORT_DIR/game/DDLC.ddlc"
