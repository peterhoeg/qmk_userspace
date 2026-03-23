#pragma once

#include QMK_KEYBOARD_H

enum custom_keycodes {
  C_QMKV = QK_USER_0,
};

enum unicode_names {
  AE_LOWER,
  AE_UPPER,
  OE_LOWER,
  OE_UPPER,
  AA_LOWER,
  AA_UPPER,
};

// Danish characters
#define DK_AE UP(AE_LOWER, AE_UPPER)
#define DK_OE UP(OE_LOWER, OE_UPPER)
#define DK_AA UP(AA_LOWER, AA_UPPER)

// Weak keymap-specific overrides - define these in your keymap.c to
// add keyboard-specific behavior alongside the shared userspace logic.
bool process_record_keymap(uint16_t keycode, keyrecord_t *record);
uint16_t get_tapping_term_keymap(uint16_t keycode, keyrecord_t *record);
bool get_permissive_hold_keymap(uint16_t keycode, keyrecord_t *record);
