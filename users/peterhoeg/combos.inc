// Shared combo definitions - included from each keymap.c because QMK's
// keymap_introspection.c expects key_combos[] in the keymap translation unit.

const uint16_t PROGMEM combo_parens_left[] = {KC_Q, KC_W, COMBO_END};
const uint16_t PROGMEM combo_dk_ae[] = {KC_A, KC_E, COMBO_END};

combo_t key_combos[] = {
    COMBO(combo_parens_left, KC_LPRN),
    COMBO(combo_dk_ae, UP(0xe6, 0xc6)),
};
