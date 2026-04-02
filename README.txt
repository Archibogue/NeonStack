NEON STACK — OpenSCAD kit aligned to V5 alpha gameplay
======================================================

This repository snapshot updates the printable stack components so they match
the new V5 alpha direction of the game:
- no duel of Programs/Creatures anymore
- the game is centered on call stacks and recursive depth
- players manage Memory instead of Energy
- a completed Function scores points
- broken Functions remain in memory until cleaned
- Fibonacci is used as the default recursion reward curve

Core gameplay assumptions reflected by this kit
----------------------------------------------
- Each player starts with 20 total Memory and 20 free Memory.
- Overflow happens when a Function would receive an 8th frame.
  => practical safe visible depth is therefore 0..6.
- Numbered frames are now intended for recursive depth markers 0 to 6.
- Bases represent active Function slots / branches.
- BUG pieces are used for broken functions / corrupted stack state.
- Infinite frames are used for unbounded recursion / leaking branches.
- Overflow rings remain separate event markers.

Files
-----
- neonstack_common.scad   -> shared geometry, colors, helper modules
- frame_numbered.scad     -> numbered frame (set number="0".."6")
- frame_ghost0.scad       -> ghost frame with small 0
- frame_infinite.scad     -> infinite frame
- frame_bug.scad          -> bug / broken-state frame
- ring_overflow.scad      -> overflow marker ring
- branch_base.scad        -> function slot / branch base
- generate_all.scad       -> catalog and printable player kits
- RULES_V5_ALPHA.md       -> alpha rules reference for the redesigned game
- COMPONENT_COUNTS_V5_ALPHA.md -> suggested print counts per player
- CARD_MIGRATION_NOTES_V5.md   -> guidance for migrating the old card set

Recommended first step
----------------------
- Open generate_all.scad
- Try mode = "catalog_dual"
- Then export kit_cyan and kit_orange separately for slicing

Important note
--------------
- Colors are preview colors in OpenSCAD only.
- STL does not preserve color.
- Export cyan and orange parts separately for real two-color printing.

Useful parameters in neonstack_common.scad
-----------------------------------------
- carrier_ff_normal / carrier_ff_special  -> central support plate sizes
- carrier_branch_w                        -> branch width
- socket_d                                -> loosen/tighten stacking fit

Mechanical notes retained from v6
---------------------------------
- alignment pegs stay in the solid outer ring of each frame
- matching sockets stay on top of each frame and in the branch base
- the goal remains reliable interlocking for FDM prints
