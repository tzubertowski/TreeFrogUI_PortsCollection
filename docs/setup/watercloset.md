# Water Closet

Water Closet is a platform game by Stephen and Richard Sweeney (Parallel Realities) where the
goal of each stage is to escape down a toilet. It won first place for overall fun factor and for
completeness of experience in itch.io's Linux Game Jam 2019. This port runs it natively on
TreeFrogUI devices, built from the
[SF3500 branch](https://github.com/Kryptikone316/waterCloset/tree/sf3500) of the author's
[source](https://github.com/stephenjsweeney/waterCloset) (version 1.0). Everything is included, so
it is ready to play.

Select **Water Closet** under **Games → Ports** to start the game.

## Controls

| Button | Action |
|--|--|
| D-Pad | Move, navigate menus |
| A | Jump (a new press for each jump; see `jump_repeat` below) |
| B | Interact / use |
| X | Create a clone and reset the stage |
| Y | Restart the stage (this removes any clone) |
| Start | Pause |
| A, B or X | Confirm in menus and move on from tips |
| Select + Start (held together) | Quit immediately |

The game's own text talks about keyboard keys; on the device the same prompts show these buttons
instead. The Controls list under **Options** only displays the buttons. To change them, edit
`controls.txt` (see below).

### Changing the buttons

`controls.txt` in the port folder holds one line per action, for example `jump=A` or `clone=L1,Y`
(an action works while any of its buttons is held). The buttons are `LEFT RIGHT UP DOWN A B X Y L1
R1 L2 R2 START SELECT`, or `NONE` to turn an action off. L2 and R2 exist only on some models, such
as the SF3000 and SF3500, and there is no L3/R3. They are ignored while Select is held. The file is
read when the game starts, so quit and relaunch after changing it. A mistake on a line is written to
`log.txt` and that line keeps its default. `pause` and `accept` cannot be turned off, so the menus
always stay usable.

## Saves

The game keeps its saves and its own options inside the port folder, so everything stays in one place:

```text
roms/ports/watercloset/home/.local/share/waterCloset/
```

To start over, delete that folder.

## Settings

`watercloset.txt` in the port folder holds the settings, each one explained in the file. Edit it and
relaunch; no rebuild is needed.

| Setting | Default | What it does |
|--|--|--|
| `fps` | 60 | The frame limit, which is also the game speed. The game does one step per frame and was designed for 60, so a lower number slows everything down (50 is 17% slower). |
| `draw_every` | 2 | 2 draws a picture on every 2nd frame (30 a second at `fps=60`) while the game and the buttons still run at the full speed; 3 draws every 3rd; 1 draws every frame. On the SF3500, from about stage 12 a frame needs 15 to 19 ms, more than the 16.7 ms available at 60, so drawing every frame cannot keep the speed up there. Measured on the SF3500 from stage 12 on: 50 fps with every frame drawn ran at about 77% of the designed speed, and 60 fps with every 2nd frame drawn at about 91%. Set it to 1 on a device that can draw every frame. |
| `lights`, `particles`, `background` | 1 | Turn the glows, particle effects and the brick background off to save work. |
| `sharpness`, `saturation`, `contrast` | 0.5, 1.0, 1.0 | Tune how the half-size pictures are reduced and coloured. |
| `nice` | -10 | Scheduling priority. A negative value keeps the launcher's background checks from taking a slice of a frame. |
| `music` | 1 | 0 turns the music off completely. |
| `audio_lead` | 60 | Milliseconds of sound mixed ahead of the clock. A larger lead rides out longer pauses without crackle; sound effects start that much later. |
| `jump_repeat` | 0 | 1 makes Walter jump again the moment he lands while the button is held, as in the original. |
| `perf_log` | 1 | Writes a timing and audio line to `log.txt` every couple of seconds, which helps when reporting a problem. |

### Sound tips

The device's own volume stage can sound thin and noisy at the lowest steps. If the sound is rough,
raise the device volume towards the middle and lower the in-game **Music Volume** and **Sound
Volume** (Options) to keep the loudness you want.

### Replacing the music

An optional `music_pack` folder in the port folder replaces tracks. Put an Ogg Vorbis file in it
with the exact name of the track to replace (`Meadow Thoughts.ogg`, `puzzle-1-a.ogg`,
`puzzle-1-b.ogg`, `contemplation.ogg`), mono or stereo at 44100 or 48000 Hz; about 192 kbps is a
good size. While the folder exists its tracks are used; delete or rename it to go back to the
originals. WAV and MP3 files are not supported.

An optional enhanced set of the four tracks (about 192 kbps, with the volume evened out so they
sit together like an album) is a separate download, attached to the
[music-pack-1 release](https://github.com/Kryptikone316/waterCloset/releases/tag/music-pack-1) of the
port's source repository. Unzip it into `roms/ports/watercloset` so that the files end up in
`roms/ports/watercloset/music_pack`. The README inside the zip lists the credits and the changes
made.

## Supported devices

The port loads the display and audio driver that TreeFrogUI selects for your device (it reads it
from `/tmp/tfdevice.env`), so one build covers every device that shows frames through that driver.
It is tested on the SF3500. The SF3000, SF3000 HD, SF3100 and GB350 use the same method and should
work, but have not all been tested. It does **not** run on the R36SX and R36HD, which write to the
framebuffer directly instead.

## Known issues

From about stage 12 on, the frame rate can dip for several seconds at a time on the SF3500 (the
first write of a frame to the screen buffer sometimes stalls). The game stays playable and the
slowdown goes away on its own; the cause is still being investigated. Drawing a picture on every 2nd
frame (the `draw_every` default) softens it: the game keeps about 64% of its designed speed during a
dip, against about 38% when every frame is drawn.

## If something goes wrong

Every launch writes `log.txt` in the port folder and ends it with an `EXIT CODE:` line. Its first
lines show the device, display mode and driver the port picked. Include it when reporting a problem.

## Source and licenses

The game's source code is under the GNU General Public License 3.0. Its graphics and data are
under Creative Commons BY-NC-SA 3.0, which allows use and sharing for **non-commercial** purposes
with credit, and the music and sound effects have their own licences, listed file by file in
`roms/ports/watercloset/licenses/CREDITS.txt` together with the licence texts. One sound effect is
credited upstream only as "Copyright www.freesfx.co.uk", whose terms allow its use inside a game
with credit; it is shipped only as part of the game. The source for this port is the pinned
`source/` submodule. SDL2, SDL2_image and FreeType come with the device's firmware and are not
included.
