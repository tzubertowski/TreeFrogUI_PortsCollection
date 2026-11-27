# Dead Mobsters (SF3500 port)

*Dead Mobsters* is a freeware run-and-gun platformer by Outhouse Software, made with the Fenix game engine. Two
mobsters, back from the dead, clean up the streets: through the suburbs, the sewers, the scaffolding and the
factory, with a boss at the end of each.

The game files are the author's, with their contents unchanged. Only the Fenix interpreter that runs them is new:
the original Windows interpreter cannot run on this handheld, so this port builds the same Fenix 0.80 interpreter
for the SF3500's processor.

## The launcher

Dead Mobsters opens in a small launcher made for this port:

* **Launch Game** plays the game as the author made it, from the intro and title menu on. The title menu reads
  **PLAY GAME** and **EXIT**; EXIT goes back to the launcher.
* **Stage Select** unlocks once you have finished the whole game. It plays any one of the twelve stages (two
  stages and a boss in each of the four areas). Clearing the stage brings you back to it in the launcher. After
  Game Over you can continue as usual; Select, or letting the countdown run out, also goes back.
* **Settings** chooses your mobster, sets the music and sound effect volumes, and adjusts brightness, contrast and
  gamma. A picture test shows the effect: with good settings, all eight grey steps can be told apart.
* **Exit Game** returns to the front-end.

The volumes only turn the game's sounds down from how the author set them; use the handheld's volume buttons for
overall loudness. Settings are saved when you leave the Settings screen.

## Controls

In the launcher: D-pad to move and change values, A (or Start) to choose, B to go back, Select + Start to leave.

In the game:

| Button | Action |
|---|---|
| D-pad left and right | Walk |
| B, or D-pad up | Jump |
| A or Y | Shoot |
| R1 or X | Next weapon |
| L1 | Previous weapon |
| D-pad up and down | Move through the title menu |
| A or Start | Choose in the title menu; continue after Game Over |
| Start, while playing | Pause and resume |
| Start, during the intro | Skip it (after you have watched it once) |
| Select | Back to the title menu while playing (in Stage Select: back to the launcher) |
| Select + Start | Leave the game and return to the launcher |

A button such as A, B or Start moves past a story card. Holding fire when the game ends counts as "continue".

The game's own cheat keys are not mapped.

## Added by this port

The original game has none of these. The game's files are not changed.

* **The launcher**, a separate program. It draws its title and stage pictures from the game's own graphics files.
* **PLAY GAME / EXIT.** The original menu reads START 1, START 2 and EXIT; the two starts only choose which
  mobster you see, so the choice moved to Settings. The new words are drawn into the menu pictures in memory
  while the game runs.
* **Pause.** Press Start while playing a level. The game stops where it is, with sound held, until you press Start
  again.
* **Intro skip.** The first time, the logo and title sequence play through as the author made them. Once you reach
  the title menu, the port notes it in a small file, `intro_seen`. From then on **PRESS START TO SKIP** is shown
  during the intro. Delete `intro_seen` to make the intro unskippable again.
* **Stage Select.** The port starts a level the way the game's own "continue" does. Reaching the ending of a
  normal game creates the file `game_completed`, which unlocks it. Delete the file to lock it again.

## Notes

* The original readme says Ctrl shoots. The game itself shoots with Alt and jumps with Space or Ctrl; the buttons
  above follow what the game does.
* The picture keeps the game's 4:3 shape with black bars at the sides. To fill the screen instead, delete the line
  `export SF3500_ASPECT=16:9` in `run.sh`.
* `settings.cfg` holds your settings; delete it to go back to the defaults.
* `log.txt` holds what the game printed on its last run. The message `File mobsters.prg not found` is normal: the
  compiled game mentions its source file, which the author did not publish.
* `readme.txt` is the author's own readme (Windows instructions; the controls differ here).
* The source, build instructions and licences: https://github.com/Kryptikone316/dead-mobsters-port
* A few file names were changed to lower case (for example `01.FPG` to `01.fpg`) to match what the game asks for.
