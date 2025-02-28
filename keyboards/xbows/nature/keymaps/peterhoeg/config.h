#define LAYER_STATE_8BIT // we don't need more than 8 layers

// Tap-and-hold settings
#define CHORDAL_HOLD
// #define HOLD_ON_OTHER_KEY_PRESS // alternative: PERMISSIVE_HOLD
#define PERMISSIVE_HOLD // alternative: HOLD_ON_OTHER_KEY_PRESS
#define PERMISSIVE_HOLD_PER_KEY
#define TAPPING_TERM 150 // default is 200
#define TAPPING_TERM_PER_KEY

// Caps word
#define DOUBLE_TAP_SHIFT_TURNS_ON_CAPS_WORD

// Lights, https://docs.qmk.fm/#/feature_rgb_matrix?id=rgb-matrix-effects
// #define RGBLIGHT_LAYERS 2 // default is 8
#define RGB_MATRIX_DEFAULT_ON false
/* #define RGB_MATRIX_DEFAULT_MODE RGB_MATRIX_SOLID_REACTIVE_SIMPLE */
#define RGB_MATRIX_DEFAULT_MODE RGB_MATRIX_NONE

#define L2_ESC LT(2, KC_ESC)
// #define C_2TAB LT(2, KC_TAB)
#define L3_ESC LT(3, KC_ESC) // mouse via ESC
#define L3_TAB LT(3, KC_TAB) // mouse via TAB
#define L5_V LT(5, KC_V)

#define C_CTLes LCTL_T(KC_ESC)

// home row
#define C_GUIA LGUI_T(KC_A)
#define C_ALTS LALT_T(KC_S)
#define C_SFTD LSFT_T(KC_D)
#define C_CTLF LCTL_T(KC_F)
#define C_CTLJ RCTL_T(KC_J)
#define C_SFTK RSFT_T(KC_K)
#define C_ALTL LALT_T(KC_L)
#define C_GUIsc RGUI_T(KC_SCLN)

// Danish characters
#define DK_AE UP(AE_LOWER, AE_UPPER)
#define DK_OE UP(AE_LOWER, AE_UPPER)
#define DK_AA UP(AE_LOWER, AE_UPPER)

// I don't have Cherry MX Lock switches
#undef LOCKING_SUPPORT_ENABLE
#undef LOCKING_RESYNC_ENABLE

#define NO_MUSIC_MODE
