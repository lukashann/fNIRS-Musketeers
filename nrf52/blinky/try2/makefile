DEVICE = NRF52

include ../sdk/sdk.mk

# main.c directory
SRC  = src/main.c 

GNU_PREFIX ?= ../toolchain/arm_cm4/bin/arm-none-eabi
CC       		:= "$(GNU_PREFIX)-gcc"
OBJDUMP  		:= "$(GNU_PREFIX)-objdump"
OBJCOPY  		:= "$(GNU_PREFIX)-objcopy"

QUIET=@


PROG_NAME ?= blinky


# CPU related flags
CFLAGS +=  -mcpu=cortex-m4 -mthumb -mabi=aapcs -mfpu=fpv4-sp-d16 -mfloat-abi=hard

LINKER_SCRIPT = ../linker_script/nrf52_ld_script.ld  


ifeq ($(DEBUG),yes)
CFLAGS += -O -ggdb
else
CFLAGS += -O3
endif


DEVICE_LC = nrf52


# General C compiler flags
CFLAGS += -ffunction-sections -fdata-sections -fno-strict-aliasing -fno-builtin --short-enums
CFLAGS += -std=gnu99   -Wall -D$(DEVICE)

# Linker flags (passed to gcc)
CFLAGS += -T $(LINKER_SCRIPT)
CFLAGS += -L $(SDK_DIRECTORY)/toolchain/gcc

# Include search path (already covered in sdk.mk but whatever) 
CFLAGS += -I$(SDK_DIRECTORY)/device
CFLAGS += -I$(SDK_DIRECTORY)/toolchain
CFLAGS += -I$(SDK_DIRECTORY)/toolchain/gcc
CFLAGS += -Iinclude

SOURCES += $(SDK_DIRECTORY)/toolchain/system_nrf52.c
SOURCES += $(SDK_DIRECTORY)/toolchain/gcc/gcc_startup_nrf52.s
SOURCES += src/main.c


all:
	@echo "Program : $(PROG_NAME)"
	@echo "Compiling  $(SOURCES)"
	$(QUIET)$(CC) $(CFLAGS) $(SOURCES) -o $(PROG_NAME).elf
	@echo "Creating  $(PROG_NAME).hex"
	$(QUIET)$(OBJCOPY) -Oihex $(PROG_NAME).elf   $(PROG_NAME).hex
	@echo "Creating  $(PROG_NAME).bin"
	$(QUIET)$(OBJCOPY) -Obinary $(PROG_NAME).elf $(PROG_NAME).bin
	@echo "Done"

flash:
	@echo Flashing: $(PROG_NAME).hex
	nrfjprog -f NRF52 --program $(PROG_NAME).hex --chiperase --verify
	nrfjprog -f NRF52 --reset

debug:
	make -C . DEBUG=yes

clean:
	@rm -f  $(PROG_NAME).elf  $(PROG_NAME).o $(PROG_NAME).hex $(PROG_NAME).bin
	@rm -f system_$(DEVICE_LC).o
	@rm -f gcc_startup_$(DEVICE_LC).o

check_setup:
	@echo "xDK_TOP   = " $(xDK_TOP)
	@echo "SOURCES   = " $(SOURCES)
	@echo "PROG_NAME = " $(PROG_NAME)


