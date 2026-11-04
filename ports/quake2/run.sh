#!/bin/sh
set -eu

PORT_DIR=/mnt/sdcard/roms/ports/quake2
if ! /mnt/sdcard/cubegm/port_check.sh \
    quake2 \
    https://github.com/tzubertowski/TreeFrogUI_PortsCollection/blob/main/docs/setup/quake2.md \
    /mnt/sdcard/frogui/port-help/quake2.png \
    "$PORT_DIR" baseq2/pak0.pak; then exit 0; fi
cd "$PORT_DIR"
rm -f /mnt/sdcard/cubegm/port_error.txt

# Game loader: lets the player pick Quake II, The Reckoning or Ground Zero (any of these
# folders here with a pak0.pak) and saves the choice in game.txt. It shows nothing when only
# Quake II is installed. Exit status 10 means the player chose Exit (or Select + Start).
if [ -x ./quakeloader.mipsel ]; then
    rc=0
    ./quakeloader.mipsel "$PORT_DIR" game.txt q2 >/dev/null 2>&1 || rc=$?
    if [ "$rc" -eq 10 ]; then exit 0; fi
fi

# game.txt: one line, the .pak to start relative to this folder (baseq2/pak0.pak by default).
GAME=baseq2/pak0.pak
if [ -f "$PORT_DIR/game.txt" ]; then
    want=
    read -r want < "$PORT_DIR/game.txt" || true
    want=$(printf '%s' "$want" | tr -d '\r')
    case "$want" in
        ''|/*|*..*) ;;
        *) if [ -f "$PORT_DIR/$want" ]; then GAME=$want; fi ;;
    esac
fi

# The official add-ons are separate cores (their game code is linked into the core).
CORE="$PORT_DIR/quake2_libretro.so"
case "$GAME" in
    xatrix/*) CORE="$PORT_DIR/quake2_xatrix_libretro.so" ;;
    rogue/*)  CORE="$PORT_DIR/quake2_rogue_libretro.so" ;;
esac
exec /mnt/sdcard/cubegm/picoarch "$CORE" "$PORT_DIR/$GAME"
