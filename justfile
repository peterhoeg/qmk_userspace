MODEL := "knight"
LAYOUT := "peterhoeg"

default: list

# Show the available targets
list:
    @just -l --justfile {{justfile()}}

# Build compile_commands.json for LSP
lsp model=MODEL layout=LAYOUT:
    @qmk generate-compilation-database -kb xbows/{{model}} -km {{layout}}

# Prepare keymap
config model=MODEL layout=LAYOUT:
    #!/usr/bin/env bash

    set -eEuo pipefail

    DIR="keyboards/xbows/{{model}}/keymaps/{{layout}}"

    echo "Generating config for xbows/{{model}}:{{layout}}"

    nix2json() {
      nix eval --json --file $1.nix | jq --sort-keys > $1.json
    }

    pushd $DIR >/dev/null
    nix2json info
    nix2json xbows_{{layout}}
    qmk json2c xbows_{{layout}}.json | sed 1d > keymap_generated.c
    popd >/dev/null

# Flash the chosen `model`
flash model layout:
    make xbows/{{model}}:{{layout}}:flash

_do model: (lsp model LAYOUT) (config model LAYOUT) (flash model LAYOUT)

# X-Bows Knight
@knight: (_do "knight")

# X-Bows Nature v3
@nature: (_do "nature")
