const uint16_t PROGMEM combo_parens_left[] = {KC_W, KC_W, COMBO_END};
/* const uint16_t PROGMEM test_combo2[] = {KC_C, KC_D, COMBO_END}; */

combo_t key_combos[] = {
    COMBO(combo_parens_left, KC_LPRN),
    // COMBO(test_combo2, LCTL(KC_Z)),
};
