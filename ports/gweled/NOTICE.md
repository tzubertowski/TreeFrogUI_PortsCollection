# Notice

This is an unofficial port of **Gweled** 1.0-beta2 to the Data Frog SF3500 (TreeFrogUI). It is
not affiliated with or endorsed by the Gweled authors.

* Gweled is free software under the GNU General Public License, version 2 or (at your option)
  any later version (`licenses/Gweled-COPYING-GPL-2.txt`). Original authors: Sebastien Delestaing
  and Daniele Napolitano (`licenses/CREDITS.txt`). Project page: https://gweled.org
* The game rules (tile balancing, alignment search, scoring, levels, the timed-mode drain) are a
  C port of the original `board_engine.c`. The user interface is rewritten for the handheld in
  C with SDL2 (the original needs GTK 3 and Clutter, which this device does not have). This
  port is therefore under the same licence, GPL-2.0-or-later. The complete source, with the
  scripts that build it, is in the submodule (https://github.com/Kryptikone316/gweled-port); the
  original source is at https://gweled.org.
* The gem pictures (from the original SVG files, rasterised at build time) and the three sound
  effects (click, swap, explode) are the original's. The original project's About dialog also
  lists Wesley Ellis as an author, and credits the explode sound to Crunchpix.
* The display, audio and pad glue is derived from TreeFrogUI's pico286 SF3000 patch.
* Text is set in DejaVu Sans Bold, rasterised into the game at build time
  (`licenses/DejaVu-fonts-LICENSE.txt`). The Ogg Vorbis decoder is stb_vorbis (public domain,
  `licenses/stb_vorbis.txt`).
* The eight music tracks were made for this port by its author and are dedicated to the public
  domain under Creative Commons CC0 1.0. They are an optional separate download (see the setup
  guide) and are not part of this package; the original Gweled ships no music.
* The box art was supplied by the port author and is used only to identify the game.
* SDL2 is used from the device (zlib licence) and is not bundled.
* This software is provided as-is, without warranty of any kind. Use at your own risk.
