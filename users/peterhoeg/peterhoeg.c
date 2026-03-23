// Shared userspace code compiled via SRC in rules.mk
#include "peterhoeg.h"
#include "version.h"

/// Weak keymap-specific overrides - no-op defaults
__attribute__((weak))
bool process_record_keymap(uint16_t keycode, keyrecord_t *record) {
  return true;
}

__attribute__((weak))
uint16_t get_tapping_term_keymap(uint16_t keycode, keyrecord_t *record) {
  return TAPPING_TERM;
}

__attribute__((weak))
bool get_permissive_hold_keymap(uint16_t keycode, keyrecord_t *record) {
  // select the hold action when another key is tapped
  return true;
}

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
    return get_tapping_term_keymap(keycode, record);
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
    return get_permissive_hold_keymap(keycode, record);
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
    return process_record_keymap(keycode, record);
  }
}
