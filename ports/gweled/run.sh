#!/bin/sh
set -u

PORT_DIR=/mnt/sdcard/roms/ports/gweled
cd "$PORT_DIR"
rm -f /mnt/sdcard/cubegm/port_error.txt
export LD_LIBRARY_PATH=/mnt/sdcard/cubegm/lib:/mnt/sdcard/cubegm/usr/lib:${LD_LIBRARY_PATH:-}

# Options (sound, hints), the last name used, the high scores (gweled.scores) and a saved game (gweled.sav)
# live in this folder; the game reads and writes them itself. Nothing to parse here.

# No real SDL video or audio device on this hardware: SDL's dummy drivers let SDL start,
# the frames go to the device driver directly and the sound through the software mixer.
export SDL_VIDEODRIVER=dummy
export SDL_AUDIODRIVER=dummy

# Output goes to log.txt in the port folder, with an exit code line.
: > log.txt
rc=0
"$PORT_DIR/gweled.mipsel" < /dev/null >> log.txt 2>&1 || rc=$?
echo "EXIT CODE: $rc" >> log.txt
exit "$rc"
