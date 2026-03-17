CC      = clang-12
DISASM  = llvm-objdump-12 
TARGET  = riscv32-unknown-elf
ARCH    = rv32i
ABI     = ilp32
OPTIM   ?= O0
CFLAGS  = --target=$(TARGET) -march=$(ARCH) -mabi=$(ABI) -nostdlib -$(OPTIM)

FILE    ?= basic

all: object asm disasm

object:
	$(CC) $(CFLAGS) -c $(FILE).c -o $(FILE).o

asm:
	$(CC) $(CFLAGS) -S $(FILE).c -o $(FILE).s

# without aliases
disasm:
	$(DISASM) -d -M no-aliases $(FILE).o > $(FILE)_disasm.s

clean:
	rm -f *.o *.s
