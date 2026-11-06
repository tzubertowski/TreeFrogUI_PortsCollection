# Notice

This is an unofficial port of **Defense Mania** by Kris Siepert (kriskbx) to the Data Frog SF3500
(TreeFrogUI). It is not affiliated with or endorsed by the original author.

* The game is a native C++ translation of the original Processing code and runs on the original
  game's data. The original code and its graphics are under the MIT licence
  (`licenses/defense-mania-LICENSE.txt`; the graphics have their own repository,
  https://github.com/DefenseMania/defense-mania-graphics, with the same MIT licence). The SF3500
  changes are in the `sf3500` branch of the source submodule and are under the same licence.
* Added for this port and under the same MIT licence: the Bastion (its research, actions and doctrines),
  the four kinds of soldier, the path traps, the Resupply Depot, the new creatures and the extra
  Ballista and depot art, the three extra maps (The Swamp, redrawn from the original's tiles, and The
  Tundra and The Coast, painted by scripts from them), the per-map HUD planks and the gold icon, the
  difficulty progression, Endless mode, the scores screens, and the sound effects, which are
  synthesised by `tools/make_sfx.py` (CC0). The soldiers and the keep were modelled and rendered in
  Blender by `tools/blender/` in the source repository; the renders are original work.
* The original asks for the proprietary fonts Arial and Arial Black. This port uses the Bitter font
  that ships with the game (SIL Open Font Licence 1.1, `licenses/Bitter-OFL.txt`) and the DejaVu
  fonts (`licenses/DejaVu-fonts-LICENSE.txt`).
* The box art was supplied by the port author and is used only to identify the game; it contains the
  game's logo and map art.
* The optional music pack is a separate download (see the setup guide). It is not part of this
  package.
* Third-party code compiled into the port (SDL_ttf, stb_vorbis, stb_image) and its licence texts
  are in `licenses/`.
* This software is provided as-is, without warranty of any kind. Use at your own risk.
