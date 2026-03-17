CC      = clang-12
DISASM  = llvm-objdump-12 
TARGET  = riscv32-unknown-elf
ARCH    = rv32i
ABI     = ilp32
OPTIM   ?= O0
BIN_DIR = bin
CFLAGS  = --target=$(TARGET) -march=$(ARCH) -mabi=$(ABI) -nostdlib -$(OPTIM)

FILE    ?= basic

all: asm object linker disasm

linker:
	mkdir -p $(BIN_DIR)
	$(CC) $(CFLAGS) $(FILE).o -o $(BIN_DIR)/$(FILE)

object:
	$(CC) $(CFLAGS) -c $(FILE).s -o $(FILE).o

asm:
	$(CC) $(CFLAGS) -S $(FILE).c -o $(FILE).s

# without aliases
disasm:
	$(DISASM) -d -M no-aliases $(BIN_DIR)/$(FILE) > $(FILE)_disasm.s

clean:
	rm -f *.o *.s
	rm -rf bin
