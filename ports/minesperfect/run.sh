#!/bin/sh
set -u

PORT_DIR=/mnt/sdcard/roms/ports/minesperfect
cd "$PORT_DIR"
rm -f /mnt/sdcard/cubegm/port_error.txt
export LD_LIBRARY_PATH=/mnt/sdcard/cubegm/lib:/mnt/sdcard/cubegm/usr/lib:${LD_LIBRARY_PATH:-}

# The game keeps its own files in this folder: mineperf.ini (level, mode, board, best times),
# minesperfect.cfg (sound, zoom) and logs/*.log (saved games). Boards are in boards/, sounds in sound/.

# No real SDL video or audio device on this hardware: SDL's dummy drivers let SDL start,
# the frames go to the device driver directly and the sound through the software mixer.
export SDL_VIDEODRIVER=dummy
export SDL_AUDIODRIVER=dummy

# Output goes to log.txt in the port folder, with an exit code line.
: > log.txt
rc=0
"$PORT_DIR/minesperfect.mipsel" < /dev/null >> log.txt 2>&1 || rc=$?
echo "EXIT CODE: $rc" >> log.txt
exit "$rc"
