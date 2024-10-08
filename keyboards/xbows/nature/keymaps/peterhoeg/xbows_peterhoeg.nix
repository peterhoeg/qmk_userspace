{
  version = 1;
  author = "Peter Hoeg <peter@hoeg.com>";
  documentation = ''
    Custom configuration for the X-Bows Knight (and Nature v3)
  '';
  notes = ''
    Pending:
      1. copy map from kanata
      2. use SC_LSPO instead of KC_LSFT and SC_RSPC instead of KC_RSFT
  '';
  keyboard = "xbows/knight";
  # keyboard = "xbows/nature";
  keymap = "xbows_peterhoeg";
  layout = "LAYOUT";
  layers = [
    [ # base
      "KC_ESC"  "KC_F1"   "KC_F2"   "KC_F3"   "KC_F4"   "KC_F5"   "KC_F6"   "KC_F7"   "KC_F8"   "KC_F9"   "KC_F10"  "KC_F11"  "KC_F12"  "KC_DEL"  "KC_PSCR"

      "KC_GRV"  "KC_1"    "KC_2"    "KC_3"    "KC_4"    "KC_5"                        "KC_6"    "KC_7"    "KC_8"    "KC_9"    "KC_0"    "KC_MINS" "KC_EQL"  "KC_CALC"
      "L3_TAB"  "KC_Q"    "KC_W"    "KC_E"    "KC_R"    "KC_T"                        "KC_Y"    "KC_U"    "KC_I"    "KC_O"    "KC_P"    "KC_LBRC" "KC_RBRC" "KC_ENT"  "KC_PGUP"
      "L2_ESC"  "C_GUIA"  "C_ALTS"  "C_SFTD"  "C_CTLF"  "KC_G"    "KC_BSPC"           "KC_H"    "C_CTLJ"  "C_SFTK"  "C_ALTL"  "C_GUIsc" "KC_QUOT" "KC_BSLS"           "KC_PGDN"

      "KC_LSFT" "KC_Z"    "KC_X"    "KC_C"    "L5_V"    "KC_B"    "KC_ENT"            "KC_N"    "KC_M"    "KC_COMM" "KC_DOT"  "KC_SLSH" "KC_RSFT"           "KC_UP"
      "KC_LCTL" "KC_LGUI" "KC_LALT"           "C_CTLes"           "KC_LGUI" "SC_RSPC" "KC_SPC"            "KC_RALT"           "TG(1)"   "KC_RCTL" "KC_LEFT" "KC_DOWN" "KC_RGHT"
    ]
    [ # windows
      "___"     "___"     "___"     "___"     "___"     "___"     "___"     "___"     "___"     "___"     "___"     "___"     "___"     "___"     "___"

      "___"     "___"     "___"     "___"     "___"     "___"                         "___"     "___"     "___"     "___"     "___"     "___"     "___"     "KC_BSPC"
      "___"     "___"     "___"     "___"     "___"     "___"                         "___"     "___"     "___"     "___"     "___"     "___"     "___"     "KC_BSLS" "___"
      "KC_LCTL" "KC_A"    "KC_S"    "KC_D"    "KC_F"    "___"     "___"               "___"     "KC_J"    "KC_K"    "KC_L"    "___"     "___"     "KC_ENT"            "___"
      "___"     "___"     "___"     "___"     "KC_V"    "___"     "___"               "___"     "___"     "___"     "___"     "___"     "KC_RSFT"           "___"
      "KC_CAPS" "___"     "___"               "KC_SPC"            "KC_LCTL" "KC_RSFT" "___"               "___"               "___"     "___"     "___"     "___"     "___"
    ]
    [ # arrows
      "QK_BOOT" "___"     "___"     "___"     "___"     "___"     "___"     "___"     "___"     "___"     "___"     "___"     "___"     "NK_TOGG" "EE_CLR"

      "___"     "___"     "___"     "___"     "___"     "___"                         "KC_NUM"  "KC_PSCR" "KC_INS"  "KC_DEL"  "___"     "___"     "___"     "KC_MUTE"
      "RGB_TOG" "RGB_SPI" "RGB_VAI" "RGB_HUI" "RGB_MOD" "___"                         "___"     "KC_HOME" "KC_UP"   "KC_PGUP" "___"     "___"     "___"     "___"     "___"
      "___"     "RGB_SPD" "RGB_VAD" "RGB_HUD" "___"     "___"     "___"               "___"     "KC_LEFT" "KC_DOWN" "KC_RGHT" "___"     "___"     "___"               "___"
      "___"     "___"     "___"     "___"     "___"     "___"     "___"               "___"     "KC_END"  "___"     "KC_PGDN" "___"     "KC_MUTE"           "KC_VOLU"
      "___"     "___"     "___"               "___"               "___"     "___"     "___"               "___"               "TG(0)"   "KC_MPLY" "KC_MPRV" "KC_VOLD" "KC_MNXT"
    ]
    [ # mouse
      "___"     "___"     "___"     "___"     "___"     "___"     "___"     "___"     "___"     "___"     "___"     "___"     "___"     "___"     "___"

      "___"     "___"     "___"     "___"     "___"     "___"                         "___"     "___"     "___"     "___"     "___"     "___"     "___"     "___"
      "___"     "___"     "___"     "___"     "___"     "___"                         "___"     "MS_BTN1" "MS_UP"   "MS_BTN2" "___"     "___"     "___"     "___"     "___"
      "___"     "___"     "___"     "___"     "___"     "___"     "___"               "___"     "MS_LEFT" "MS_DOWN" "MS_RGHT" "___"     "___"     "___"               "___"
      "___"     "___"     "___"     "___"     "___"     "___"     "___"               "___"     "___"     "___"     "___"     "___"     "___"               "___"
      "___"     "___"     "___"               "___"               "___" "___"         "___"               "___"               "___"     "___"     "___"     "___"     "___"
    ]
    [ # numbers
      "KC_TAB"  "_x_"   "_x_"   "_x_"   "_x_"   "_x_"   "_x_"   "_x_"   "_x_"   "_x_"   "_x_"   "_x_"   "_x_"   "_x_"   "_x_"

      "KC_TAB"  "_x_"   "_x_"   "_x_"   "_x_"   "_x_"                       "KC_PSLS" "KC_P7"   "KC_P8"   "KC_P9"   "KC_PPLS" "_x_"   "_x_"   "_x_"
      "KC_TAB"  "_x_"   "_x_"   "_x_"   "_x_"   "_x_"                       "KC_PAST" "KC_P4"   "KC_P5"   "KC_P6"   "KC_PCMM" "_x_"   "_x_"   "_x_"   "_x_"
      "KC_TAB"  "_x_"   "_x_"   "_x_"   "_x_"   "_x_"   "_x_"             "KC_PMNS" "KC_P1"   "KC_P2"   "KC_P3"   "KC_PEQL" "_x_"   "_x_"             "_x_"
      "KC_TAB"  "_x_"   "_x_"   "_x_"   "_x_"   "_x_"   "_x_"             "_x_"   "KC_P0"   "_x_"   "KC_PDOT" "KC_PENT" "_x_"             "_x_"
      "KC_TAB"  "_x_"   "_x_"             "_x_"             "_x_"   "_x_"   "_x_"             "_x_"             "___" "_x_"   "_x_"   "_x_"   "_x_"
    ]
    [ # danish
      "___"     "___"     "___"     "___"     "___"     "___"     "___"     "___"     "___"     "___"     "___"     "___"     "___"     "___"     "___"

      "___" "___" "___" "___" "___" "___"                     "___" "___" "___" "___" "___" "___" "___" "KC_BSPC"
      "___" "___" "___" "DK_AE"   "___" "___"                     "___" "___" "___" "DK_OE"   "___" "___" "___" "KC_BSLS" "___"
      "___" "DK_AA"   "___" "___" "___" "___" "___"           "___" "___" "___" "___" "___" "___" "KC_ENT"            "___"
      "___" "___" "___" "___" "___" "___" "___"           "___" "___" "___" "___" "___" "KC_RSFT"           "___"
      "___" "___" "___"           "KC_SPC"            "KC_LCTL" "KC_RSFT" "___"           "___"           "___" "___" "___" "___" "___"
    ]
  ];
}

# Local Variables:
# apheleia-inhibit: 't
# End:
