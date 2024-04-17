MODEL := "knight"
LAYOUT := "peterhoeg"

default: list

# Show the available targets
list:
    @just -l --justfile {{justfile()}}

# Prepare keymap
config model layout:
    #!/usr/bin/env bash
    DIR="keyboards/xbows/{{model}}/keymaps/{{layout}}"
    FILE="xbows_{{layout}}"

    pushd $DIR >/dev/null
    nix eval --json --file $FILE.nix | jq --sort-keys > $FILE.json
    qmk json2c $FILE.json > keymap.c
    popd >/dev/null

# Flash the chosen `model`
flash model layout:
    make xbows/{{model}}:{{layout}}:flash

_do model: (config model LAYOUT) (flash model LAYOUT)

# X-Bows Knight
@knight: (_do "knight")

# X-Bows Nature v3
@nature: (_do "nature")
