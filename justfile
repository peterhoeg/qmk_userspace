MAKER := "xbows"
LAYOUT := "peterhoeg"
MODEL := if `hostname` == "dolores" { "knight" } else { "nature" }

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

    keymap={{ maker }}_{{ layout }}

    # Extract layer names: _BASE first (default layer), then the rest alphabetically
    mapfile -t layer_names < <(jq -r '.layers | keys[] | select(. == "_BASE")' $keymap.json; jq -r '.layers | keys[] | select(. != "_BASE")' $keymap.json)

    # Convert layers attrset to ordered array for qmk json2c (_BASE first)
    tmp=$(mktemp --suffix=.json)
    trap "rm -f $tmp" EXIT
    jq -S --argjson order "$(printf '%s\n' "${layer_names[@]}" | jq -R . | jq -s .)" \
      '.layers = [$order[] as $k | .layers[$k]]' $keymap.json > "$tmp"

    qmk json2c "$tmp" | sed 1d > keymap_generated.c
    qmkfmt keymap_generated.c

    # Replace numeric layer indices with enum names
    for i in "${!layer_names[@]}"; do
      sed -i "s/\[$i\] = LAYOUT/[${layer_names[$i]}] = LAYOUT/" keymap_generated.c
    done

    # Generate layer enum header from Nix source
    {
      echo "#pragma once"
      echo ""
      printf "enum layers { %s = 0" "${layer_names[0]}"
      for name in "${layer_names[@]:1}"; do
        printf ", %s" "$name"
      done
      echo " };"
    } > layers.h

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

alias dolores := knight

# X-Bows Knight
@knight target="flash": (_do MAKER "knight" target)

alias mildred := nature

# X-Bows Nature v3
@nature target="flash": (_do MAKER "nature" target)

# Development
@dev: (config MAKER MODEL LAYOUT) (lsp MAKER MODEL LAYOUT)

# DWIM
[default]
dwim target="flash": (_do MAKER MODEL target)
