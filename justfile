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

# Prepare keymap (only regenerates files whose .nix sources have changed)
config maker=MAKER model=MODEL layout=LAYOUT:
    @make -f config.mk KEYMAP_DIR=keyboards/{{ maker }}/{{ model }}/keymaps/{{ layout }} MAKER={{ maker }} LAYOUT={{ layout }} config

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

# ZSA Moonlander
@moonlander target="flash": (_do "zsa" "moonlander" target)

# Development
@dev: (config MAKER MODEL LAYOUT) (lsp MAKER MODEL LAYOUT)

# DWIM
[default]
dwim target="flash": (_do MAKER MODEL target)
