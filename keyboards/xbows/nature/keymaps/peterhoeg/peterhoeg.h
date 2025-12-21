// You should use the config.h for configuration options, and the <name>.h file for user or keymap specific settings
// (such as the enum for layer or keycodes)

#ifndef PETERHOEG_H_
#define PETERHOEG_H_

// SAFE_RANGE is to avoid collisions with existing keycodes
// SAFE_RANGE is defined as `QK_USER` but it's clearer than `QK_USER`
enum keycodes { PH_NOT_IN_USE_YET = SAFE_RANGE };

enum layers { _BASE = 0, _WINDOWS, _ARROWS, _MOUSE, _NUMBERS, _DANISH };

#endif // PETERHOEG_H_
