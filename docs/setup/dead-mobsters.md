# Dead Mobsters

*Dead Mobsters* is a freeware run-and-gun platformer by Outhouse Software. Two mobsters, back from the dead,
clean up the streets: through the suburbs, the sewers, the scaffolding and the factory, with a boss at the end
of each. Everything needed to play is included and nothing has to be downloaded; the contents of the game's
files are the author's, unchanged.

Select **Dead Mobsters** under **Games → Ports** to start.

## The launcher

The port opens in its own small launcher.

| Entry | What it does |
|--|--|
| **Launch Game** | Plays the game as the author made it, from the intro and title menu on. The title menu reads **PLAY GAME** and **EXIT**; EXIT goes back to the launcher. |
| **Stage Select** | Locked until you have finished the whole game once (using Continue is fine). Then any of the twelve stages (two stages and a boss in each of the four areas) can be played on its own. Clearing it brings you back to the launcher. After Game Over you can continue; Select, or letting the countdown run out, also goes back. |
| **Settings** | Choose your mobster, set music and sound effect volume, and adjust brightness, contrast and gamma, with a picture test. |
| **Exit Game** | Returns to the front-end. |

In the launcher, move and change values with the D-pad, choose with A or Start, go back with B, and leave with
Select + Start. Settings are saved when you leave the Settings screen. The volume settings only turn the game's
sounds down from the author's levels; use the handheld's volume buttons for overall loudness.

The first time you play, the logo and title sequence run in full (about 45 seconds). After that, **PRESS START
TO SKIP** is shown during them.

## Controls in the game

| Button | Action |
|--|--|
| D-pad left and right | Walk |
| B, or D-pad up | Jump |
| A or Y | Shoot |
| R1 or X / L1 | Next / previous weapon |
| D-pad up and down | Move through the title menu |
| A or Start | Choose in the title menu; continue after Game Over |
| Start, while playing | Pause and resume |
| Start, during the intro | Skip it (after you have watched it once) |
| Select | Back to the title menu while playing (in Stage Select: back to the launcher) |
| Select + Start | Leave the game and return to the launcher |

## Files

```text
roms/ports/dead-mobsters/
├── mobsters.dcb, deadmob.fpg, *.fpg, *.wav, ...   # the game, as the author published it
├── launcher.mipsel                                # the port's launcher
├── fxi.mipsel                                     # the Fenix 0.80 interpreter, built for this device
├── run.sh                                         # starts the launcher and the game; delete its SF3500_ASPECT line to fill the screen
├── settings.cfg                                   # your settings; delete it to go back to the defaults
├── intro_seen                                     # made after the first full intro; delete it to make the intro unskippable
├── game_completed                                 # made when you finish the game; it unlocks Stage Select
└── log.txt                                        # what was printed on the last run
```

## Notes

* The launcher, the PLAY GAME / EXIT menu, the pause, the intro skip and Stage Select are added by this port;
  the game itself has none of them, and its files are not changed. The original menu's START 1 and START 2 only
  chose which mobster was shown, so that choice is now in Settings.
* The author's readme (`readme.txt`) is for Windows and says Ctrl shoots. The game itself shoots with Alt and
  jumps with Space or Ctrl, so the buttons above follow what the game does.
* A button such as A, B or Start moves past a story card. Holding fire when the game ends counts as "continue".
* The picture keeps the game's 4:3 shape with black bars at the sides.
* `log.txt` may say `File mobsters.prg not found`; that is normal (the compiled game names a source file the
  author did not publish).
* The game's own cheat keys are not mapped.
