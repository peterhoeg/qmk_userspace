#include QMK_KEYBOARD_H

/* enum layers { _BASE, _FIRST, _SECOND, _THIRD }; */

uint16_t get_tapping_term(uint16_t keycode, keyrecord_t *record) {
    switch (keycode) {
        case LT(2, KC_F):
            return 250;
        case LCTL_T(KC_ESC):
            return 150;
        default:
            return TAPPING_TERM;
    }
}
