#include QMK_KEYBOARD_H

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

/// Per-key handedness for chordal hold opposite-hands rule.
/// Only the alpha keys need L/R — everything else is exempt ('*')
/// so that modifiers, layer taps, and thumb keys chord freely.
const char chordal_hold_layout[MATRIX_ROWS][MATRIX_COLS] PROGMEM =
    LAYOUT(
        // row 0: Esc  F1   F2   F3   F4   F5   F6   F7   F8   F9   F10  F11  F12  Del  PrtSc
              '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*',
        // row 1: ~    1    2    3    4    5              6    7    8    9    0    -    =    Bksp
              '*', '*', '*', '*', '*', '*',        '*', '*', '*', '*', '*', '*', '*', '*',
        // row 2: Tab  Q    W    E    R    T         Y    U    I    O    P    [    ]    |    PgUp
              '*', 'L', 'L', 'L', 'L', 'L',    'R', 'R', 'R', 'R', 'R', '*', '*', '*', '*',
        // row 3: Esc  A    S    D    F    G    Bksp H    J    K    L    ;    '    \    PgDn
              '*', 'L', 'L', 'L', 'L', 'L', '*', 'R', 'R', 'R', 'R', 'R', '*', '*', '*',
        // row 4: Sft  Z    X    C    V    B    Ent  N    M    ,    .    /    Sft  Up
              '*', 'L', 'L', 'L', 'L', 'L', '*', 'R', 'R', 'R', '*', '*', '*', '*',
        // row 5: Ctl  Gui  Alt  Spc  Ctl  Sft  Spc  Alt  Fn   Ctl  Left Down Rght
              '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*', '*'
    );

#include "keymap_generated.c"

/* Local Variables: */
/* +format-with-lsp: nil */
/* End: */
