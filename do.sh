#!/usr/bin/env bash

set -eEuo pipefail

MODEL=xbows/knight
DIR="keyboards/$MODEL/keymaps/peterhoeg"
FILE="xbows_peterhoeg"
NIX="$DIR/$FILE.nix"
JSON="$DIR/$FILE.json"

echo "Building ${MODEL}"

nix eval --json --file "$NIX" | jq --sort-keys > "$JSON"

qmk json2c "$JSON" > "$DIR"/keymap.c

qmk userspace-compile

make "$MODEL":peterhoeg:flash
