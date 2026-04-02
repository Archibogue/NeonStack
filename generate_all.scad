include <neonstack_common.scad>;

// ==========================================================
// NEON STACK — V5 alpha layouts for recursive stack gameplay
// ==========================================================
// Available modes:
// "catalog"           -> 1 plate of all variants in current theme
// "catalog_dual"      -> cyan catalog + orange catalog
// "kit_player"        -> recommended V5 alpha kit in current theme
// "kit_cyan"          -> recommended kit for cyan player
// "kit_orange"        -> recommended kit for orange player
// "kit_dual"          -> both players on one layout
//
// V5 alpha assumptions:
// - overflow on 8th frame
// - practical numbered depth range = 0..6
// - BUG = broken function marker
// - ∞ = unbounded recursion marker

mode = is_undef(mode) ? "catalog" : mode;
spacing_x = 58;
spacing_y = 58;

module numbered_frame(n="0", t="cyan") {
    let(theme = t)
    union() {
        normal_frame_body();
        themed("normal")
            emboss_on_frame()
                centered_text(n, size = 8.0, h = label_h, font = font_bold);
    }
}

module ghost0_frame(t="cyan") {
    let(theme = t)
    union() {
        special_frame_body(kind = "ghost", ff = carrier_ff_special);
        themed("ghost")
            emboss_on_frame() {
                linear_extrude(height = label_h)
                    difference() {
                        ghost_icon(0.72);
                        translate([-1.10, 1.45, 0]) circle(r = 0.42);
                        translate([ 1.10, 1.45, 0]) circle(r = 0.42);
                    }
                translate([0, -0.9, 0])
                    centered_text("0", size = 4.4, h = label_h, font = font_bold);
            }
    }
}

module inf_frame(t="cyan") {
    let(theme = t)
    union() {
        special_frame_body(kind = "infinite", ff = carrier_ff_normal);
        themed("infinite")
            emboss_on_frame()
                centered_text("∞", size = 10.5, h = label_h, font = font_bold);
    }
}

module bug_frame(t="cyan") {
    let(theme = t)
    union() {
        special_frame_body(kind = "bug", ff = carrier_ff_special);
        themed("bug")
            emboss_on_frame() {
                translate([0, 3.0, 0]) linear_extrude(height = label_h) bug_icon(0.62);
                translate([0, -5.4, 0]) centered_text("BUG", size = 3.8, h = label_h, font = font_bold);
            }
    }
}

module ovr_ring() {
    union() {
        overflow_ring();
        themed("overflow")
            translate([0,0,overflow_h - 0.01]) centered_text("OVR", size = 6.0, h = label_h, font = font_bold);
    }
}

module player_base(t="cyan") {
    let(theme = t) branch_base();
}

module catalog_one(t="cyan") {
    // Top row: numbered depth markers 0..3
    translate([-2.0*spacing_x, spacing_y, 0]) numbered_frame("0", t);
    translate([-1.0*spacing_x, spacing_y, 0]) numbered_frame("1", t);
    translate([ 0.0*spacing_x, spacing_y, 0]) numbered_frame("2", t);
    translate([ 1.0*spacing_x, spacing_y, 0]) numbered_frame("3", t);
    translate([ 2.0*spacing_x, spacing_y, 0]) numbered_frame("4", t);

    // Middle row: remaining depth marker + special states
    translate([-2.0*spacing_x, 0, 0]) numbered_frame("5", t);
    translate([-1.0*spacing_x, 0, 0]) numbered_frame("6", t);
    translate([ 0.0*spacing_x, 0, 0]) ghost0_frame(t);
    translate([ 1.0*spacing_x, 0, 0]) inf_frame(t);
    translate([ 2.0*spacing_x, 0, 0]) bug_frame(t);

    // Bottom row: event marker + branch base
    translate([-0.7*spacing_x, -spacing_y, 0]) ovr_ring();
    translate([ 1.2*spacing_x, -spacing_y, 0]) player_base(t);
}

module player_kit(t="cyan", x0=0, y0=0) {
    // 6 bases / function slots
    for (i = [0:5]) translate([x0 + i*62, y0 + 0, 0]) player_base(t);

    // Numbered frames for practical depth range 0..6
    // 29 normal frames: 7x0, 6x1, 5x2, 4x3, 3x4, 2x5, 2x6
    for (i = [0:6]) translate([x0 + i*52, y0 + 72, 0]) numbered_frame("0", t);
    for (i = [0:5]) translate([x0 + i*52, y0 + 130, 0]) numbered_frame("1", t);

    for (i = [0:4]) translate([x0 + i*52, y0 + 188, 0]) numbered_frame("2", t);
    for (i = [0:3]) translate([x0 + 300 + i*52, y0 + 188, 0]) numbered_frame("3", t);

    for (i = [0:2]) translate([x0 + i*52, y0 + 246, 0]) numbered_frame("4", t);
    for (i = [0:1]) translate([x0 + 190 + i*52, y0 + 246, 0]) numbered_frame("5", t);
    for (i = [0:1]) translate([x0 + 320 + i*52, y0 + 246, 0]) numbered_frame("6", t);

    // 4 ghost0, 4 infinite, 5 bug, 3 overflow
    for (i = [0:3]) translate([x0 + i*52, y0 + 304, 0]) ghost0_frame(t);
    for (i = [0:3]) translate([x0 + 230 + i*52, y0 + 304, 0]) inf_frame(t);
    for (i = [0:4]) translate([x0 + i*52, y0 + 362, 0]) bug_frame(t);
    for (i = [0:2]) translate([x0 + 290 + i*60, y0 + 364, 0]) ovr_ring();
}

if (mode == "catalog") {
    catalog_one(theme);
} else if (mode == "catalog_dual") {
    translate([-175, 0, 0]) catalog_one("cyan");
    translate([ 175, 0, 0]) catalog_one("orange");
} else if (mode == "kit_player") {
    player_kit(theme);
} else if (mode == "kit_cyan") {
    player_kit("cyan");
} else if (mode == "kit_orange") {
    player_kit("orange");
} else if (mode == "kit_dual") {
    player_kit("cyan", 0, 0);
    player_kit("orange", 660, 0);
} else {
    echo("Unknown mode.");
}
