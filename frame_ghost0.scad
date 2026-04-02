include <neonstack_common.scad>;

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
