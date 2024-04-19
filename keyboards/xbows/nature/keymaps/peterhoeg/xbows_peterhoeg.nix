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
    [
      "KC_ESC"  "KC_F1"   "KC_F2"   "KC_F3"   "KC_F4"   "KC_F5"   "KC_F6"   "KC_F7"   "KC_F8"   "KC_F9"   "KC_F10"  "KC_F11"  "KC_F12"  "KC_DEL"  "KC_PSCR"

      "KC_GRV"  "KC_1"    "KC_2"    "KC_3"    "KC_4"    "KC_5"                        "KC_6"    "KC_7"    "KC_8"    "KC_9"    "KC_0"    "KC_MINS" "KC_EQL"  "KC_CALC"
      "KC_TAB"  "KC_Q"    "KC_W"    "KC_E"    "KC_R"    "KC_T"                        "KC_Y"    "KC_U"    "KC_I"    "KC_O"    "KC_P"    "KC_LBRC" "KC_RBRC" "KC_ENT"  "KC_PGUP"
      "C_2TAB"  "C_GUIA"  "C_ALTS"  "C_SFTD"  "C_CTLF"  "KC_G"    "KC_BSPC"           "KC_H"    "C_CTLJ"  "C_SFTK"  "C_ALTL"  "C_GUIsc" "KC_QUOT" "KC_BSLS"           "KC_PGDN"
      "KC_LSFT" "KC_Z"    "KC_X"    "KC_C"    "C_2V"    "KC_B"    "KC_ENT"            "KC_N"    "KC_M"    "KC_COMM" "KC_DOT"  "KC_SLSH" "KC_RSFT"           "KC_UP"
      "KC_LCTL" "KC_LGUI" "KC_LALT"           "C_CTLes"           "KC_LGUI" "SC_RSPC" "KC_SPC"            "KC_RALT"           "TG(1)"   "KC_RCTL" "KC_LEFT" "KC_DOWN" "KC_RGHT"
    ]
    [
      "KC_TRNS" "KC_TRNS" "KC_TRNS" "KC_TRNS" "KC_TRNS" "KC_TRNS" "KC_TRNS" "KC_TRNS" "KC_TRNS" "KC_TRNS" "KC_TRNS" "KC_TRNS" "KC_TRNS" "KC_TRNS" "KC_TRNS"

      "KC_TRNS" "KC_TRNS" "KC_TRNS" "KC_TRNS" "KC_TRNS" "KC_TRNS"                     "KC_TRNS" "KC_TRNS" "KC_TRNS" "KC_TRNS" "KC_TRNS" "KC_TRNS" "KC_TRNS" "KC_BSPC"
      "KC_TRNS" "KC_TRNS" "KC_TRNS" "KC_TRNS" "KC_TRNS" "KC_TRNS"                     "KC_TRNS" "KC_TRNS" "KC_TRNS" "KC_TRNS" "KC_TRNS" "KC_TRNS" "KC_TRNS" "KC_BSLS" "KC_TRNS"
      "KC_LCTL" "KC_TRNS" "KC_TRNS" "KC_TRNS" "KC_F"    "KC_TRNS" "KC_TRNS"           "KC_TRNS" "KC_TRNS" "KC_TRNS" "KC_TRNS" "KC_TRNS" "KC_TRNS" "KC_ENT"            "KC_TRNS"
      "KC_LSFT" "KC_TRNS" "KC_TRNS" "KC_TRNS" "KC_TRNS" "KC_TRNS" "KC_TRNS"           "KC_TRNS" "KC_TRNS" "KC_TRNS" "KC_TRNS" "KC_TRNS" "KC_RSFT"           "KC_TRNS"
      "KC_CAPS" "KC_TRNS" "KC_TRNS"           "KC_SPC"            "KC_LCTL" "KC_RSFT" "KC_TRNS"           "KC_TRNS"           "KC_TRNS" "KC_TRNS" "KC_TRNS" "KC_TRNS" "KC_TRNS"
    ]
    [
      "QK_BOOT" "KC_TRNS" "KC_TRNS" "KC_TRNS" "KC_TRNS"    "KC_TRNS" "KC_TRNS" "KC_TRNS" "KC_TRNS" "KC_TRNS" "KC_TRNS" "KC_TRNS" "KC_TRNS" "NK_TOGG"           "EE_CLR"
      "KC_TRNS" "KC_TRNS" "KC_TRNS" "KC_TRNS" "KC_TRNS"    "KC_TRNS"                     "KC_NUM"  "KC_PSCR" "KC_INS"  "KC_DEL"  "KC_TRNS" "KC_TRNS" "KC_TRNS" "KC_MUTE"
      "RGB_TOG" "RGB_SPI" "RGB_VAI" "RGB_HUI" "RGB_MOD"    "KC_TRNS"                     "KC_TRNS" "KC_HOME" "KC_UP"   "KC_PGUP" "KC_TRNS" "KC_TRNS" "KC_TRNS" "KC_TRNS" "KC_TRNS"
      "KC_TRNS" "RGB_SPD" "RGB_VAD" "RGB_HUD" "KC_TRNS"    "KC_TRNS" "KC_TRNS"           "KC_TRNS" "KC_LEFT" "KC_DOWN" "KC_RGHT" "KC_TRNS" "KC_TRNS" "KC_TRNS"           "KC_TRNS"
      "KC_TRNS" "KC_TRNS" "KC_TRNS" "KC_TRNS" "KC_TRNS"    "KC_TRNS" "KC_TRNS"           "KC_TRNS" "KC_END"  "KC_TRNS" "KC_PGDN" "KC_TRNS" "KC_MUTE" "KC_VOLU"
      "KC_TRNS" "KC_TRNS" "KC_TRNS" "KC_TRNS"              "KC_TRNS" "KC_TRNS" "KC_TRNS"           "KC_TRNS"           "TG(0)"   "KC_MPLY" "KC_MPRV" "KC_VOLD" "KC_MNXT"
    ]
    [
      "KC_TAB"  "KC_NO"   "KC_NO"   "KC_NO"   "KC_NO"      "KC_NO"   "KC_NO"   "KC_NO"   "KC_NO"   "KC_NO"   "KC_NO"   "KC_NO"   "KC_NO"   "KC_NO"             "KC_NO"
      "KC_TAB"  "KC_NO"   "KC_NO"   "KC_NO"   "KC_NO"      "KC_NO"                       "KC_PSLS" "KC_P7"   "KC_P8"   "KC_P9"   "KC_PPLS" "KC_NO"   "KC_NO"   "KC_NO"
      "KC_TAB"  "KC_NO"   "KC_NO"   "KC_NO"   "KC_NO"      "KC_NO"                       "KC_PAST" "KC_P4"   "KC_P5"   "KC_P6"   "KC_PCMM" "KC_NO"   "KC_NO"   "KC_NO"   "KC_NO"
      "KC_TAB"  "KC_NO"   "KC_NO"   "KC_NO"   "KC_NO"      "KC_NO"   "KC_NO"             "KC_PMNS" "KC_P1"   "KC_P2"   "KC_P3"   "KC_PEQL" "KC_NO"   "KC_NO"             "KC_NO"
      "KC_TAB"  "KC_NO"   "KC_NO"   "KC_NO"   "KC_NO"      "KC_NO"   "KC_NO"             "KC_NO"   "KC_P0"   "KC_NO"   "KC_PDOT" "KC_PENT" "KC_NO"   "KC_NO"
      "KC_TAB"  "KC_NO"   "KC_NO"   "KC_NO"                "KC_NO"   "KC_NO"   "KC_NO"             "KC_NO"             "KC_TRNS" "KC_NO"   "KC_NO"   "KC_NO"   "KC_NO"
    ]
  ];
}

# Local Variables:
# apheleia-inhibit: 't
# End:
