#include QMK_KEYBOARD_H

enum layers { _BASE, _WINDOWS, _ARROWS, _NUMBERS };

uint16_t get_tapping_term(uint16_t keycode, keyrecord_t *record) {
    switch (keycode) {
        case L2_ESC:
        case L2_V:
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

bool rgb_matrix_indicators_user(void) {
    uint8_t current_layer = get_highest_layer(layer_state);
    switch (current_layer) {
        case _BASE:
            rgb_matrix_set_color_all(0xFF, 0x00, 0x00); // RGB red
            break;
        case _WINDOWS:
            rgb_matrix_set_color_all(0x00, 0xFF, 0x00); // RGB green
            break;
        case _ARROWS:
            rgb_matrix_set_color_all(0x00, 0x00, 0xFF); // RGB blue
            break;
        case _NUMBERS:
            rgb_matrix_set_color_all(0xFF, 0xFF, 0x00); // RGB yellow
            break;
        default:
            break;
    }
    return false;
}
