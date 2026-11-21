# Notice

This is an original game for the Data Frog SF3500 (TreeFrogUI), written in the spirit of the QBasic
*Gorillas* (Microsoft, 1990). It is not affiliated with or endorsed by Microsoft or the authors of the
original.

* The game contains no code, pictures or sounds from the original. The rules (two gorillas, a random
  skyline, bananas thrown by angle and velocity with wind and gravity) are reimplemented from scratch.
  Every picture is drawn in code (`src/art.c`, `src/theme.c`) and every sound is synthesised when the
  game starts (`src/sound.c`); no image or audio files are shipped other than the box art.
* The box art (a floppy-disk illustration whose label carries the game's own artwork) was supplied by the
  port author and is used only to identify the game.
* The game and everything made for it, including the five themes (the Q-BASIC theme's gorilla, sun,
  banana, text-screen menu and PC-speaker-style sounds are our own drawings and synthesis in the style
  of the original, not copies), the twelve gorilla looks, the computer opponents and the box art, is
  under the MIT licence (`licenses/LICENSE.txt`). The source is in the submodule.
* The text font is font8x8 by Daniel Hepper, from the IBM PC/VGA font data assembled by Marcel Sondaar
  (public domain, noted in `src/font8x8.h`).
* The display, audio and gamepad glue is derived from TreeFrogUI's pico286 SF3000 patch and is
  distributed under the same MIT licence.
* SDL2 is used from the device (zlib licence) and is not bundled.
* "QBasic" and "Microsoft" are trademarks of Microsoft Corporation and are used here only to say what
  the game is inspired by.
* This software is provided as-is, without warranty of any kind. Use at your own risk.
