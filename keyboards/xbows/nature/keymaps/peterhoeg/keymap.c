#include QMK_KEYBOARD_H
#include "peterhoeg.c"

/// Per-key handedness for chordal hold opposite-hands rule.
/// Only the alpha keys need L/R - everything else is exempt ('*')
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
