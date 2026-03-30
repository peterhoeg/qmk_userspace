# Config file generation with timestamp-based dependency tracking.
# Avoids regenerating (and thus rebuilding) when nix sources haven't changed.
#
# Requires GNU make >= 4.3 for grouped targets (&:).

.SILENT:

MAKEFLAGS += --no-print-directory

# Passed in from the justfile
KEYMAP_DIR =
MAKER =
LAYOUT =

KEYMAP_JSON := $(KEYMAP_DIR)/$(MAKER)_$(LAYOUT).json
INFO_JSON := $(KEYMAP_DIR)/info.json
KEYMAP_C := $(KEYMAP_DIR)/keymap_generated.c
LAYERS_H := $(KEYMAP_DIR)/layers.h

.PHONY: config
config: $(INFO_JSON) $(KEYMAP_C) $(LAYERS_H)

# .nix -> .json (pretty-printed)
%.json: %.nix
	printf 'Generating %s\n' '$@'
	nix eval --json --file $< | jq . > $@

# keymap_generated.c and layers.h are both produced by generate-keymap
$(KEYMAP_C) $(LAYERS_H) &: $(KEYMAP_JSON)
	printf 'Generating keymap for %s\n' '$(KEYMAP_DIR)'
	scripts/generate-keymap '$(KEYMAP_DIR)' '$(MAKER)' '$(LAYOUT)'
