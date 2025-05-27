MAKER := "xbows"
MODEL := "knight"
LAYOUT := "peterhoeg"

[private]
default: list

# Show the available targets
list:
    @just -l --justfile {{justfile()}}

# Build compile_commands.json for LSP
[private]
lsp model=MODEL layout=LAYOUT:
    @qmk compile --compiledb -kb {{MAKER}}/{{model}} -km {{layout}}

# Prepare keymap
config model=MODEL layout=LAYOUT:
    #!/usr/bin/env bash

    set -eEuo pipefail

    DIR="keyboards/{{MAKER}}/{{model}}/keymaps/{{layout}}"

    echo "Generating config for {{MAKER}}/{{model}}:{{layout}}"

    nix2json() {
      nix eval --json --file $1.nix | jq --sort-keys > $1.json
    }

    pushd $DIR >/dev/null
    nix2json info
    nix2json {{MAKER}}_{{layout}}
    qmk json2c {{MAKER}}_{{layout}}.json | sed 1d > keymap_generated.c
    qmkfmt keymap_generated.c
    popd >/dev/null

# Build the chosen `model`
[private]
build model layout:
    make {{MAKER}}/{{model}}:{{layout}}:build

# Flash the chosen `model`
[private]
flash model layout:
    make {{MAKER}}/{{model}}:{{layout}}:flash

[private]
_do model: (lsp model LAYOUT) (config model LAYOUT) (flash model LAYOUT)

# X-Bows Knight
@knight: (_do "knight")

# X-Bows Nature v3
@nature: (_do "nature")
