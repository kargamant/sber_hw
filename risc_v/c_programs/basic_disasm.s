
basic.o:	file format elf32-littleriscv


Disassembly of section .text:

00000000 <foo>:
       0: 13 01 01 fe  	addi	sp, sp, -32
       4: 23 2e 11 00  	sw	ra, 28(sp)
       8: 23 2c 81 00  	sw	s0, 24(sp)
       c: 13 04 01 02  	addi	s0, sp, 32
      10: 23 28 a4 fe  	sw	a0, -16(s0)
      14: 23 26 b4 fe  	sw	a1, -20(s0)
      18: 83 25 04 ff  	lw	a1, -16(s0)
      1c: 03 25 c4 fe  	lw	a0, -20(s0)
      20: 63 50 b5 00  	bge	a0, a1, 0x20 <foo+0x20>
      24: 6f 00 00 00  	jal	zero, 0x24 <foo+0x24>

00000028 <.LBB0_1>:
      28: 03 25 04 ff  	lw	a0, -16(s0)
      2c: 83 25 c4 fe  	lw	a1, -20(s0)
      30: 33 05 b5 00  	add	a0, a0, a1
      34: 23 2a a4 fe  	sw	a0, -12(s0)
      38: 6f 00 00 00  	jal	zero, 0x38 <.LBB0_1+0x10>

0000003c <.LBB0_2>:
      3c: 03 25 04 ff  	lw	a0, -16(s0)
      40: 83 25 c4 fe  	lw	a1, -20(s0)
      44: 33 05 b5 40  	sub	a0, a0, a1
      48: 23 2a a4 fe  	sw	a0, -12(s0)
      4c: 6f 00 00 00  	jal	zero, 0x4c <.LBB0_2+0x10>

00000050 <.LBB0_3>:
      50: 03 25 44 ff  	lw	a0, -12(s0)
      54: 03 24 81 01  	lw	s0, 24(sp)
      58: 83 20 c1 01  	lw	ra, 28(sp)
      5c: 13 01 01 02  	addi	sp, sp, 32
      60: 67 80 00 00  	jalr	zero, 0(ra)

00000064 <main>:
      64: 13 01 01 ff  	addi	sp, sp, -16
      68: 23 26 11 00  	sw	ra, 12(sp)
      6c: 23 24 81 00  	sw	s0, 8(sp)
      70: 13 04 01 01  	addi	s0, sp, 16
      74: 13 05 00 00  	addi	a0, zero, 0
      78: 23 28 a4 fe  	sw	a0, -16(s0)
      7c: 23 2a a4 fe  	sw	a0, -12(s0)
      80: 13 05 10 00  	addi	a0, zero, 1
      84: 93 05 20 00  	addi	a1, zero, 2
      88: 97 00 00 00  	auipc	ra, 0
      8c: e7 80 00 00  	jalr	ra, 0(ra)
      90: 03 25 04 ff  	lw	a0, -16(s0)
      94: 03 24 81 00  	lw	s0, 8(sp)
      98: 83 20 c1 00  	lw	ra, 12(sp)
      9c: 13 01 01 01  	addi	sp, sp, 16
      a0: 67 80 00 00  	jalr	zero, 0(ra)
