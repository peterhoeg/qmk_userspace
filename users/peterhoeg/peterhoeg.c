#include QMK_KEYBOARD_H

enum layers { _BASE, _WINDOWS, _ARROWS, _NUMBERS };

uint16_t get_tapping_term(uint16_t keycode, keyrecord_t *record) {
    switch (keycode) {
        case C_2TAB:
        case C_2V:
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
