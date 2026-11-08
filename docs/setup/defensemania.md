# Defense Mania

Defense Mania is a tower defense game by Kris Siepert. Creatures march along a path toward your
exit, and you build, upgrade and repair towers to stop them before they get through. This port runs
the game natively on TreeFrogUI devices and adds a good deal on top of the original: a research
keep (the Bastion) with soldiers and special actions, traps, a Resupply Depot, new creatures, three
new maps, difficulty progression, Endless mode and high scores.

Everything needed to play is included: eight maps and all the sound effects. The background music
is an optional separate download (see below).

Select **Defensemania** under **Games → Ports** to start. Your scores, settings and progress are
saved in the port folder:

```text
roms/ports/defensemania/
├── defensemania.cfg           # picture, volume and balance settings (edit it, then relaunch)
├── .defensemania_settings     # the options you set in the game
├── .defensemania_scores       # your best scores and which difficulties you have won
└── music/                     # the optional music pack (see below)
```

## Controls

| Button | Action |
|--|--|
| D-Pad | Move the cursor (it speeds up the longer you hold; at the screen edge it scrolls the map); move through menus |
| A | On an empty build spot: open the build menu. On a tower: open its menu (repair, upgrade, sell). On the path: set a trap. On the keep: open the Bastion. Confirm in menus |
| B | Close a menu or go back |
| X | Show or hide the green build areas |
| R1 or R2 | Switch between normal speed and fast forward (x2) |
| Start | Open the Bastion menu from anywhere on the map |
| Select | Pause: a menu with **Options**, **Restart Level** and **Exit to Main Menu** |
| Select + Start (held together) | Leave the game at once from the title screens and from the pause menu |

In the build and tower menus the D-Pad picks an entry, **A** takes it and **B** cancels. The first
tower you build starts the match. The game stops while the pause menu or the Bastion is open.

## How a match works

* **Towers.** Arrow towers are cheap and hit ground and air. Ballistas shoot far and hit harder
  with every shot on the same target. Catapults and Canons splash a whole group but cannot hit
  flyers. Freeze towers slow creatures, and slowed creatures take extra damage from every tower.
  The Resupply Depot has no weapon: towers near it shoot faster and mend, and creatures that die in
  its area pay extra gold. Upgrade a tower to make it stronger; selling returns most of what you
  paid.
* **Traps.** Press **A** on the path itself to set Spikes, Glue or a Boulder. Each kind has a limit
  on how many you can have at once. Traps only work on creatures that walk, not on flyers. Ogres
  and trolls will pick up a boulder and throw it at a tower.
* **The Bastion** is the keep beside your exit. Press **Start**, or put the cursor on it and press
  **A**. *Research* costs gold and takes a number of waves; one project at a time, and once it is
  started it cannot be stopped. It improves towers, traps and the keep itself, and the tiers you
  finish in one path (Towers, Traps, Garrison, Command) earn doctrine bonuses. *Actions* (Volley,
  Rally, Mend, Frost Horn) are used from the same menu while a wave is under way, once researched.
  Nothing carries over between matches.
* **Soldiers.** Garrison research trains soldiers you send out from the Actions tab. Vermin Hunters
  deal with spiders, wargs and gnolls; Giant Slayers with orcs, ogres and trolls; Skyguard are the
  only soldiers who can reach flyers; Boulder Rollers push a boulder along the path that hits every
  creature it touches. They hold the last stretch of path before the keep. They are brave but frail
  and do not stay long, so they help your towers rather than replace them.
* **Gold** comes from the creatures you defeat, a little more on harder levels and in later waves.
  Damage to towers needs gold for repairs, so keep some in hand. The icons at the bottom of the
  screen show what the next wave is made of.

## Maps, difficulties and Endless mode

Choose **Play**, pick a map with Up/Down and a difficulty with **L1** (easier) and **R1** (harder);
**Back** and **Play** are at the bottom of the list.

* **Eight maps:** Mountains, The Maze, Dark Woods, River Side, The Swamp, The Tundra, Bigger and
  The Coast.
* Every map starts on **Easy**. Win a map on Easy to unlock Normal on that map, and win it on
  Normal to unlock Hard.
* **The Coast** opens once you have won every other map on Normal.
* A win is **perfect** when every wave is cleared and you finish with at least the lives you started
  with. When all three difficulties of a map are perfect, **X** on the map list switches to that
  map's **Endless** mode, where the waves never stop and keep growing tougher.
* **Scores** lists the best runs, wave reached and perfect marks for each map (Left/Right changes
  the map, **X** switches between normal and Endless). **Y** clears the scores of the map you are
  looking at, after a confirmation; that also closes its Endless mode again.
* **Options → Reset Progress** erases every score and everything you have unlocked, and starts the
  game over from nothing. It asks twice, and it cannot be undone.

## Music (optional)

Without a music pack the game is silent apart from the sound effects. The pack is a separate
download of 16 tracks (about 50 MB, CC0): get `DefenseMania-MusicPack.zip` from the
[Releases page of the source repository](https://github.com/Kryptikone316/defense-mania/releases)
and unzip it onto the card root, so that you end up with `roms/ports/defensemania/music/`. Each map
plays a random track from its own folder, then another when it ends; The Coast uses the Conquest
tracks. You can add your own Ogg Vorbis files to any folder.

## Options and settings

**Options** (on the title screen, and from the pause menu during a match) sets the overall volume,
the music volume, the effects volume, the HQ graphics overlay (a light overlay on the maps that
costs speed; off by default), an on-screen frame rate counter and, on the title screen only, Reset Progress.

`defensemania.cfg` in the port folder holds the picture settings (brightness, contrast, saturation
and gamma, with an override per map), the volumes, the frame cap and the game balance: gold per
kill, how hard creatures hit towers, how fast Endless mode grows, and two shortcuts that open every
difficulty, The Coast and Endless mode at once. Edit it, then relaunch the game. Every line has a
comment.

## Notes

* The game sends at most 30 frames a second by default (`fps_cap` in the cfg), which keeps the
  picture and the sound steady on this device.
* Very rarely a tower may be drawn in the wrong place for a single frame. It is harmless.
* If something goes wrong, the game writes `log.txt` in the port folder.
* The original game asks for the fonts Arial and Arial Black, which are not free to redistribute;
  the Bitter and DejaVu fonts are used instead.
