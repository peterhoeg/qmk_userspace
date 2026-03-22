{
  version = 1;
  author = "Peter Hoeg <peter@hoeg.com>";
  documentation = ''
    Custom configuration for the ZSA Moonlander Mark I
  '';
  notes = ''
    Moonlander has 72 keys (7 cols x 5 rows + 3-key thumb cluster per side).
    No dedicated F-row - F-keys are on the _ARROWS layer.
    Layout mapping from the X-Bows:
      - F-row dropped entirely (available on _ARROWS layer)
      - Inner column keys (index 6, 7 on each row) used for brackets, bksp, enter
      - Thumb cluster: space, gui, esc (left) / alt, ctl, space (right)
      - Big thumb keys (2u): space (left) / enter (right)
  '';
  keyboard = "zsa/moonlander";
  keymap = "zsa_peterhoeg";
  layout = "LAYOUT";
  layers = {
    # Moonlander LAYOUT order per row: 7 left, 7 right
    # Rows 0-2: 7+7 = 14 keys
    # Row 3: 6+6 = 12 keys (no inner column)
    # Row 4: 5+big_thumb + big_thumb+5 = 12 keys
    # Thumb: 3+3 = 6 keys
    # Total: 14+14+14+12+12+6 = 72 keys

    _BASE = [
      # row 0:  ~       1       2       3       4       5       EQL          MINS    6       7       8       9       0       BSPC
      "KC_GRV"  "KC_1"    "KC_2"    "KC_3"    "KC_4"    "KC_5"    "KC_EQL" "KC_MINS" "KC_6"    "KC_7"    "KC_8"    "KC_9"    "KC_0"    "KC_BSPC"

      # row 1:  Tab     Q       W       E       R       T       [            ]       Y       U       I       O       P       Bsls
      "L3_TAB"  "KC_Q"    "KC_W"    "KC_E"    "KC_R"    "KC_T"    "KC_LBRC" "KC_RBRC" "KC_Y"    "KC_U"    "KC_I"    "KC_O"    "KC_P"    "KC_BSLS"

      # row 2:  Esc     A       S       D       F       G       Bksp         Ent     H       J       K       L       ;       '
      "L2_ESC"  "C_GUIA"  "C_ALTS"  "C_SFTD"  "C_CTLF"  "KC_G"    "KC_BSPC" "KC_ENT"  "KC_H"    "C_CTLJ"  "C_SFTK"  "C_ALTL"  "C_GUIsc" "KC_QUOT"

      # row 3:  Sft     Z       X       C       V       B                    N       M       ,       .       /       Sft
      "KC_LSFT" "KC_Z"    "KC_X"    "KC_C"    "L5_V"    "KC_B" "KC_N"    "KC_M"    "KC_COMM" "KC_DOT"  "KC_SLSH" "KC_RSFT"

      # row 4:  Ctl     Gui     Alt     LAPO    CtlEsc  [big]        [big]   Del     RAPC    T_WIN   PgUp    PgDn
      "KC_LCTL" "KC_LGUI" "SC_LAPO" "C_CTLes" "KC_ESC"  "KC_SPC" "KC_ENT"  "KC_DEL"  "SC_RAPC" "_T_WIN"  "KC_PGUP" "KC_PGDN"

      # thumb:  Spc     Gui     Esc                                          Ralt    Rctl    Spc
      "KC_SPC"  "KC_LGUI" "KC_ESC"
      "KC_RALT" "KC_RCTL" "KC_SPC"
    ];

    _WINDOWS = [
      # row 0
      "___"     "___"     "___"     "___"     "___"     "___"     "___" "___"     "___"     "___"     "___"     "___"     "___"     "KC_BSPC"
      # row 1
      "___"     "___"     "___"     "___"     "___"     "___"     "___" "___"     "___"     "___"     "___"     "___"     "___"     "KC_BSLS"
      # row 2
      "KC_LCTL" "KC_A"    "KC_S"    "KC_D"    "KC_F"    "___"     "___" "___"     "___"     "KC_J"    "KC_K"    "KC_L"    "___"     "KC_ENT"
      # row 3
      "___"     "___"     "___"     "___"     "KC_V"    "___" "___"     "___"     "___"     "___"     "___"     "KC_RSFT"
      # row 4
      "KC_CAPS" "___"     "___"     "KC_SPC"  "___"     "KC_LCTL" "KC_RSFT" "___"     "___"     "___"     "___"     "___"
      # thumb
      "___"     "___"     "___"
      "___"     "___"     "___"
    ];

    _ARROWS = [
      # row 0
      "KC_ESC"  "KC_F1"   "KC_F2"   "KC_F3"   "KC_F4"   "KC_F5"   "KC_F11"
      "KC_F12"  "KC_F6"   "KC_F7"   "KC_F8"   "KC_F9"   "KC_F10"  "EE_CLR"
      # row 1
      "___"     "___"     "___"     "___"     "___"     "___"     "NK_TOGG"
      "KC_PSCR" "___"     "KC_HOME" "KC_UP"   "KC_PGUP" "___"     "___"
      # row 2
      "___"     "___"     "___"     "___"     "___"     "___"     "___"
      "___"     "___"     "KC_LEFT" "KC_DOWN" "KC_RGHT" "___"     "___"
      # row 3
      "___"     "___"     "___"     "___"     "___"     "___"
      "___"     "KC_END"  "___"     "KC_PGDN" "___"     "KC_MUTE"
      # row 4
      "___"     "___"     "___"     "C_QMKV"  "___"     "___"
      "___"     "___"     "___"     "_T_BAS"  "KC_VOLU" "KC_MNXT"
      # thumb
      "___"     "___"     "___"
      "KC_MPLY" "KC_VOLD" "KC_MPRV"
    ];

    _MOUSE = [
      # row 0
      "___"     "___"     "___"     "___"     "___"     "___"     "___"
      "___"     "___"     "___"     "___"     "___"     "___"     "___"
      # row 1
      "___"     "___"     "___"     "___"     "___"     "___"     "___"
      "___"     "___"     "MS_BTN1" "MS_UP"   "MS_BTN2" "___"     "___"
      # row 2
      "___"     "___"     "___"     "___"     "___"     "___"     "___"
      "___"     "___"     "MS_LEFT" "MS_DOWN" "MS_RGHT" "___"     "___"
      # row 3
      "___"     "___"     "___"     "___"     "___"     "___"
      "___"     "___"     "___"     "___"     "___"     "___"
      # row 4
      "___"     "___"     "___"     "___"     "___"     "___"
      "___"     "___"     "___"     "___"     "___"     "___"
      # thumb
      "___"     "___"     "___"
      "___"     "___"     "___"
    ];

    _NUMBERS = [
      # row 0
      "KC_TAB"  "_x_"     "_x_"     "_x_"     "_x_"     "_x_"     "_x_"
      "KC_PSLS" "KC_P7"   "KC_P8"   "KC_P9"   "KC_PPLS" "_x_"     "_x_"
      # row 1
      "KC_TAB"  "_x_"     "_x_"     "_x_"     "_x_"     "_x_"     "_x_"
      "KC_PAST" "KC_P4"   "KC_P5"   "KC_P6"   "KC_PCMM" "_x_"     "_x_"
      # row 2
      "KC_TAB"  "_x_"     "_x_"     "_x_"     "_x_"     "_x_"     "_x_"
      "KC_PMNS" "KC_P1"   "KC_P2"   "KC_P3"   "KC_PEQL" "_x_"     "_x_"
      # row 3
      "KC_TAB"  "_x_"     "_x_"     "_x_"     "_x_"     "_x_"
      "_x_"     "KC_P0"   "_x_"     "KC_PDOT" "KC_PENT" "_x_"
      # row 4
      "KC_TAB"  "_x_"     "_x_"     "_x_"     "_x_"     "_x_"
      "_x_"     "_x_"     "_x_"     "___"     "_x_"     "_x_"
      # thumb
      "_x_"     "_x_"     "_x_"
      "_x_"     "_x_"     "_x_"
    ];

    _DANISH = [
      # row 0
      "___"     "___"     "___"     "___"     "___"     "___"     "___"
      "___"     "___"     "___"     "___"     "___"     "___"     "KC_BSPC"
      # row 1
      "___"     "___"     "___"     "DK_AE"   "___"     "___"     "___"
      "___"     "___"     "___"     "___"     "DK_OE"   "___"     "KC_BSLS"
      # row 2
      "___"     "DK_AA"   "___"     "___"     "___"     "___"     "___"
      "___"     "___"     "___"     "___"     "___"     "___"     "KC_ENT"
      # row 3
      "___"     "___"     "___"     "___"     "___"     "___"
      "___"     "___"     "___"     "___"     "___"     "KC_RSFT"
      # row 4
      "___"     "___"     "___"     "KC_SPC"  "___"     "KC_LCTL"
      "KC_RSFT" "___"     "___"     "___"     "___"     "___"
      # thumb
      "___"     "___"     "___"
      "___"     "___"     "___"
    ];
  };
}

# Local Variables:
# apheleia-inhibit: t
# End:
