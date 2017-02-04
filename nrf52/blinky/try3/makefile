# Project name
PROJECT_NAME = blinky

DEVICE = NRF52
TARGET := NRF52

# relative location of the toolchain binary
TOOLCHAIN = ../toolchain/arm_cm4/bin/arm-none-eabi-

# arm-none-eabi-gcc executable
CC   = $(TOOLCHAIN)gcc

# arm-none-eabi-objcopy executable          
OBJCOPY   = $(TOOLCHAIN)objcopy   

# arm-none-eabi-objdump executable
OBJDUMP = $(TOOLCHAIN)objdump     

# suppress output
QUIET=@

# include directory
INCLUDES = include/   
INCLUDES += cfg/
# include directories from SDK
include ../sdk/sdk.mk

# startup folder directory     
STARTUP_DIR = ../startup

# Sources
# linker script directory
LDSCRIPT = ../linker_script/nrf52_ld_script.ld  

# source files
SOURCES = src/main.c 
SOURCES += $(SDK_DIRECTORY)/toolchain/system_nrf52.c
SOURCES += $(SDK_DIRECTORY)/toolchain/gcc/gcc_startup_nrf52.s

# Drivers
USE_DRV_NOSD := y

# add option "-I" before each included folders                    
INCLUDE_DIR  = $(patsubst %,-I%,$(INCLUDES))    

CPFLAGS = -mcpu=cortex-m4 -Os -gdwarf-2 -mthumb -fomit-frame-pointer -Wall -Wstrict-prototypes -fverbose-asm -Wa,-ahlms=$(<:.c=.lst) $(DEFS)
LDFLAGS = -mcpu=cortex-m4 -lc -mthumb -nostartfiles -T$(LDSCRIPT) -Wl,-Map=$(PROJECT_NAME).map,--cref,--no-warn-mismatch $(LIBDIR)

# Define target processor
TARGET 	:= 	NRF52
INCLUDE_DIR += -D$(TARGET) 

# Generate dependency information
CFLAGS += -MD -MP -MF .dep\$(@F).d
 
# Rules
 
all: 
	@echo "Program : $(PROJECT_NAME)"
	@echo "Compiling  $(SOURCES)"
	$(QUIET)$(CC) $(INCLUDE_DIR) $(SOURCES) -o $(PROJECT_NAME).elf
	@echo "Creating  $(PROJECT_NAME).hex"
	$(QUIET)$(OBJCOPY) -Oihex $(PROJECT_NAME).elf   $(PROJECT_NAME).hex
	@echo "Creating  $(PROG_NAME).bin"
	$(QUIET)$(OBJCOPY) -Obinary $(PROJECT_NAME).elf $(PROJECT_NAME).bin
	@echo "Done"

clean:
	@rm -f  $(PROG_NAME).elf  $(PROG_NAME).o $(PROG_NAME).hex $(PROG_NAME).bin
	@rm -f system_nrf52.o
	@rm -f gcc_startup_nrf52.o
