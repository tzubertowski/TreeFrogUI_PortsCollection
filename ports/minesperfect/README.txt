MINES-PERFECT  -  for the Datafrog SF3500
=========================================

Minesweeper, with a twist. Mines are hidden under a grid of cells; open every cell that has no mine
and flag the ones that do. The numbers tell you how many mines touch a cell.

What makes Mines-Perfect special is its SOLVER: a built-in player that never gets it wrong. It can
tell you how hard the next move is, give you hints, and even protect you when you would have to
guess. If you just want classic Minesweeper, switch it off (START > Game Configuration > Solver).

The game is also not limited to squares: it plays on hexagons, triangles, a 3D grid and more.

This is the original Mines-Perfect 1.4.0 by Christian Czepluch (www.czeppi.de), brought to the
handheld with new controls, menus and settings.


QUICK START
-----------
Pick Mines-Perfect from Games > Ports. A beginner board is waiting. Press A on a cell to open it.
Press B to flag a cell you think hides a mine. Open all the safe cells to win.
Press START for the menu, SELECT + START to quit.


CONTROLS
--------
  D-pad            move the yellow cursor (hold to repeat)
  A                open the cell
  B                flag the cell
  X                hint (when the solver is on)
  Y                new game
  L1 / R1          undo / redo a move
  L2 / R2          zoom out / in, one step at a time. "Auto" (the whole board) is one of the steps.
                   Zoomed-in boards scroll with the cursor.
  L2 + R2 together  jump straight back to Auto
  START            menu
  SELECT + START   quit

Shortcuts on a number that is already open:
  A   opens all the covered cells around it - when you have already flagged as many mines around
      the number as it says.
  B   flags all the covered cells around it - when the number says that every one of them is a mine.
If the number does not fit, nothing happens.


THE SOLVER
----------
The solver reads the numbers like an expert and knows, for every covered cell, whether it is
certainly safe, certainly a mine, or cannot be told. You decide how much of it you want:

  Solver: Off   Plain classic Minesweeper. No hints, no protection. A wrong guess ends the game.
  Solver: On    The smiley rates the next move, X gives hints, and the Mode (below) looks after you
                when only a guess is left.

THE SMILEY (solver on) shows how hard the easiest safe move is right now:
  eye patch ........ easy: one open number is enough to find a safe move (stage 1)
  grey-cornered smile  medium: two numbers together tell you something (stage 2)
  monocle .......... hard: you need three or more numbers together (stage 3)
  plain smile in a running game .. no sure move is left, you would have to guess - your Mode
                     looks after you
  toothy grin ...... no sure move is left and nothing protects you
  sunglasses ....... you won          crossed eyes ... you lost

MODES decide what happens when only a guess is left (START > Game Configuration > Mode):
  Original   classic: a wrong guess ends the game
  Hint       the game opens or flags one safe cell for you
  Immune     your next move is protected: open a mine and the game simply carries on
  Lucky      a guess is always safe: the game quietly moves the mines to fit what you can see
             (the default)
  Startup    the game starts with enough cells open and flagged that you never have to guess
  Murphy's Law (an extra switch)   the opposite of Lucky: if a cell could hide a mine, it does

SOLVER TOOLS (START > Game Configuration > Solver tools): hint, solve one move, solve everything up
to a difficulty, auto-solve after each of your moves, a limit on how hard a move you are expected
to work out yourself, and show mines.
Using any tool stops the clock, so no record is made. Switching the solver off clears the tools and
sets the mode to Original; switching it on again brings your earlier settings back.


MENUS (START)
-------------
  Resume
  New Game
  Restart This Board    play the same board again from the beginning
  Level                 Beginner, Intermediate, Expert, or Custom size (rows, columns, mines)
  Board                 the shape of the cells: Square, Hexagon, Triangle, 3d-Grid, Parquet,
                        Pentagon, Triangle14
  Best Times            the three records of every board (X deletes one)
  Game Configuration    Solver on/off, Mode, Solver tools, Save game, Open game
  Settings              Background, Zoom, Sound
  Help                  how to play, what the solver is, about
  Quit

Every item in the Game Configuration and Settings menus has a short description at the bottom while
you have it selected.

SAVING: Game Configuration > Save game stores the whole game, move by move, as a file in the logs
folder (logs/<name>.log). Open game loads it and carries on where it stopped.

RECORDS: win a Beginner, Intermediate or Expert game without using any help and beat your best time,
and you can enter your name with the on-screen keyboard.


BACKGROUNDS (START > Settings > Background)
-------------------------------------------
Browse with Left/Right, press A to choose, B to cancel. You see the real game on top of each choice.
  Classic         the plain look of the original
  six flat colours  Charcoal, Slate, Dusty Blue, Sage, Stone, Sand
  Art pack        six pictures, a separate optional download (MinesPerfectArtPack.zip). Copy its
                  "backgrounds" folder into the game's folder (roms/ports/minesperfect/) and they
                  appear in the list. The pictures are fan art, free to use with this game only,
                  not for commercial use and not to be used anywhere else (see LICENCE.txt in the
                  pack).
  Your own pictures  put a .bmp file into the backgrounds folder (create the folder if needed).
                  Uncompressed 24-bit works best. 640 x 480 is ideal; any other size is cropped
                  from the middle to the screen's 4:3 shape. The file name shows in the list
                  (underscores become spaces). Delete the file to remove it from the list.


SOUND
-----
The seven sound effects (sound folder: new, open, flag, error, deadend, won, lost) were made for
this port. Turn sound off under START > Settings > Sound.

To use the sounds of the original Mines-Perfect instead: they are a separate download that is not
included here, because it does not state a licence.
  1. Get the sound pack from https://sourceforge.net/projects/mines-perfect/ (the author's page is
     www.czeppi.de). You do not need the Windows program itself, only the sound pack.
  2. Unzip it. It holds seven files: FLAG.WAV, LOST.WAV, ERROR.WAV, NEW.WAV, Won.wav, OPEN.WAV and
     Deadend.wav, in a folder called sound.
  3. Copy them into roms/ports/minesperfect/sound/ on the card and let them REPLACE the files that
     are there (capital letters in the names do not matter). If you copy under other names, delete
     ours first, otherwise ours are the ones played. A sound you leave out keeps the port's own.
  4. Start the game.
Any .wav files of your own work the same way (8 or 16 bit, mono or stereo, any sample rate).


MORE BOARDS
-----------
A board is a .txt file and a .bmp picture with the same name in the boards folder. Three extra ones
(Parquet, Pentagon, Triangle14) are included; put more there and they appear under Board.


FILES AND TROUBLESHOOTING
-------------------------
Everything the game remembers is in its folder, roms/ports/minesperfect/:
  mineperf.ini        your level, mode, board and best times (delete it to start fresh)
  minesperfect.cfg    sound, zoom, background and the solver switch
  logs/               your saved games
  log.txt             what the game printed on its last run - please attach it if you report a problem
A normal exit ends log.txt with "EXIT CODE: 0".
The original's online high score sending is not part of this port.
