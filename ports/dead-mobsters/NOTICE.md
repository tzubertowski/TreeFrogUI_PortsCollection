# Notice

*Dead Mobsters* is a freeware game by Outhouse Software. This port is not affiliated with or endorsed by the author.

* **The game files are the author's, with their contents unchanged:** `mobsters.dcb`, the graphics (`deadmob.fpg`,
  `01.fpg` to `08.fpg`, `b1.fpg` to `b4.fpg`), the font, the sounds and music, and the readme (`readme.txt`). Some
  file names are lower-cased. The readme says the game is freeware and asks for it to be distributed to as many
  people as possible. The original Windows interpreter and DLLs are not included.
* **`fxi.mipsel`** is the Fenix 0.80 interpreter (GPL version 2 or later, Jose Luis Cebrian Pague and the Fenix
  team) built for this handheld, with a small layer that replaces SDL 1.2 and sends the picture, sound and controls
  to the device. That layer also adds a pause and an intro skip. The skip works by ending the game's two intro
  waits early while it runs, so that its own code then carries on to the title menu. For its title menu and for
  Stage Select it also sets a few of the running game's variables, and redraws the three menu entries in the loaded
  copy of the menu pictures. The source of the interpreter
  and the layer is at https://github.com/Kryptikone316/dead-mobsters-port (in the ports collection, the `source/`
  submodule).
* **`launcher.mipsel`** is the port's launcher (MIT licence, source in `launcher/`). It contains no game
  art: it reads the title and stage pictures from the game's files when it runs. Its lettering is pre-drawn from the
  DejaVu fonts (`licenses/dejavu-fonts.txt`).
* SDL2 and SDL2_mixer (zlib licence), libxmp-lite (MIT), libpng and zlib are linked in. The licence texts are in
  `licenses/`.
* The display, audio and gamepad glue is derived from TreeFrogUI's pico286 SF3000 patch and picoarch's SF3000 code.
* The box art (a floppy-disk illustration with the game's logo) was supplied by the port author and is used only to
  identify the game.
* This software is provided as-is, without warranty of any kind. Use at your own risk.
