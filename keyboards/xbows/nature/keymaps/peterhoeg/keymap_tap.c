#include QMK_KEYBOARD_H

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
