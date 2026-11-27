#!/bin/sh
# SPDX-License-Identifier: MIT
set -u

PORT_DIR=/mnt/sdcard/roms/ports/dead-mobsters
cd "$PORT_DIR"
rm -f /mnt/sdcard/cubegm/port_error.txt
export LD_LIBRARY_PATH=/mnt/sdcard/cubegm/lib:/mnt/sdcard/cubegm/usr/lib:${LD_LIBRARY_PATH:-}

# Video goes to the device's display driver and sound is tapped from SDL_mixer's output (see the
# source), so SDL's own devices are not used.
# Both the game and the launcher are 4:3; pad them to the panel's 16:9 so they are not stretched.
# Remove the next line to fill the screen.
export SF3500_ASPECT=16:9

: > "$PORT_DIR/log.txt"
rc=0
back=""                                   # where the launcher opens: empty, or the stage just played
while :; do
    rm -f launch.txt
    if [ -n "$back" ]; then
        "$PORT_DIR/launcher.mipsel" --stage "$back" < /dev/null >> "$PORT_DIR/log.txt" 2>&1; rc=$?
    else
        "$PORT_DIR/launcher.mipsel" < /dev/null >> "$PORT_DIR/log.txt" 2>&1; rc=$?
    fi
    echo "LAUNCHER EXIT CODE: $rc" >> "$PORT_DIR/log.txt"

    # Anything but a clean launcher with a request to play leaves to the front-end.
    [ "$rc" -eq 0 ] || break
    action=""; level=""
    [ -f launch.txt ] && read -r action level < launch.txt

    # fxi.mipsel is the Fenix 0.80 interpreter; its name must start with "fxi" (that is how it knows
    # it was started as the interpreter and should take the game from the command line).
    case "$action" in
        play)
            back=""
            "$PORT_DIR/fxi.mipsel" -b mobsters.dcb < /dev/null >> "$PORT_DIR/log.txt" 2>&1; rc=$?
            ;;
        stage)
            back="$level"
            SF3500_STAGE="$level" "$PORT_DIR/fxi.mipsel" -b mobsters.dcb < /dev/null >> "$PORT_DIR/log.txt" 2>&1; rc=$?
            ;;
        *)
            break
            ;;
    esac
    echo "GAME EXIT CODE: $rc" >> "$PORT_DIR/log.txt"
    # The launcher comes back however the game ended.
    rc=0
done
rm -f launch.txt
exit "$rc"
