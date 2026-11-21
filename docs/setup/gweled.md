# Gweled

Gweled is a match-three gem game. Swap two neighbouring gems so that three or more of the same kind
line up, horizontally or vertically: they vanish, the gems above fall down, new ones drop in, and
chain reactions keep scoring. Clear enough gems to reach the next level and get a bonus round.

This is a port of the free Gweled 1.0-beta2 ([gweled.org](https://gweled.org), by Sebastien Delestaing
and Daniele Napolitano). The original needs GTK and Clutter, so the front end is new and the game
rules, the gem pictures and the sound effects are the original's. Everything needed to play is
included and nothing has to be downloaded; the music is an optional extra (see below).

Select **Gweled** under **Games → Ports** to start. Your settings, high scores and saved game are
kept in the port folder:

```text
roms/ports/gweled/
├── gweled.cfg      # sound, music, the two volumes, hints and the name used for high scores
├── gweled.scores   # the ten best scores of the Normal and the Timed game
├── gweled.sav      # a saved game (removed when you continue it)
├── music/          # the optional music pack (see below)
└── log.txt         # what the game printed on its last run
```

## Controls

| Button | Action |
|--|--|
| D-Pad | Move the cursor; after A, swap the picked gem with the neighbour in that direction |
| A | Pick the gem under the cursor (A on a neighbour also swaps; A on the same gem puts it down) |
| B | Put the picked gem down; go back in menus |
| Select | Show a hint |
| Start | Pause menu (resume, hints, sound effects, music, their volumes, scores, quit to menu) |
| Select + Start | Leave the game from any screen |

## Game types

* **Normal:** play until there are no moves left.
* **Timed:** a bar drains; matches refill it. Run out of time and the game is over.
* **Endless:** no end: when no moves are left the board is reshuffled. The score is not recorded.

Reaching the end of a level's bar starts a bonus round (eight gems vanish for 10 points each) and a
higher level; every second level raises the points per gem. After 15 seconds without a move, a gem
that can make a match bounces; Select shows one at once.

## Menus

**Game** (Continue Saved Game when there is one, Normal, Timed, Endless), **Settings** (sound effects
and their volume, music and its volume, show hints), **Scores** (the best ten of Normal and Timed; X
clears the list you are looking at after a Yes/No question), **Help** (how to play, controls, game
types, scoring and levels, about) and **Exit Game**. *Quit to Menu* in the pause menu offers to save
the game.

## Music (optional)

Without a music pack the game is silent apart from its sound effects. The pack is a separate
download of eight tracks (about 41 MB, CC0): get `GweledMusicPack.zip` from the
[Releases page of the source repository](https://github.com/Kryptikone316/gweled-port/releases) and
unzip it onto the card root, so that you end up with `roms/ports/gweled/music/`. The menus and each
game type have their own folder with two tracks that take turns; the music fades when you go from the
menus into a game and back. You can add your own Ogg Vorbis files to any folder.

## Supported devices

The game reads the device and display driver from `/tmp/tfdevice.env` (written by TreeFrogUI).
It has been tested on the SF3500 only.

## Troubleshooting

`log.txt` in the port folder ends with `EXIT CODE: 0` after a normal exit. The game checks its own
picture while it runs: a gem that was not drawn is drawn again, and each such event is noted in the
log (`CHECK ... was not drawn`). If you see gems missing on screen for more than a moment, please
attach `log.txt` to a report.
