// Shared code included from each keyboard's keymap.c
// QMK_KEYBOARD_H is already included by the including file
#include "version.h"

enum custom_keycodes {
  C_QMKV = QK_USER_0,
};

/// Combo definitions
const uint16_t PROGMEM combo_parens_left[] = {KC_Q, KC_W, COMBO_END};
const uint16_t PROGMEM combo_dk_ae[] = {KC_A, KC_E, COMBO_END};

/// Combos to output
combo_t key_combos[] = {
    COMBO(combo_parens_left, KC_LPRN),
    COMBO(combo_dk_ae, UP(0xe6, 0xc6)),
};

#include "keymap_dk.c"

/// Custom tapping term
uint16_t get_tapping_term(uint16_t keycode, keyrecord_t *record) {
  switch (keycode) {
#ifdef DOUBLE_TAP_SHIFT_TURNS_ON_CAPS_WORD
  // when we lower the TAPPING_TERM it becomes really hard to trigger, so bump this
  case KC_LSFT:
    return 250;
#endif
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

/// Send QMK version as keystrokes
bool process_record_user(uint16_t keycode, keyrecord_t *record) {
  switch (keycode) {
  case C_QMKV:
    if (record->event.pressed) {
      send_string(QMK_VERSION);
    }
    return false;
  default:
    return true;
  }
}
