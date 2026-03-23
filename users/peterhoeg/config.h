#pragma once

#ifndef __ASSEMBLER__
#include "layers.h"
#endif

#define LAYER_STATE_8BIT // we don't need more than 8 layers
// Tap-and-hold settings
#define CHORDAL_HOLD
// #define HOLD_ON_OTHER_KEY_PRESS // alternative: PERMISSIVE_HOLD
#define PERMISSIVE_HOLD // alternative: HOLD_ON_OTHER_KEY_PRESS
#define PERMISSIVE_HOLD_PER_KEY
#define TAPPING_TERM 150 // default is 200
#define TAPPING_TERM_PER_KEY
#define USB_POLLING_INTERVAL_MS 5
#define FLOW_TAP_TERM 150

// Caps word
#define DOUBLE_TAP_SHIFT_TURNS_ON_CAPS_WORD

#define L2_ESC LT(_ARROWS, KC_ESC)
#define L3_TAB LT(_MOUSE, KC_TAB)
#define L5_V LT(_DANISH, KC_V)

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

// layer toggling
#define _T_BAS TG(_BASE)
#define _T_WIN TG(_WINDOWS)

#define ___ KC_TRNS
#define _x_ KC_NO

// Everything below this is not used and thus disabled to save space

// I don't have Cherry MX Lock switches
#undef LOCKING_SUPPORT_ENABLE
#undef LOCKING_RESYNC_ENABLE

#define NO_MUSIC_MODE
