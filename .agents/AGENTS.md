# AGENTS.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

QMK userspace repository for personal keyboard firmware (X-Bows Knight, X-Bows Nature v3 and ZSA Moonlander). Keymaps are defined declaratively in Nix, then converted to C via JSON intermediate format.

## Build Pipeline

The Nix-to-C workflow:
1. Keymaps defined in `*_peterhoeg.nix` files (declarative, type-safe)
2. `just config` runs `nix eval --json` to produce JSON, then `scripts/generate-keymap` shells out to `qmk json2c`
3. `keymap_generated.c` and `layers.h` are auto-generated - edit the `.nix` source instead
4. QMK build system compiles final `.hex`/`.bin` firmware

## Common Commands

All commands use `just` (see `justfile`):

```sh
just dwim            # Configure, build and flash for the attached keyboard (default target)
just config          # Generate C keymaps from Nix sources
just build           # Build firmware for the attached keyboard
just flash           # Build and flash firmware
just knight          # Build+flash X-Bows Knight    (alias: just dolores)
just nature          # Build+flash X-Bows Nature v3 (alias: just mildred)
just moonlander      # Build+flash ZSA Moonlander
just dev             # Generate config + compile_commands.json for LSP
```

The keyboard is detected by USB VID:PID via `lsusb`, and `just` errors out when none of the three is attached. The maker is paired to the model: `moonlander` implies `zsa`, everything else `xbows`.

## Dev Environment

Uses Nix Flakes via direnv (`.envrc`). Entering the directory loads the dev shell automatically. The `full` shell (`nix develop .#full --impure`) includes AVR/ARM cross-compilers for native builds.

## Key Paths

- `keyboards/xbows/{knight,nature}/keymaps/peterhoeg/`, `keyboards/zsa/moonlander/keymaps/peterhoeg/` - per-keyboard keymap configs
  - `<maker>_peterhoeg.nix` - primary keymap definition (edit this, not the generated C)
  - `keymap.c` - hand-written C for combos, tapping terms, chordal hold
  - `keymap_generated.c`, `layers.h` - auto-generated from Nix (do not edit directly)
  - `info.nix` - source for the generated `info.json`
  - `config.h` - QMK C preprocessor settings
- `users/peterhoeg/rules.mk` - shared QMK feature flags
- `scripts/generate-keymap` - nushell script driving `qmk json2c` and the layer enum
- `qmk_firmware/` - git submodule pointing to upstream QMK

## Formatting

C code: `.clang-format` (LLVM style, 2-space indent, 140 char line limit). Use `qmkfmt` for generated files.

## Work Management

This project tracks work with `bw` (beadwork), which persists to git - plans, progress, and decisions survive compaction, session boundaries, and context loss.

ALWAYS run `bw prime` before starting work. Without it, you're missing workflow context, current state, and repo hygiene warnings. Work done without priming often conflicts with in-progress changes.

Committing, closing issues, and syncing are part of completing a task - not separate actions requiring additional permission.
