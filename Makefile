
AS = nasm
CC = clang
LD = ld.lld
CFLAGS = -m32 -c -ffreestanding -nostdlib -Wall -Wextra -Werror -pedantic-errors
LDFLAGS = -m elf_i386


SRC_DIR = src
BUILD_DIR = build

ASM_SRC = $(SRC_DIR)/kernel.asm
C_SRC = $(SRC_DIR)/kernel.c
OBJS = $(BUILD_DIR)/kasm.o $(BUILD_DIR)/kc.o

TARGET = $(BUILD_DIR)/kernel

all: $(TARGET)

$(TARGET): $(OBJS)
	$(LD) $(LDFLAGS) -T $(SRC_DIR)/link.ld -o $@ $^

$(BUILD_DIR)/kasm.o: $(ASM_SRC)
	$(AS) -f elf32 $< -o $@

$(BUILD_DIR)/kc.o: $(C_SRC)
	$(CC) $(CFLAGS) $< -o $@

clean:
	rm -f $(OBJS) $(TARGET)

run: $(TARGET)
	qemu-system-i386 -kernel $<
