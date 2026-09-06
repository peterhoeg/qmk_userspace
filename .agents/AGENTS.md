# AGENTS.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

QMK userspace repository for personal keyboard firmware (X-Bows Knight, X-Bows Nature v3 and ZSA Moonlander). Keymaps are defined declaratively in Nix, then converted to C via a JSON intermediate format.

`README.org` carries the detail on code organisation and the Moonlander layout decisions. Read it before touching a keymap, and keep it current when that organisation changes.

## Build Pipeline

Driven by `config.mk`, which tracks timestamps so nothing regenerates unless its `.nix` source is newer:

1. `<maker>_peterhoeg.nix` and `info.nix` are the sources of truth
2. `nix eval --json` piped through `jq` produces `<maker>_peterhoeg.json` and `info.json`
3. `scripts/generate-keymap` (nushell) orders the layers `_BASE` first, runs `qmk json2c`, then `qmkfmt`
4. Out come `keymap_generated.c` and `layers.h` - both generated, edit the `.nix` source instead
5. QMK's build system compiles the final `.hex`/`.bin`

The generated keymap JSON is gitignored per keymap dir; `info.json`, the generated C and the header are committed.

## Common Commands

All commands use `just` (see `justfile`):

```sh
just list            # Show all targets
just dwim            # Configure, build and flash the attached keyboard (default target)
just config          # Generate C keymaps from Nix sources
just build           # Build firmware for the attached keyboard
just flash           # Build and flash firmware
just knight          # Build+flash X-Bows Knight    (alias: just dolores)
just nature          # Build+flash X-Bows Nature v3 (alias: just mildred)
just moonlander      # Build+flash ZSA Moonlander
just dev             # Generate config + compile_commands.json for LSP
```

Each keyboard target takes an optional argument, so `just moonlander build` configures and builds without flashing.

The keyboard is detected by USB VID:PID via `lsusb`, and `just` errors out when none of the three is attached. The maker is paired to the model: `moonlander` implies `zsa`, everything else `xbows`.

`Makefile` forwards any other target into `qmk_firmware`, taking its location from `qmk config user.qmk_home` and falling back to the bundled submodule.

## Dev Environment

Nix flake via direnv (`.envrc`). Entering the directory loads `devShells.default`, which provides `beadwork`, `clang`, `jq`, `just`, `nushell`, `podman`, `qmk`, `qmkfmt` and `usbutils`.

Everything there is nixpkgs except `qmkfmt`, which comes from the `localpkgs` input (`gitlab:peterhoeg/pkgs`). Take it from that flake's `legacyPackages`, never its `packages`: the latter filters over the whole set and so forces every package in it, and some of those need SSH access to a private repo.

The `full` shell (`nix develop .#full --impure`) is currently broken: `shell.nix` imports `./util/nix/sources.nix`, and `util/` does not exist in the worktree or anywhere in this repo's history.

## Key Paths

- `users/peterhoeg/` - shared across all keyboards: `config.h` (tap-hold settings, keycode aliases), `peterhoeg.c`/`.h`, `keymap_dk.c` (Danish unicode map), `combos.inc`, `rules.mk` (QMK feature flags)
  - `peterhoeg.c` is compiled via `SRC` in `rules.mk`, but `combos.inc` is textually included from each `keymap.c`, because QMK's combo introspection needs `key_combos[]` in the keymap translation unit
  - keymaps override shared behaviour through the weak `*_keymap()` hooks declared in `peterhoeg.h`
- `keyboards/<maker>/<model>/keymaps/peterhoeg/` - per keyboard
  - `<maker>_peterhoeg.nix` - the keymap; edit this, never the generated C
  - `info.nix` - keyboard metadata, source for `info.json`
  - `keymap.c` - `chordal_hold_layout` plus the includes for shared and generated code
  - `keymap_generated.c`, `layers.h` - generated, do not edit
- `keyboards/xbows/knight/keymaps/peterhoeg` is a **symlink** to nature's directory, since both share the same 86-key `LAYOUT()`. Editing one edits both, and the shared `.nix` hardcodes `keyboard = "xbows/knight"`.
- `scripts/generate-keymap` - the nushell generator
- `qmk.json` - userspace build targets, consumed by CI
- `qmk_firmware/` - git submodule pointing at upstream QMK

## Layers

Six layers, the same set on every keyboard: `_BASE`, `_ARROWS`, `_DANISH`, `_MOUSE`, `_NUMBERS`, `_WINDOWS`. `_BASE` has to stay index 0 and the rest sort alphabetically, which is what `scripts/generate-keymap` enforces when it writes `layers.h`.

## CI

`.github/workflows/build_binaries.yaml` calls QMK's reusable `qmk_userspace_build.yml` on every push, building the targets listed in `qmk.json` against `qmk/qmk_firmware@master`.

## Formatting

C code: `.clang-format` (LLVM style, 2-space indent, 140 char line limit). `.editorconfig` sets a 4-space default for everything else, and tabs in `Makefile`/`*.mk`.

`scripts/generate-keymap` finishes by running `qmkfmt` (rcorre/qmkfmt) over the generated C: it lays out the keymap grids itself, then shells out to a store-pinned `clang-format` for the rest. Reformat those files with `qmkfmt <file>`, never by hand or with `clang-format` alone.

## Work Management

This project tracks work with `bw` (beadwork), which persists to git - plans, progress, and decisions survive compaction, session boundaries, and context loss.

ALWAYS run `bw prime` before starting work. Without it, you're missing workflow context, current state, and repo hygiene warnings. Work done without priming often conflicts with in-progress changes.

Committing, closing issues, and syncing are part of completing a task - not separate actions requiring additional permission.
