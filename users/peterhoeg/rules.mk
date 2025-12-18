LTO_ENABLE = yes

# things we can do to save space
AUDIO_ENABLE = no
AVR_USE_MINIMAL_PRINTF = yes # technically not needed as I don't use (s)printf
COMMAND_ENABLE = no
CONSOLE_ENABLE = no
# EXTRAKEY_ENABLE = no # cannot do this as I need the volume keys
MIDI_ENABLE = no
MUSIC_ENABLE = no
RGBLIGHT_ENABLE = no

CAPS_WORD_ENABLE = yes
COMBO_ENABLE = yes
DYNAMIC_TAPPING_TERM_ENABLE = yes
MOUSEKEY_ENABLE = yes
NKRO_ENABLE = no
TAP_DANCE_ENABLE = no # need to implement the handler function for this to work
UNICODE_COMMON = yes
UNICODE_ENABLE = yes
UNICODE_MAP_ENABLE = yes
