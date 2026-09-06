.SILENT:

MAKEFLAGS += --no-print-directory

QMK_USERSPACE := $(patsubst %/,%,$(dir $(shell realpath "$(lastword $(MAKEFILE_LIST))")))
ifeq ($(QMK_USERSPACE),)
    QMK_USERSPACE := $(shell pwd)
endif

QMK_FIRMWARE_ROOT := $(shell qmk config -ro user.qmk_home | cut -d= -f2 | sed -e 's@^None$$@@g')

# fall back to the bundled submodule
ifeq ($(QMK_FIRMWARE_ROOT),)
    ifneq ($(wildcard $(QMK_USERSPACE)/qmk_firmware/Makefile),)
        QMK_FIRMWARE_ROOT := $(QMK_USERSPACE)/qmk_firmware
    endif
endif

ifeq ($(QMK_FIRMWARE_ROOT),)
    $(error Cannot determine qmk_firmware location. Set `qmk config user.qmk_home` or run `git submodule update --init qmk_firmware`)
endif

%:
	+$(MAKE) -C $(QMK_FIRMWARE_ROOT) $(MAKECMDGOALS) QMK_USERSPACE=$(QMK_USERSPACE)
