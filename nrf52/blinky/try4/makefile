# Project name
PROJECT_NAME = blinky

DEVICE = NRF52
DEVICE_VARIANT =xxaa
DEVICE_LC = nrf52

# include sdk
include ../sdk/sdk.mk

# sources
SOURCES = src/main.c
SOURCES += $(SDK_DIRECTORY)/toolchain/system_$(DEVICE_LC).c
SOURCES += $(SDK_DIRECTORY)/toolchain/gcc/gcc_startup_$(DEVICE_LC).s

# relative location of the toolchain binary
GNU_PREFIX = ../toolchain/arm_cm4/bin/arm-none-eabi

CC       := "$(GNU_PREFIX)-gcc"
OBJDUMP  := "$(GNU_PREFIX)-objdump"
OBJCOPY  := "$(GNU_PREFIX)-objcopy"

# suppress output
QUIET=@

# CPU related flags
CFLAGS +=  -mcpu=cortex-m4 -mthumb -mabi=aapcs -mfpu=fpv4-sp-d16 -mfloat-abi=hard
LINKER_SCRIPT = $(SDK_DIRECTORY)/toolchain/gcc/nrf52_$(DEVICE_VARIANT).ld

ifeq ($(DEBUG),yes)
CFLAGS += -O -ggdb
else
CFLAGS += -O3
endif

# General C compiler flags
CFLAGS += -ffunction-sections -fdata-sections -fno-strict-aliasing -fno-builtin --short-enums
CFLAGS += -std=gnu99   -Wall -D$(DEVICE)

# Linker flags (passed to gcc)
CFLAGS += -T $(LINKER_SCRIPT)
CFLAGS += -L $(SDK_DIRECTORY)toolchain/gcc

# Include search path
CFLAGS += -Iinclude
CFLAGS += -I$(SDK_DIRECTORY)/device
CFLAGS += -I$(SDK_DIRECTORY)/toolchain
CFLAGS += -I$(SDK_DIRECTORY)/toolchain/gcc
CFLAGS += -I$(SDK_DIRECTORY)/toolchain/cmsis/include
CFLAGS += -I$(SDK_DIRECTORY)/libraries/log
CFLAGS += -I$(SDK_DIRECTORY)/libraries/log/src

all:
	@echo "Program : $(PROJECT_NAME)"
	@echo "Compiling  $(SOURCES)"
	$(QUIET)$(CC) $(CFLAGS) $(SOURCES) -o $(PROJECT_NAME).elf
	@echo "Creating  $(PROJECT_NAME).hex"
	$(QUIET)$(OBJCOPY) -Oihex $(PROJECT_NAME).elf   $(PROJECT_NAME).hex
	@echo "Creating  $(PROG_NAME).bin"
	$(QUIET)$(OBJCOPY) -Obinary $(PROJECT_NAME).elf $(PROJECT_NAME).bin
	@echo "Done"

flash:
	@echo Flashing: $(PROJECT_NAME).hex
	nrfjprog -f NRF52 --program $(PROJECT_NAME).hex --chiperase --verify
	nrfjprog -f NRF52 --reset

debug:
	make -C . DEBUG=yes

clean:
	@rm -f  $(PROJECT_NAME).elf  $(PROJECT_NAME).o $(PROJECT_NAME).hex $(PROJECT_NAME).bin
	@rm -f system_$(DEVICE_LC).o
	@rm -f gcc_startup_$(DEVICE_LC).o

check_setup:
	@echo “SDK_TOP   = " $(SDK_TOP)
	@echo "SOURCES   = " $(SOURCES)
	@echo "PROJECT_NAME = " $(PROJECT_NAME)