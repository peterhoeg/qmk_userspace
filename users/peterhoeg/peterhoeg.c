#include QMK_KEYBOARD_H

/* enum layers { _BASE, _FIRST, _SECOND, _THIRD }; */

uint16_t get_tapping_term(uint16_t keycode, keyrecord_t *record) {
    switch (keycode) {
        /* case SFT_T(KC_SPC): */
        /*     return TAPPING_TERM + 1250; */
        default:
            return TAPPING_TERM;
    }
}
