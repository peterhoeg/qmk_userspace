#include QMK_KEYBOARD_H

enum layers { _BASE, _WINDOWS, _ARROWS, _NUMBERS , _DANISH};

// combos
const uint16_t PROGMEM combo_parens_left[] = {KC_Q, KC_W, COMBO_END};
/* const uint16_t PROGMEM test_combo2[] = {KC_C, KC_D, COMBO_END}; */

combo_t key_combos[] = {
    COMBO(combo_parens_left, KC_LPRN),
    // COMBO(test_combo2, LCTL(KC_Z)),
};

#include "keymap_dk.c"

// #include "keymap_rgb.c"

// tapping
uint16_t get_tapping_term(uint16_t keycode, keyrecord_t *record) {
    switch (keycode) {
        case L2_ESC:
        case L4_V:
        case C_GUIA:
        case C_ALTS:
        case C_SFTD:
        case C_CTLF:
        case C_CTLJ:
        case C_SFTK:
        case C_ALTL:
        case C_GUIsc:
            return TAPPING_TERM;
        case C_CTLes:
            return 150;
        default:
            return TAPPING_TERM;
    }
}

#define ___ KC_TRNS
#define _x_ KC_NO

#include "keymap_generated.c"

/* Local Variables: */
/* apheleia-inhibit: 't */
/* +format-with-lsp: nil */
/* End: */
