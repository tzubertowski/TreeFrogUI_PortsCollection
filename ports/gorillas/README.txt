GORILLAS  -  for the Datafrog SF3500
=====================================

Two gorillas stand on the roofs of a city. Take turns hurling exploding
bananas at each other. Set the Angle and the Velocity of your throw, allow
for the Wind (the arrow along the bottom), the Gravity and the skyline.
Every banana that lands on a building blows a hole in it. Hit the other
gorilla to score; hit yourself and your opponent scores instead.

This is a new game written for this handheld in the spirit of the QBasic
Gorillas that came with MS-DOS (1990). It contains none of Microsoft's code,
pictures or sounds: the gorillas, banana, sun, city and every sound are
drawn and synthesized by the game itself.

PLAYING
-------
Title screen:  Up/Down pick a row, A selects, B goes back, START begins
               the match from anywhere.

  Configuration   Mode: vs CPU (you are on the left), 2 Players (pass the
                  pad), or CPU vs CPU (sit back and watch).
                  Opponent: Cub, Chimp, Baboon, Orangutan, Silverback -
                  from wild throwing that ignores the wind up to a gorilla
                  that rarely misses. Computer players zero in with
                  every miss.
                  Rounds: most rounds won takes the match (a tie plays
                  one more).
                  Gravity: the surface gravity of Mercury, Venus, Earth,
                  the Moon, Mars, Jupiter, Saturn, Uranus, Neptune or
                  Pluto. On the light worlds (Moon, Pluto) bananas hang
                  in the air for ages, so the wind has plenty of time
                  to push them: a gale there is brutal for everyone.
                  Wind: Off, per round (the classic), or every throw.
  Audio/Visual    Input: D-pad + keypad, D-pad only, or keypad only.
                  Aim Guide: a dotted line from your gorilla shows your aim.
                  Last-Shot Trail: marks where your last throws flew.
                  Player Names: A opens an on-screen keyboard.
                  Gorilla 1 / Gorilla 2: pick a look for each gorilla -
                  twelve colours and costumes. Purely cosmetic.
                  Gorilla 2 starts on Auto: every computer opponent wears
                  its own look (Cub the party hat, Chimp green, Baboon
                  red, Orangutan the shades, Silverback the crown).
                  Pick a look yourself to override it.
                  Theme: how the whole game looks. Q-BASIC (the default) is
                  the purist one: the original's blue sky and flat red,
                  cyan and gray blocks, its flat yellow sun, a peach
                  gorilla on each side, flat yellow bananas, crimson
                  explosions, the plain white prompts in the corners and
                  the score in a small box, a black text-screen menu with
                  the steady asterisk border, and PC-speaker beeps for sound.
                  (Our own drawings and sounds in that style, not the
                  original's files.) Nothing in any theme flashes: the
                  border of asterisks on its text screens stays steady.
                  Classic is this game's own first look: gradient sky,
                  bevelled blocks.
                  Uptown is a brick city by day,
                  with water towers, shops and street lamps. Moonlit is a
                  night city under cloud, with a searchlight. Harbor is a
                  night quay with lit windows reflected in the water.
                  The Q-BASIC theme brings its own gorillas and sun, so the
                  Gorilla and Sky rows only appear for the other themes.
                  Sky: Auto (the theme's own sun or moon), a sun (Smiley,
                  Cool, Retro, Q-BASIC), a moon (Crescent, Full, Sleepy) or Random
                  each round. A moon turns the scene to night, with stars
                  and a glow of moonlight.
                  Theme and Sky are purely cosmetic - the game plays
                  exactly the same.
                  Volume.
  Play!           Starts the match.
  Quick Game      Straight into a match against the computer with everything
                  rolled at random: opponent, rounds (1, 3 or 5), gravity,
                  wind, theme and your gorilla. It ignores your settings and
                  leaves them exactly as they were.
  How To Play     Rules and controls.
  Exit Game       Back to the front end.

During your turn:
  Up / Down       Angle (0-180). Hold to go faster.
  Left / Right    Velocity (1-200). Hold to go faster.
  A               Throw!
  X               Number keypad: type the Angle, press START, type the
                  Velocity, press START - and the banana flies, just like
                  the original's prompts.
  B               Aim guide on / off
  START           Pause menu (volume, aim guide, quit to title)
  SELECT+START    Back to the title screen (from the title: exit)

On the keypad / keyboard: D-pad moves, A types, B deletes, START accepts,
SELECT cancels (X switches case on the letter keyboard).

The sun is easily startled. Throw a banana through it and see.

FILES
-----
gorillas.txt    your settings (written by the menu; delete it to reset)
log.txt         what the game printed on its last run

CREDITS AND LICENCE
-------------------
Gorillas for the Data Frog SF3500: game, art, sounds and computer players by
the port author (AthruZ / Kryptikone316), MIT licence (licenses/LICENSE.txt in
the Ports Collection, LICENSE in the source repository).
Inspired by "Gorillas" (QBasic, Microsoft, 1990). Not affiliated with or
endorsed by Microsoft; it contains none of their code, pictures or sounds.
Font: font8x8 by Daniel Hepper (public domain).
Display, gamepad and audio glue for the SF3500 derived from TreeFrogUI's
pico286 SF3000 patch.
