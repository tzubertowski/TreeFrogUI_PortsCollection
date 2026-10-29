#!/bin/sh
set -u

PORT_DIR=/mnt/sdcard/roms/ports/watercloset
cd "$PORT_DIR"
rm -f /mnt/sdcard/cubegm/port_error.txt
export LD_LIBRARY_PATH=/mnt/sdcard/cubegm/lib:/mnt/sdcard/cubegm/usr/lib:${LD_LIBRARY_PATH:-}

# The game keeps its saves and settings under $HOME/.local/share/waterCloset.
# Point HOME at a folder inside the port so they stay with it.
export HOME="$PORT_DIR/home"
mkdir -p "$HOME/.local/share/waterCloset"

# Settings (see watercloset.txt). These are the defaults; the file overrides them.
sharpness=0.5
saturation=1.0
contrast=1.0
fps=60
draw_every=2
lights=1
particles=1
background=1
perf_log=1
nice=-10
music=1
audio_lead=60
jump_repeat=0

# watercloset.txt is read as plain "name=number" lines, never run as a script: only the names
# listed below are accepted, and a value may contain nothing but digits, "." and "-". Anything
# else is ignored and noted in log.txt. (SETTINGS-BEGIN / SETTINGS-END mark this block.)
# SETTINGS-BEGIN
warnings=""
note() { warnings="${warnings}watercloset.txt: $1
"; }
if [ -f ./watercloset.txt ]; then
    settings=$(tr -d ' \t\r' < ./watercloset.txt)
    while IFS= read -r line; do
        case "$line" in ''|'#'*) continue ;; esac
        case "$line" in *=*) ;; *) note "line without '=' ignored"; continue ;; esac
        key=${line%%=*}
        val=${line#*=}
        val=${val%%\#*}
        case "$val" in ''|*[!0-9.-]*) note "ignored $key: the value must be a number"; continue ;; esac
        case "$key" in
            sharpness) sharpness=$val ;;
            saturation) saturation=$val ;;
            contrast) contrast=$val ;;
            fps) fps=$val ;;
            draw_every) draw_every=$val ;;
            lights) lights=$val ;;
            particles) particles=$val ;;
            background) background=$val ;;
            perf_log) perf_log=$val ;;
            nice) nice=$val ;;
            music) music=$val ;;
            audio_lead) audio_lead=$val ;;
            jump_repeat) jump_repeat=$val ;;
            *) note "unknown setting '$key' ignored" ;;
        esac
    done <<EOF
$settings
EOF
fi
# SETTINGS-END
export WC_SHARPNESS="$sharpness" WC_SATURATION="$saturation" WC_CONTRAST="$contrast" WC_FPS="$fps"
export WC_DRAW_EVERY="$draw_every" WC_LIGHTS="$lights" WC_PARTICLES="$particles" WC_BACKGROUND="$background"
export WC_PERF_LOG="$perf_log" WC_NICE="$nice" WC_MUSIC="$music" WC_AUDIO_LEAD_MS="$audio_lead" WC_JUMP_REPEAT="$jump_repeat"

# This device has no real SDL video or audio device. SDL's dummy drivers let SDL
# start; the finished frames and the mixed audio are sent to the device drivers
# directly (see sf3500/ in the source).
export SDL_VIDEODRIVER=dummy
export SDL_AUDIODRIVER=dummy

# The port's own output goes to log.txt in the port folder, ending with an exit
# code line, so a problem can be diagnosed from the card.
rc=0
printf '%s' "$warnings" > log.txt
"$PORT_DIR/waterCloset.mipsel" < /dev/null >> log.txt 2>&1 || rc=$?
echo "EXIT CODE: $rc" >> log.txt
exit "$rc"
