include <neonstack_common.scad>;

union() {
    special_frame_body(kind = "bug", ff = carrier_ff_special);

    themed("bug")
        emboss_on_frame() {
            translate([0, 3.0, 0])
                linear_extrude(height = label_h)
                    bug_icon(0.62);

            translate([0, -5.4, 0])
                centered_text("BUG", size = 3.8, h = label_h, font = font_bold);
        }
}
