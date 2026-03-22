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
    #!/usr/bin/env nu

    let dir = $"keyboards/{{ maker }}/{{ model }}/keymaps/{{ layout }}"

    print $"Generating config for {{ maker }}/{{ model }}:{{ layout }}"

    # Convert .nix files to .json via nix eval
    # Round-trip through from/to json to pretty-print the compact output from nix eval
    for f in [info, "{{ maker }}_{{ layout }}"] {
      let path = $"($dir)/($f)"
      nix eval --json --file $"($path).nix" | from json | to json | save -f $"($path).json"
    }

    let keymap = $"($dir)/{{ maker }}_{{ layout }}"

    # Extract layer names: _BASE first (default layer), then the rest alphabetically
    let all_keys = open $"($keymap).json" | get layers | columns
    let layer_names = ($all_keys | where $it == "_BASE") | append ($all_keys | where $it != "_BASE")

    # Convert layers attrset to ordered array for qmk json2c (_BASE first)
    let tmp = mktemp --suffix .json
    let data = open $"($keymap).json"
    let layers = $layer_names | each {|name| $data.layers | get $name }
    $data | upsert layers $layers | to json | save -f $tmp

    qmk json2c $tmp | lines | skip 1 | str join "\n" | save -f $"($dir)/keymap_generated.c"
    rm $tmp
    qmkfmt $"($dir)/keymap_generated.c"

    # Replace numeric layer indices with enum names
    mut content = open $"($dir)/keymap_generated.c"
    for entry in ($layer_names | enumerate) {
      $content = ($content | str replace -a $"[($entry.index)] = LAYOUT" $"[($entry.item)] = LAYOUT")
    }
    $content | save -f $"($dir)/keymap_generated.c"

    # Generate layer enum header from Nix source
    let first = $layer_names | first
    let rest = $layer_names | skip 1 | str join ", "
    let enum_body = if ($rest | is-empty) { $"($first) = 0" } else { $"($first) = 0, ($rest)" }
    $"#pragma once\n\nenum layers { ($enum_body) };\n" | save -f $"($dir)/layers.h"

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
