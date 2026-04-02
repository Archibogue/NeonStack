include <neonstack_common.scad>;

// Usage examples:
//   theme = "orange";
//   number = "6";
//   include <frame_numbered.scad>;
//
// V5 alpha note:
// Numbered frames are mainly intended for recursive depth markers 0..6
// because overflow now occurs when an 8th frame would be added.

number = is_undef(number) ? "0" : number;
label_size = is_undef(label_size) ? 8.0 : label_size;

union() {
    normal_frame_body();
    themed("normal")
        emboss_on_frame()
            centered_text(number, size = label_size, h = label_h, font = font_bold);
}
