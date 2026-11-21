GWELED  -  for the Datafrog SF3500
==================================

Swap two neighbouring gems so that three or more of the same kind line up,
horizontally or vertically. The gems vanish, the ones above fall down, new
ones drop in and chain reactions keep scoring. This is Gweled, the free
Bejeweled-style game by Sebastien Delestaing and Daniele Napolitano
(gweled.org), brought to the SF3500 with its own SDL2 front end. The game
rules, the gem pictures and the sounds are the original's. The eight music
tracks were made for this port.

CONTROLS
--------
  D-pad        move the white cursor over the board
  A            pick the gem under the cursor
  D-pad (after A)  swap the picked gem with the neighbour in that direction
               (A on a neighbour works too; A on the same gem, or B, drops it)
  SELECT       show a hint (a gem bounces)
  START        pause menu: Resume, Show Hints, Sound Effects, Effects Volume, Music,
               Music Volume, Scores, Quit to Menu
  SELECT + START   leave Gweled from any screen, back to the front-end

GAME TYPES
----------
  Normal       Play until there are no moves left.
  Timed        The bar drains; matches refill it. Run out of time and it is over.
  Endless      No end: when no moves are left the board is reshuffled.
               The score is not recorded.
Reach the end of a level's bar for a bonus round (eight gems vanish for 10
points each) and a higher level; every second level raises the points per gem.

MENUS
-----
  Game       Continue Saved Game (when there is one), Normal, Timed, Endless
  Settings   Sound Effects on/off, Effects Volume, Music on/off, Music Volume
             (volumes: Left/Right, steps of 10%), Show Hints on/off
  Scores     the best ten of the Normal and Timed games (Endless has none);
             X on that screen clears the list you are looking at
             (Normal or Timed, each on its own), after a Yes/No question
  Help       how to play, controls, game types, scoring and levels, about
  Exit Game  leave Gweled and return to the front-end
After 15 seconds without a move a possible move bounces; turn hints off in
Settings if you would rather work it out.

SAVING
------
Quit to Menu (pause menu) offers to save the game. "Continue Saved Game"
is in the Game menu; a saved game is used once.

FILES (in this folder)
----------------------
  gweled.cfg      sound, music, both volumes and hints, the name used for high scores
  music/          the optional music pack (see MUSIC)
  gweled.scores   the ten best scores of the Normal and Timed games
  gweled.sav      a saved game (removed when you continue it)
  log.txt         what the game printed on its last run

MUSIC
-----
Eight tracks made for this port (CC0) are a separate download: GweledMusicPack.zip from
https://github.com/Kryptikone316/gweled-port/releases . Unzip it onto the card root so that
you end up with roms/ports/gweled/music/ (Menu, Normal, Timed and Endless folders). Without
it the game is silent apart from its sound effects.

The menus and each game type have their own music; two tracks take turns, and the music fades
when you go from the menus into a game and back. Music on/off and its volume are in Settings
(and in the pause menu). To use your own music, put .ogg files in those folders.

LICENCE
-------
GNU General Public License, version 2 or (at your option) any later version.
Original game (c) 2003-2005 Sebastien Delestaing, (c) 2010-2026 Daniele
Napolitano. SF3500 version (c) 2026 AthruZ (Kryptikone316). See NOTICE.md and
the licenses folder; the complete source of this port is at
https://github.com/Kryptikone316/gweled-port.
The music (optional separate download) is dedicated to the public domain under CC0 1.0.
