# relative location of the toolchain binary
TOOLCHAIN = ../toolchain/arm_cm4/bin/arm-none-eabi-

# arm-none-eabi-gcc executable
CC   = $(TOOLCHAIN)gcc

# arm-none-eabi-objcopy executable          
OBJCOPY   = $(TOOLCHAIN)objcopy   

# arm-none-eabi-objdump executable
OBJDUMP = $(TOOLCHAIN)objdump 

# output format is raw binary and we strip the symbol information from source files                      
BIN  = $(OBJCOPY) -O binary -S     

# suppress output
QUIET=@


# Sources
# linker script directory
LDSCRIPT = ../linker_script/nrf52_ld_script.ld
 
# startup folder directory     
STARTUP_DIR = ../startup

# main.c directory
SRC  = src/main.c    
      
# startup.c directory                         
SRC  += $(STARTUP_DIR)/startup.c                      

# include directory
INCLUDES = include/   
INCLUDES += cfg/

# Drivers
USE_DRV_NOSD := y

include ../sdk/sdk.mk
# add option "-I" before each included folders                    
INCLUDE_DIR  = $(patsubst %,-I%,$(INCLUDES))    

# Project name
PROJECT_NAME = blinky

# Options
OBJS  = $(SRC:.c=.o)

CPFLAGS = -mcpu=cortex-m4 -Os -gdwarf-2 -mthumb -fomit-frame-pointer -Wall -Wstrict-prototypes -fverbose-asm -Wa,-ahlms=$(<:.c=.lst) $(DEFS)
LDFLAGS = -mcpu=cortex-m4 -lc -mthumb -nostartfiles -T$(LDSCRIPT) -Wl,-Map=$(PROJECT_NAME).map,--cref,--no-warn-mismatch $(LIBDIR)

# Define target processor
TARGET 	:= 	NRF52
CPFLAGS += -D$(TARGET) 

# Generate dependency information
CPFLAGS += -MD -MP -MF .dep\$(@F).d
 


# Rules
 
all: $(OBJS) $(PROJECT_NAME).elf  $(PROJECT_NAME).hex $(PROJECT_NAME).map
 
%o: %c
	$(CC) -c $(CPFLAGS) -I . $(INCLUDE_DIR) $< -o $@

%hex: $(OBJS)
	$(CC) $(OBJS) $(LDFLAGS) -o $@

%elf: $(OBJS)
	$(CC) $(OBJS) $(LDFLAGS) -o $@
	
%bin: %elf
	$(BIN)  $< $@

	
clean:
	find ./ -name '*~' | xargs rm -f
	rm -f $(OBJS)
	rm -f $(PROJECT_NAME).elf
	rm -f $(PROJECT_NAME).map
	rm -f $(PROJECT_NAME).hex
	rm -f $(PROJECT_NAME).bin
	rm $(SRC:.c=.lst)
	rm -r  .dep*