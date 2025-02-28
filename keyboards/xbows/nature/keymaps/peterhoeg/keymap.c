#include QMK_KEYBOARD_H

enum layers { _BASE, _WINDOWS, _ARROWS, _NUMBERS, _DANISH };

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
  case L3_ESC:
  case L3_TAB:
  case L5_V:
  case C_GUIA:
    return 150;
  case C_ALTS:
    return 150;
  case C_SFTD:
    return 150;
  case C_CTLF:
    return 150;
  case C_CTLJ:
    return 150;
  case C_SFTK:
    return 150;
  case C_ALTL:
    return 150;
  case C_GUIsc:
    return TAPPING_TERM;
  case C_CTLes:
    return 150;
  case SC_LAPO:
  case SC_RAPC:
    return 100;
  default:
    return TAPPING_TERM;
  }
}

bool get_permissive_hold(uint16_t keycode, keyrecord_t *record) {
  switch (keycode) {
  case C_GUIA:
    return false;
  default:
    // select the hold action when another key is tapped.
    return true;
  }
}

// this is temporary until I have it properly set up
char chordal_hold_handedness(keypos_t key) {
  /*
  if (key.col == 0 || key.col == MATRIX_COLS - 1) {
      return '*';  // Exempt the outer columns.
  }
  */
  // On split keyboards, typically, the first half of the rows are on the
  // left, and the other half are on the right.
  return key.col < MATRIX_COLS / 2 ? 'L' : 'R';
}

#define ___ KC_TRNS
#define _x_ KC_NO

#include "keymap_generated.c"

/* Local Variables: */
/* +format-with-lsp: nil */
/* End: */
