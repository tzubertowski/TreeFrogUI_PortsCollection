# Mines-Perfect

Minesweeper with a twist. Mines are hidden under a grid of cells: open every cell that has no mine and
flag the ones that do. The numbers tell you how many mines touch a cell.

What makes Mines-Perfect special is its **solver**, a built-in player that never gets it wrong. It can
tell you how hard the next move is, give you hints, and even protect you when you would have to guess.
If you just want classic Minesweeper, switch it off. The game also plays on hexagons, triangles, a 3D
grid and more (Parquet, Pentagon and Triangle14 are included).

This is the original game by Christian Czepluch ([czeppi.de](http://www.czeppi.de),
[SourceForge](https://sourceforge.net/projects/mines-perfect/)) with new controls, menus and settings
for the handheld. Everything needed to play is included and nothing has to be downloaded; the
background pictures are an optional extra (see below).

Select **Mines-Perfect** under **Games → Ports** to start. A beginner board is waiting: press A on a
cell to open it, B to flag one. What the game remembers is kept in the port folder:

```text
roms/ports/minesperfect/
├── mineperf.ini        # your level, mode, board and best times (delete it to start fresh)
├── minesperfect.cfg    # sound, zoom, background and the solver switch
├── boards/             # the boards (put more .txt + .bmp pairs here)
├── sound/              # the seven sound effects (replace them with your own .wav files)
├── logs/               # your saved games
├── backgrounds/        # optional: the art pack, and your own .bmp pictures
└── log.txt             # what the game printed on its last run
```

## Controls

| Button | Action |
|--|--|
| D-Pad | Move the cursor (hold to repeat) |
| A | Open the cell |
| B | Flag the cell |
| X | Hint (when the solver is on) |
| Y | New game |
| L1 / R1 | Undo / redo a move |
| L2 / R2 | Zoom out / in, one step at a time; both together return to Auto (the whole board) |
| Start | Menu |
| Select + Start | Quit |

Shortcuts on a number that is already open: **A** opens all the covered cells around it, when you have
already flagged as many mines around the number as it says; **B** flags all the covered cells around it,
when the number says that every one of them is a mine. If the number does not fit, nothing happens.

## The solver

* **Solver: Off** is plain classic Minesweeper: no hints, no protection, and a wrong guess ends the game.
* **Solver: On** adds the smiley (it rates the next move: eye patch = easy, grey-cornered smile = medium,
  monocle = hard), hints on X, the solver tools, and a **Mode** that decides what happens when only a
  guess is left:
  **Original** (classic), **Hint** (the game opens or flags one safe cell), **Immune** (your next move is
  protected), **Lucky** (a guess is always safe; the default), **Startup** (the game starts so that you never
  have to guess) and **Murphy's Law** (the opposite of Lucky).

Using a hint or a solver tool stops the clock, so no record is made.

## Menu (Start)

* **New Game** and **Restart This Board** (the same board again from the beginning)
* **Level:** Beginner, Intermediate, Expert, or Custom size (rows, columns, mines)
* **Board:** the shape of the cells: Square, Hexagon, Triangle, 3d-Grid, Parquet, Pentagon, Triangle14
* **Best Times:** the three records of every board
* **Game Configuration:** the solver on or off, the Mode, the Solver tools, and Save game / Open game
* **Settings:** Background, Zoom and Sound
* **Help:** how to play, what the solver is, about

Every entry in the Game Configuration and Settings menus has a short description while it is selected.

## Backgrounds

Classic and six flat, neutral colours are built in (START > Settings > Background, with a live preview).
The optional art pack, six fan-art pictures by the port's author, is a separate download,
`MinesPerfectArtPack.zip` on the
[Releases page of the source repository](https://github.com/Kryptikone316/mines-perfect-port/releases):
copy its `backgrounds` folder into `roms/ports/minesperfect/` and the pictures join the list. They are
free for use with this game only, not for commercial use and not to be used elsewhere (the pack carries its
licence). Your own `.bmp` pictures in the same folder also appear (640 x 480 is ideal; other sizes are
cropped from the middle).

## Sound

The sound effects were made for this port. To use the original game's sounds instead, download its sound
pack from the [project page](https://sourceforge.net/projects/mines-perfect/) and copy the seven files over
the ones in `sound/`; the README in the port folder explains it step by step.

## Supported devices

The game reads the device and display driver from `/tmp/tfdevice.env` (written by TreeFrogUI). It has been
tested on the SF3500 only.

## Troubleshooting

`log.txt` in the port folder ends with `EXIT CODE: 0` after a normal exit; please attach it if you report a
problem. Delete `mineperf.ini` to start with fresh settings and records.
