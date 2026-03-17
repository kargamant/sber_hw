CC      = clang-12
TARGET  = riscv32-unknown-elf
ARCH    = rv32i
ABI     = ilp32
OPTIM	?= O0
CFLAGS  = --target=$(TARGET) -march=$(ARCH) -mabi=$(ABI) -nostdlib -$(OPTIM) -S

FILE    ?= basic

$(FILE).s: $(FILE).c
		$(CC) $(CFLAGS) $< -o $@

clean:
		rm -f $(FILE).s
