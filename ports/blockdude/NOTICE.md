# Notice

This is an unofficial port of **Blockdude** (the "funkey" version by Willems Davy, aka
joyrider3774) to the Data Frog SF3500 (TreeFrogUI). It is not affiliated with or endorsed by
the original author, Soleau Software, or Texas Instruments.

* The game code is by Willems Davy and is under the MIT licence
  (`licenses/blockdude-funkey-LICENSE.txt`). The SF3500 changes are in the `sf3500` branch of
  the source submodule and are under the same licence.
* Blockdude is a remake of the TI-83 game by Brandon Sterner. The `blockman` level pack comes
  from Blockman by Soleau Software; the upstream author says he had the author's approval.
  The default graphics are by Chris Katiesen (for Klas Kroon's remake); the extra skins are by
  Fusion Power. The title music is by donskeeto. Upstream states no licence for the graphics,
  music and sound effects, so they are included as the upstream project ships them. Credits are
  in `licenses/CREDITS.txt`.
* The game's original fonts (Verdana, IrisUPC, Monofonto) are not free to redistribute, so this
  port ships the open DejaVu fonts under the same file names in `blockdudefs/fonts/`. If you
  prefer the originals, obtain them yourself, copy them over `font.ttf`, `font2.ttf` and
  `font1.ttf` there, and set the text sizes in `blockdude.cfg` as its comments describe.
* The box art was supplied by the port author and is used only to identify the game.
* Third-party code compiled into the port (SDL_ttf, stb_vorbis, stb_image) and the DejaVu fonts and its licence
  texts are in `licenses/`.
* This software is provided as-is, without warranty of any kind. Use at your own risk.
