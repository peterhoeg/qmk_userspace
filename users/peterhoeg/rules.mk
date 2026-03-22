LTO_ENABLE = yes

# things we can do to save space
AUDIO_ENABLE = no
COMMAND_ENABLE = no # for showing version but needs CONSOLE_ENABLE, but we have it on CAPS-V
CONSOLE_ENABLE = no # image too big for the xbows keyboards
DYNAMIC_TAPPING_TERM_ENABLE = no # per-key tapping term via get_tapping_term() is sufficient
GRAVE_ESC_ENABLE = no # QK_GESC not used in any layer
MIDI_ENABLE = no
MOUSEKEY_ENABLE = no # gimmicky
MUSIC_ENABLE = no
RGB_MATRIX_ENABLE = no # overrides keyboard default - LEDs not used, saves ~8%
RGBLIGHT_ENABLE = no
TAP_DANCE_ENABLE = no # need to implement the handler function for this to work
UNICODE_ENABLE = no

AVR_USE_MINIMAL_PRINTF = yes # technically not needed as I don't use (s)printf
BOOTMAGIC_ENABLE = yes # needed for flashing without physical reset button
CAPS_WORD_ENABLE = yes
COMBO_ENABLE = yes
EXTRAKEY_ENABLE = yes # needed for the volume keys
NKRO_ENABLE = yes
UNICODE_COMMON = yes
UNICODE_MAP_ENABLE = yes
