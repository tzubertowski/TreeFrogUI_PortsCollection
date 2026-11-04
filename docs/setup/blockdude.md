# Blockdude

Blockdude is a puzzle game by Willems Davy (joyrider3774), a remake of the TI-83
classic by Brandon Sterner. You carry blocks to build stairs and reach the exit
door of each level. This port runs the "funkey" version natively on TreeFrogUI
devices, built from the
[SF3500 branch](https://github.com/Kryptikone316/blockdude_funkey/tree/sf3500) of the
upstream source. It needs no extra game data: everything is included, with the
Blockman and joyrider level packs, a level editor and several graphics skins.

Select **Blockdude** under **Games → Ports** to start the game. Settings,
progress and level packs you make are saved in the port folder:

```text
roms/ports/blockdude/
├── blockdude.cfg            # picture and text settings (edit it, then relaunch)
├── .blockdude_settings.dat  # the skin you picked
├── .blockdude_*.dat         # your progress in each level pack
└── .blockdude_levelpacks/   # level packs you make in the editor
```

## Controls

| Button | Action |
|--|--|
| D-Pad | Move, and move through menus |
| A | Jump up a block or ledge; confirm in menus |
| B | Pick up or drop a block |
| Y + D-Pad | Look around the level |
| L1 | Change graphics skin (while playing) |
| Start | Restart the level |
| Select | Back (to the level list, then the title screen) |
| Select + Start (held together) | Quit immediately |

In menus every button counts once per press.

## Level editor

Pick **Level Editor** on the title screen, create or load a level pack, and
press **Y** in the level list to start a new level.

| Button | Action |
|--|--|
| D-Pad | Move the cursor |
| A | Place the selected part |
| B | Open the parts palette (D-Pad to choose, A to take, B to cancel) |
| L1 / R1 | Previous / next part |
| X | Show or hide the grid and the position |
| Y | Erase every part on the screen |
| Start | Test the level (Start again returns to the editor) |
| Select | Leave; you are asked whether to save a changed level |

A level needs a player and an exit before it can be saved. Naming a level pack
or its creator uses an on-screen keyboard: D-Pad to move, **A** types, **B**
deletes, **Start** accepts, **Select** cancels, and **L2** or **R2** switches the
keyboard off for plain Up/Down letter picking. Names are up to 20 characters.

## Settings

`blockdude.cfg` holds brightness, contrast, saturation and gamma for the
picture, and the text sizes. The file explains each value. To use the original
game's fonts (they are not free to redistribute, so they are not included),
copy your own `font.ttf`, `font1.ttf` and `font2.ttf` into
`blockdudefs/fonts/` and set the text sizes as the cfg comments describe.

## Supported devices

The port loads the display and audio driver that TreeFrogUI selects for your
device (it reads it from `/tmp/tfdevice.env`), so one build covers every device
that shows frames through that driver. It is tested on the SF3500. The SF3000,
SF3000 HD, SF3100 and GB350 use the same method and should work, but have not
all been tested. It does **not** run on the R36SX and R36HD, which write to the
framebuffer directly instead.

## If something goes wrong

Every launch writes `log.txt` in the port folder and ends it with an
`EXIT CODE:` line. Include it when reporting a problem. To start over, delete
the `.blockdude_*` files in the port folder; delete `.blockdude_levelpacks` only
if you no longer want your own level packs.

## Source and licenses

The game code is MIT licensed (c) 2024 Willems Davy; the SF3500 changes are in
the pinned `source/` submodule under the same licence. Credits for the music
(donskeeto), the Blockman levels (Soleau Software), the graphics skins and the
libraries are in `NOTICE.md` and `licenses/` in the port folder. The upstream
project states no licence for its graphics, music and sound effects, and the
permissions for the Blockman levels and the default skin were obtained by the
original author. The port also bundles SDL_ttf (zlib licence) and uses stb_vorbis
and stb_image (public domain / MIT); the fonts are DejaVu (free licence).
