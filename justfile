MAKER := "xbows"
LAYOUT := "peterhoeg"
MODEL := if `hostname` == "dolores" { "knight" } else { "nature" }

[private]
default: list

# Show the available targets
list:
    @just -l --justfile {{ justfile() }} --list-submodules

# Build compile_commands.json for LSP
[private]
lsp maker=MAKER model=MODEL layout=LAYOUT:
    @qmk compile --compiledb -kb {{ maker }}/{{ model }} -km {{ layout }}

# Prepare keymap
config maker=MAKER model=MODEL layout=LAYOUT:
    #!/usr/bin/env bash

    set -eEuo pipefail

    DIR="keyboards/{{ maker }}/{{ model }}/keymaps/{{ layout }}"

    echo "Generating config for {{ maker }}/{{ model }}:{{ layout }}"

    nix2json() {
      nix eval --json --file $1.nix | jq --sort-keys > $1.json
    }

    pushd $DIR >/dev/null
    for f in info {{ maker }}_{{ layout }}; do
      nix2json "$f"
    done
    qmk json2c {{ maker }}_{{ layout }}.json | sed 1d > keymap_generated.c
    qmkfmt keymap_generated.c
    popd >/dev/null

[private]
_make maker model layout sub:
    make {{ maker }}/{{ model }}:{{ layout }}:{{ sub }}

# Build the chosen `model`
@build maker=MAKER model=MODEL layout=LAYOUT: (_make maker model layout "build")

# Flash the chosen `model`
@flash maker=MAKER model=MODEL layout=LAYOUT: (_make maker model layout "flash")

[private]
@_do maker model target: (config maker model LAYOUT) (_make maker model LAYOUT target)

# X-Bows Knight
@knight target="flash": (_do MAKER "knight" target)

# X-Bows Nature v3
@nature target="flash": (_do MAKER "nature" target)

# Development
@dev: (config MAKER MODEL LAYOUT) (lsp MAKER MODEL LAYOUT)
