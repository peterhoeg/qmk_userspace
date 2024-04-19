#define LAYER_STATE_8BIT // we don't need more than 8 layers
#define NO_MUSIC_MODE
#define RGBLIGHT_LAYERS 2 // default is 8

// Tap-and-hold settings
#define PERMISSIVE_HOLD
#define TAPPING_TERM 200 // default is 200
#define TAPPING_TERM_PER_KEY

// Caps word
#define DOUBLE_TAP_SHIFT_TURNS_ON_CAPS_WORD

// I don't have Cherry MX Lock switches
#undef LOCKING_SUPPORT_ENABLE
#undef LOCKING_RESYNC_ENABLE

#define C_2TAB LT(2, KC_TAB)
#define C_2V LT(2, KC_V)
#define C_GUIA LGUI_T(KC_A)
#define C_ALTS LALT_T(KC_S)
#define C_SFTD LSFT_T(KC_D)
#define C_CTLF LCTL_T(KC_F)
#define C_CTLJ RCTL_T(KC_J)
#define C_SFTK RSFT_T(KC_K)
#define C_ALTL LALT_T(KC_L) // RALT is wonky, so use LALT
#define C_GUIsc RGUI_T(KC_SCLN)
#define C_CTLes LCTL_T(KC_ESC)

/* "CL_CTLF" "KC_G"    "KC_BSPC"           "KC_H"    "RCTL_T(KC_J)" "RSFT_T(KC_K)" "LALT_T(KC_L)" "LGUI_T(KC_SCLN)" "KC_QUOT" "KC_BSLS"           "KC_PGDN" */
