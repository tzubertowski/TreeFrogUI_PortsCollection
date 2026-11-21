# Notice

This is an unofficial port of **Mines-Perfect** 1.4.0 to the Data Frog SF3500 (TreeFrogUI). It is
not affiliated with or endorsed by its author.

* Mines-Perfect is free software, (c) 1995-2003 Christian Czepluch, under the GNU General Public
  License, version 2 or (at your option) any later version (`licenses/Mines-Perfect-COPYING-GPL-2.txt`).
  Home page: www.czeppi.de, https://sourceforge.net/projects/mines-perfect/
* The game rules, the solver, the board geometry, the saved-game format and the original controls
  (`core/`, `gui/`) are the original code. Changes for this port are small: a compatibility header
  for a current compiler (clock, itoa, stricmp), two `max`/`transform` fixes, `!in` instead of
  `in == 0` for streams, a one-condition bug fix in `Logbook::redo` (redo after undo threw an error), CR stripping when reading board and settings files, and four geometry accessors added to the board control for the gamepad cursor.
  Everything the original did with wxWidgets (window, menus, dialogs, bitmaps, sound, timer) is
  replaced by the new SDL2 front end in `sdl/`, written for this port. The port's program code is under the same
  licence, GPL-2.0-or-later .
* The cell, digit, smiley and board pictures are the original's (XPM data from its source tree). The
  extra boards (`boards/`: Parquet, Pentagon, Triangle14) come from the original's binary
  distribution.
* The seven sound effects (`sound/`) are synthesised for this port (`tools/make_sounds.py`); the
  sound pack that the original project offers as a separate download is not included (no licence is stated for it); the README explains how to use it with this port.
* Text is set in DejaVu Sans (`licenses/DejaVu-fonts-LICENSE.txt`), rasterised into the game at build
  time.
* The built-in background colours are plain flat colours. A separate, optional **art pack** (six
  AI-generated fan-art pictures by the port author; not GPL, not for commercial use, only for use with
  this port) is offered as its own download with its own licence; it is not part of this package.
* The box art was made for this port and is used only to identify the game.
* The complete corresponding source of this port, with the scripts that build it, is in
  the `source/` submodule of the ports collection (https://github.com/Kryptikone316/mines-perfect-port).
* This software is provided as-is, without warranty of any kind. Use at your own risk.
