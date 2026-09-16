LAYOUT := "peterhoeg"
# Detect the attached keyboard by USB VID:PID. Errors out if none of the
# supported keyboards (knight, nature, moonlander) is detected.
MODEL := ```
    out=$(lsusb 2>/dev/null) || true
    if   echo "$out" | grep -qi 5842:4b6e; then echo knight
    elif echo "$out" | grep -qi 5842:4e61; then echo nature
    elif echo "$out" | grep -qi 3297:1969; then echo moonlander
    else echo "no supported keyboard attached (looked for knight, nature, moonlander)" >&2; exit 1
    fi
    ```
# Pair the maker to the detected model.
MAKER := if MODEL == "moonlander" { "zsa" } else { "xbows" }

# Show the available targets
list:
    @just -l --justfile {{ justfile() }} --list-submodules

# Build compile_commands.json for LSP
[private]
_lsp maker=MAKER model=MODEL layout=LAYOUT:
    @qmk compile --compiledb -kb {{ maker }}/{{ model }} -km {{ layout }}

# Prepare keymap (only regenerates files whose .nix sources have changed)
[private]
_config maker=MAKER model=MODEL layout=LAYOUT:
    @make -f config.mk KEYMAP_DIR=keyboards/{{ maker }}/{{ model }}/keymaps/{{ layout }} MAKER={{ maker }} LAYOUT={{ layout }} config

[private]
_make maker model layout sub:
    make {{ maker }}/{{ model }}:{{ layout }}:{{ sub }}

# Build the chosen `model`
[group('direct')]
@build maker=MAKER model=MODEL layout=LAYOUT: (_make maker model layout "build")

# Flash the chosen `model`
[group('direct')]
@flash maker=MAKER model=MODEL layout=LAYOUT: (_make maker model layout "flash")

[private]
@_do maker model target: (_config maker model LAYOUT) (_make maker model LAYOUT target)

alias dolores := knight

# X-Bows Knight
[group('keyboard')]
@knight target="flash": (_do "xbows" "knight" target)

alias mildred := nature

# X-Bows Nature v3
[group('keyboard')]
@nature target="flash": (_do "xbows" "nature" target)

# ZSA Moonlander
[group('keyboard')]
@moonlander target="flash": (_do "zsa" "moonlander" target)

# Development
@dev: (_config MAKER MODEL LAYOUT) (_lsp MAKER MODEL LAYOUT)

# DWIM
[default]
[group('keyboard')]
dwim target="flash": (_do MAKER MODEL target)

# Check out the newest qmk_firmware release tag in the submodule
qmk-update:
    #!/usr/bin/env nu
    cd qmk_firmware
    git fetch --tags --quiet
    # upstream also carries LUFA-*, breakpoint_* and per-board tags, so filter to releases
    let releases = git tag -l --sort=-version:refname | lines | where $it =~ '^[0-9]+\.[0-9]+\.[0-9]+$'
    if ($releases | is-empty) {
      error make { msg: "no release tags in qmk_firmware/ - is the submodule checked out?" }
    }
    let latest = $releases | first
    if (git rev-parse HEAD | str trim) == (git rev-list -n 1 $latest | str trim) {
      print $"qmk_firmware: already at ($latest)"
      exit 0
    }
    let described = git describe --tags --exact-match | complete
    let current = if $described.exit_code == 0 { $described.stdout | str trim } else { git rev-parse --short HEAD | str trim }
    git checkout --quiet $latest
    print $"qmk_firmware: ($current) -> ($latest) - now commit the submodule pointer"
