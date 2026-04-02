$fn = 96;

// ==============================================
// NEON STACK — components aligned to V5 alpha
// ==============================================
// Gameplay alignment note:
// - numbered frames track recursive depth on call stacks
// - BUG pieces mark broken / corrupted functions
// - infinite pieces mark unbounded recursion
// - overflow rings mark stack overflow events
// The mechanical carrier logic from the earlier redesign is kept intact.

// ---- Theme / preview colors ----
theme = is_undef(theme) ? "cyan" : theme;

function theme_rgb(t) =
    (t == "orange") ? [1.00, 0.48, 0.10, 1] :
    [0.10, 0.95, 1.00, 1];

function special_rgb(kind) =
    (kind == "ghost")    ? [0.88, 0.95, 1.00, 1] :
    (kind == "infinite") ? [0.45, 0.20, 0.90, 1] :
    (kind == "bug")      ? [0.86, 0.18, 0.18, 1] :
    (kind == "overflow") ? [1.00, 0.06, 0.06, 1] :
                           theme_rgb(theme);

module themed(kind="normal") {
    color(special_rgb(kind)) children();
}

// ---- Global dimensions ----
outside_ff = 44;
inside_ff  = 28;
frame_h    = 8;
wall_min_h = 1.2;
label_h    = 0.8;

// Decorative groove depth
groove_d       = 0.7;
groove_w_outer = 1.8;
groove_w_inner = 1.5;
groove_w_line  = 1.6;

// ---- Peg / socket alignment ----
// v6: move alignment features fully into the solid outer ring.
// The previous versions placed them too close to the central void.
peg_count   = 3;
peg_d       = 3.4;
peg_h       = 1.8;
peg_offset  = 19.2;   // safely inside the solid ring (between inner cavity and outer edge)
peg_rot     = 30;     // centered on alternating hex faces

socket_d    = 3.85;   // extra clearance for FDM
socket_h    = 2.0;
socket_rot  = peg_rot;

// ---- Base ----
base_ff      = 56;
base_h       = 4;
seat_depth   = 1.8;
label_tab_w  = 18;
label_tab_d  = 6;
label_tab_h  = 8;

// ---- Overflow ring ----
overflow_outer_ff = 50;
overflow_inner_ff = 37;
overflow_h        = 5;

// ---- Unified central carrier system ----
// Based on the overflow support idea: solid center + six visible branches.
carrier_h               = 1.2;
carrier_ff_normal       = 20;
carrier_ff_special      = 24;
carrier_branch_w        = 4.4;
carrier_branch_overlap  = 4.2;
carrier_branch_rot      = 30;

overflow_carrier_ff      = 18;
overflow_carrier_branch_w = 4.2;
overflow_carrier_overlap  = 3.8;
overflow_carrier_rot      = 30;

// ---- Text defaults ----
font_bold    = "Liberation Sans:style=Bold";
font_regular = "Liberation Sans:style=Regular";

// ============ HELPERS ============
module hex2d(ff) {
    circle(r = ff / sqrt(3), $fn = 6);
}

module hex_prism(ff, h) {
    cylinder(h = h, r = ff / sqrt(3), $fn = 6);
}

module radial_positions(count = 3, radius = 10, rot = 0) {
    for (a = [0 : 360/count : 360 - 360/count]) {
        rotate([0, 0, a + rot]) translate([radius, 0, 0]) children();
    }
}

// ---- Tron surface motifs ----
module tron_ring_groove(ff_outer, ff_inner, z, depth) {
    translate([0, 0, z])
        linear_extrude(height = depth)
            difference() {
                hex2d(ff_outer);
                hex2d(ff_inner);
            }
}

module tron_spoke_grooves(inner_len = 7.2, outer_len = 5.6, z = frame_h - groove_d, depth = groove_d, w = groove_w_line, rot = 30) {
    for (a = [0, 120, 240]) {
        rotate([0, 0, a + rot])
            translate([0, 0, z])
                linear_extrude(height = depth)
                    union() {
                        translate([inside_ff/2 + 0.8, -w/2, 0])
                            square([inner_len, w]);
                        translate([outside_ff/2 - outer_len - 1.8, -w/2, 0])
                            square([outer_len, w]);
                    }
    }
}

module tron_corner_notches(ff = outside_ff - 2.5, z = frame_h - groove_d, depth = groove_d) {
    for (a = [0, 60, 120, 180, 240, 300]) {
        rotate([0,0,a + 30])
            translate([ff/2 - 0.6, 0, z])
                linear_extrude(height = depth)
                    polygon(points=[[0,0],[2.6,1.2],[2.6,-1.2]]);
    }
}

// Main frame geometry shared by all frame types.
module frame_shell() {
    difference() {
        union() {
            hex_prism(outside_ff, frame_h);

            // Bottom alignment pegs: attached to the solid outer ring, not the central void.
            translate([0,0,-peg_h])
                radial_positions(count = peg_count, radius = peg_offset, rot = peg_rot)
                    cylinder(h = peg_h, d = peg_d);
        }

        // Central opening
        translate([0,0,-0.1])
            hex_prism(inside_ff, frame_h + peg_h + 0.2);

        // Top sockets for stacking, placed in the same solid ring as the pegs.
        radial_positions(count = peg_count, radius = peg_offset, rot = socket_rot)
            translate([0,0,frame_h - socket_h])
                cylinder(h = socket_h + 0.2, d = socket_d);

        // Inner lightening cavity while keeping a lower ring for strength
        translate([0,0,wall_min_h])
            hex_prism(inside_ff + 5, frame_h - wall_min_h + 0.2);

        // Tron-like shallow surface details
        tron_ring_groove(ff_outer = outside_ff - 3.0, ff_inner = outside_ff - 6.6, z = frame_h - groove_d, depth = groove_d);
        tron_ring_groove(ff_outer = inside_ff + 5.8, ff_inner = inside_ff + 3.0, z = frame_h - groove_d, depth = groove_d);
        tron_spoke_grooves();
        tron_corner_notches();
    }
}

// Shared carrier logic for all frame labels/icons.
module central_carrier_raw(ff = carrier_ff_normal, h = carrier_h, branch_w = carrier_branch_w, overlap = carrier_branch_overlap, rot = carrier_branch_rot) {
    branch_len = ((inside_ff - ff) / 2) + overlap;

    union() {
        translate([0,0,frame_h - h])
            hex_prism(ff, h);

        for (a = [0, 60, 120, 180, 240, 300]) {
            rotate([0,0,a + rot])
                translate([ff/2 - 0.8, -branch_w/2, frame_h - h])
                    cube([branch_len, branch_w, h], center = false);
        }
    }
}

module central_carrier(ff = carrier_ff_normal, h = carrier_h, branch_w = carrier_branch_w, overlap = carrier_branch_overlap, rot = carrier_branch_rot) {
    // Keep the carrier full and obvious: no groove cut into it.
    central_carrier_raw(ff = ff, h = h, branch_w = branch_w, overlap = overlap, rot = rot);
}

// Separate solid carrier for the overflow ring.
module overflow_carrier(ff = overflow_carrier_ff, h = label_h + 0.4, branch_w = overflow_carrier_branch_w, overlap = overflow_carrier_overlap, rot = overflow_carrier_rot) {
    branch_len = ((overflow_inner_ff - ff) / 2) + overlap;

    union() {
        translate([0,0,overflow_h - h])
            hex_prism(ff, h);

        for (a = [0, 60, 120, 180, 240, 300]) {
            rotate([0,0,a + rot])
                translate([ff/2 - 0.8, -branch_w/2, overflow_h - h])
                    cube([branch_len, branch_w, h], center = false);
        }
    }
}

// Base / plinth that receives the first frame of a branch.
module branch_base_raw() {
    difference() {
        union() {
            hex_prism(base_ff, base_h);

            // rear data-tab
            translate([0, base_ff/2 - label_tab_d/2 - 1, label_tab_h/2])
                cube([label_tab_w, label_tab_d, label_tab_h], center = true);
        }

        // seating pocket for first frame
        translate([0,0,base_h - seat_depth])
            hex_prism(outside_ff + 0.6, seat_depth + 0.2);

        // Matching sockets in the base so the first frame interlocks too.
        radial_positions(count = peg_count, radius = peg_offset, rot = socket_rot)
            translate([0,0,base_h - min(socket_h, seat_depth)])
                cylinder(h = min(socket_h, seat_depth) + 0.2, d = socket_d);

        // top decorative ring
        tron_ring_groove(ff_outer = base_ff - 5.2, ff_inner = base_ff - 8.0, z = base_h - groove_d, depth = groove_d);

        // six corner cuts
        for (a = [0, 60, 120, 180, 240, 300]) {
            rotate([0,0,a + 30])
                translate([base_ff/2 - 1.4, 0, base_h - groove_d])
                    linear_extrude(height = groove_d)
                        polygon(points=[[0,0],[3.2,1.4],[3.2,-1.4]]);
        }

        // tab line
        translate([-6.5, base_ff/2 - label_tab_d - 0.2, base_h - groove_d])
            cube([13, 1.5, groove_d + 0.02]);
    }
}

module branch_base() {
    themed("normal") branch_base_raw();
}

// Separate temporary marker for overflow event.
module overflow_ring_raw() {
    difference() {
        hex_prism(overflow_outer_ff, overflow_h);
        translate([0,0,-0.1]) hex_prism(overflow_inner_ff, overflow_h + 0.2);

        tron_ring_groove(ff_outer = overflow_outer_ff - 3.2, ff_inner = overflow_outer_ff - 5.8, z = overflow_h - groove_d, depth = groove_d);
        for (a = [0, 120, 240]) {
            rotate([0,0,a + 30])
                translate([overflow_inner_ff/2 + 1.8, -groove_w_line/2, overflow_h - groove_d])
                    cube([4.8, groove_w_line, groove_d + 0.02]);
        }
    }
}

module overflow_ring() {
    themed("overflow") union() {
        overflow_ring_raw();
        overflow_carrier();
    }
}

module centered_text(txt = "0", size = 8, h = label_h, font = font_bold) {
    linear_extrude(height = h)
        text(txt, size = size, halign = "center", valign = "center", font = font);
}

// Stylized mini ghost, chunkier and more angular for a Tron feel.
module ghost_icon(scale_xy = 1) {
    scale([scale_xy, scale_xy, 1])
        union() {
            offset(r = 0.55)
                polygon(points=[
                    [-4.2,-3.0], [-4.2,2.0], [-2.4,4.6], [0,5.2], [2.4,4.6], [4.2,2.0],
                    [4.2,-3.0], [2.9,-4.5], [1.0,-3.5], [0,-4.8], [-1.0,-3.5], [-2.9,-4.5]
                ]);
        }
}

module bug_icon(scale_xy = 1) {
    scale([scale_xy, scale_xy, 1])
        union() {
            circle(r = 2.9);
            translate([0, 3.3, 0]) circle(r = 1.8);
            for (sy = [-1, 1]) {
                translate([0, sy*1.7, 0]) rotate(25*sy) square([6.5, 0.9], center = true);
                translate([0, sy*0.0, 0]) rotate(8*sy)  square([7.0, 0.9], center = true);
                translate([0, sy*3.0, 0]) rotate(40*sy) square([5.6, 0.9], center = true);
            }
            translate([-1.1, 5.3, 0]) rotate(25) square([3.4, 0.7], center = true);
            translate([ 1.1, 5.3, 0]) rotate(-25) square([3.4, 0.7], center = true);
        }
}

// Emboss artwork on top of a frame.
module emboss_on_frame() {
    translate([0,0,frame_h - 0.01]) children();
}

// Convenience wrappers for frame body in preview color.
module normal_frame_body() {
    themed("normal") union() {
        frame_shell();
        central_carrier(ff = carrier_ff_normal);
    }
}

module special_frame_body(kind="ghost", ff = carrier_ff_special) {
    themed(kind) union() {
        frame_shell();
        central_carrier(ff = ff);
    }
}
