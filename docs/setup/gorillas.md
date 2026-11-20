# Gorillas

Two gorillas stand on the roofs of a city. Take turns throwing exploding bananas at each other: set
the **Angle** and the **Velocity** of your throw, and allow for the wind (the arrow along the bottom)
and the gravity. Every banana that lands on a building blows a hole in it. Hit the other gorilla to
score; hit yourself and your opponent scores instead. The most rounds won takes the match.

This is a new game written for this handheld in the spirit of the QBasic *Gorillas* that came with
MS-DOS. It contains none of the original's code, pictures or sounds. Everything needed to play is
included and nothing has to be downloaded.

Select **Gorillas** under **Games → Ports** to start. Your settings are saved in the port folder:

```text
roms/ports/gorillas/
├── gorillas.txt    # your settings, written by the game's own menu (delete it to reset)
└── log.txt         # what the game printed on its last run
```

## Controls

| Button | Action |
|--|--|
| Up / Down | Angle (0-180); hold to go faster |
| Left / Right | Velocity (1-200); hold to go faster |
| A | Throw |
| X | Open the number keypad: type the Angle, press Start, type the Velocity, press Start, and the banana flies |
| B | Aim guide on / off |
| Start | Pause menu (volume, aim guide, quit to title) |
| Select + Start | Back to the title screen (from the title: leave the game) |

On the keypad and the letter keyboard the D-Pad moves, **A** types, **B** deletes, **Start** accepts
and **Select** cancels (**X** switches case on the letter keyboard). In the menus Up/Down chooses a
row, Left/Right changes its value, **A** selects and **B** goes back.

## Menus

* **Configuration:** *Mode* (against the computer, two players taking turns on one pad, or two
  computers playing each other), *Opponent* (Cub, Chimp, Baboon, Orangutan or Silverback: from wild
  throws that ignore the wind to a gorilla that rarely misses; computer players zero in with every
  miss), *Rounds* (1-15), *Gravity* (Mercury, Venus, Earth, the Moon, Mars, Jupiter, Saturn, Uranus,
  Neptune or Pluto; on the light worlds bananas hang in the air for ages, so a gale is brutal) and
  *Wind* (off, per round, or every throw).
* **Audio/Visual:** *Input* (D-Pad and keypad, D-Pad only, or keypad only), *Aim Guide*, *Last-Shot
  Trail*, *Player Names* (on-screen keyboard), *Theme*, the gorilla looks and *Sky* (shown for the
  themes that use them), and *Volume*.
* **Quick Game** rolls a random opponent, rounds, gravity, wind, theme and gorilla and starts at once,
  without touching your own settings.

## Themes

All themes are purely cosmetic: the game plays exactly the same in each.

* **Q-BASIC** (the default): the purist look: flat EGA-blue sky, flat red, cyan and gray blocks, the
  flat yellow sun, a peach gorilla on each side, crimson explosions, plain prompts in the corners, a
  black text-screen menu and PC-speaker-style beeps.
* **Classic:** this game's own first look: gradient sky, bevelled blocks, a smiling sun.
* **Uptown:** a brick city by day with water towers, shops and street lamps.
* **Moonlit:** a night city under clouds, with a searchlight.
* **Harbor:** a night quay with lit windows reflected in the water.

Nothing in any theme flashes. A choice of gorilla looks, suns and moons is available under the
themes other than Q-BASIC. The sun is easily startled: throw a banana through it and see.

## Notes

* The computer players think while the picture keeps running; on the light worlds a thinking pause
  can be a little longer.
* If something goes wrong, the game writes `log.txt` in the port folder.
