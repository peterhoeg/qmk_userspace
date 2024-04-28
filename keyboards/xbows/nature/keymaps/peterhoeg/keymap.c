#include QMK_KEYBOARD_H

enum layers { _BASE, _WINDOWS, _ARROWS, _NUMBERS , _DANISH};

#include "keymap_combo.c"

#include "keymap_dk.c"

// #include "keymap_rgb.c"

#include "keymap_tap.c"

#define ___ KC_TRNS
#define _x_ KC_NO

#include "keymap_generated.c"

/* Local Variables: */
/* apheleia-inhibit: 't */
/* +format-with-lsp: nil */
/* End: */
