include <neonstack_common.scad>;

union() {
    special_frame_body(kind = "infinite", ff = carrier_ff_normal);
    themed("infinite")
        emboss_on_frame()
            centered_text("∞", size = 10.5, h = label_h, font = font_bold);
}
