#include QMK_KEYBOARD_H
#include "peterhoeg.h"
#include "combos.inc"

/// Per-key handedness for chordal hold opposite-hands rule.
/// Only the alpha keys need L/R - everything else is exempt ('*')
/// so that modifiers, layer taps, and thumb keys chord freely.
const char chordal_hold_layout[MATRIX_ROWS][MATRIX_COLS] PROGMEM =
    LAYOUT(
        // row 0: ~  1  2  3  4  5  =          -  6  7  8  9  0  Bspc
              '*','*','*','*','*','*','*',   '*','*','*','*','*','*','*',
        // row 1: Tab Q  W  E  R  T  [          ]  Y  U  I  O  P  Bsls
              '*','L','L','L','L','L','*',   '*','R','R','R','R','R','*',
        // row 2: Esc A  S  D  F  G  Bspc    Ent  H  J  K  L  ;  '
              '*','L','L','L','L','L','*',   '*','R','R','R','R','R','*',
        // row 3: Sft Z  X  C  V  B                N  M  ,  .  /  Sft
              '*','L','L','L','L','L',        'R','R','R','*','*','*',
        // row 4: Ctl Gui Alt LAPO CtlEsc [big]   [big] Del RAPC TWin PgUp PgDn
              '*','*','*','*','*',    '*',        '*','*','*','*','*','*',
        // thumb: Spc Gui Esc                     Ralt Rctl Spc
              '*','*','*',                    '*','*','*'
    );

#include "keymap_generated.c"

/* Local Variables: */
/* +format-with-lsp: nil */
/* End: */
