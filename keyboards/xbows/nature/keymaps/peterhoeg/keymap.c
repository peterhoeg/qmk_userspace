#include QMK_KEYBOARD_H

// `QK_USER` avoids collisions with existing keycodes. or should I use `SAFE_RANGE` ?
enum keycodes { PH_NOT_IN_USE_YET = QK_USER };

enum layers { _BASE = 0, _WINDOWS, _ARROWS, _MOUSE, _NUMBERS, _DANISH };

/// Combo definitions
const uint16_t PROGMEM combo_parens_left[] = {KC_Q, KC_W, COMBO_END};
const uint16_t PROGMEM combo_dk_ae[] = {KC_A, KC_E, COMBO_END};

/// Combos to output
combo_t key_combos[] = {
    COMBO(combo_parens_left, KC_LPRN),
    COMBO(combo_dk_ae, UP(0xe6, 0xc6)),
};

#include "keymap_dk.c"

// #include "keymap_rgb.c"

/// Custom tapping term
uint16_t get_tapping_term(uint16_t keycode, keyrecord_t *record) {
  switch (keycode) {
#ifdef DOUBLE_TAP_SHIFT_TURNS_ON_CAPS_WORD
  // when we lower the TAPPING_TERM it becomes really hard to trigger, so bump this
  case KC_LSFT:
    return 250;
#endif
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

/**
 *  Permissive hold
 *  @param keycode The keycode to check for
 *  @param record The key record
 *
 *  @returns bool
 */
bool get_permissive_hold(uint16_t keycode, keyrecord_t *record) {
  switch (keycode) {
  case C_GUIA:
    return false;
  default:
    // select the hold action when another key is tapped.
    return true;
  }
}

/**
 *  This is temporary until I have it properly set up
 *
 *  @param key The key in question
 */
char chordal_hold_handedness(keypos_t key) {
  // exempt the left column and the last row
  if (key.col == 0 || key.row == MATRIX_ROWS - 1) {
    return '*';
  }
  // On split keyboards, typically, the first half of the rows are on the
  // left, and the other half are on the right.
  return key.col < MATRIX_COLS / 2 ? 'L' : 'R';
}

#include "keymap_generated.c"

/* Local Variables: */
/* +format-with-lsp: nil */
/* End: */
