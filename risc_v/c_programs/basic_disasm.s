
bin/basic:	file format elf32-littleriscv


Disassembly of section .text:

000110b4 <foo>:
   110b4: 13 01 01 fe  	addi	sp, sp, -32
   110b8: 23 2e 11 00  	sw	ra, 28(sp)
   110bc: 23 2c 81 00  	sw	s0, 24(sp)
   110c0: 13 04 01 02  	addi	s0, sp, 32
   110c4: 23 28 a4 fe  	sw	a0, -16(s0)
   110c8: 23 26 b4 fe  	sw	a1, -20(s0)
   110cc: 83 25 04 ff  	lw	a1, -16(s0)
   110d0: 03 25 c4 fe  	lw	a0, -20(s0)
   110d4: 63 5e b5 00  	bge	a0, a1, 0x110f0 <.LBB0_2>
   110d8: 6f 00 40 00  	jal	zero, 0x110dc <.LBB0_1>

000110dc <.LBB0_1>:
   110dc: 03 25 04 ff  	lw	a0, -16(s0)
   110e0: 83 25 c4 fe  	lw	a1, -20(s0)
   110e4: 33 05 b5 00  	add	a0, a0, a1
   110e8: 23 2a a4 fe  	sw	a0, -12(s0)
   110ec: 6f 00 80 01  	jal	zero, 0x11104 <.LBB0_3>

000110f0 <.LBB0_2>:
   110f0: 03 25 04 ff  	lw	a0, -16(s0)
   110f4: 83 25 c4 fe  	lw	a1, -20(s0)
   110f8: 33 05 b5 40  	sub	a0, a0, a1
   110fc: 23 2a a4 fe  	sw	a0, -12(s0)
   11100: 6f 00 40 00  	jal	zero, 0x11104 <.LBB0_3>

00011104 <.LBB0_3>:
   11104: 03 25 44 ff  	lw	a0, -12(s0)
   11108: 03 24 81 01  	lw	s0, 24(sp)
   1110c: 83 20 c1 01  	lw	ra, 28(sp)
   11110: 13 01 01 02  	addi	sp, sp, 32
   11114: 67 80 00 00  	jalr	zero, 0(ra)

00011118 <bar_1>:
   11118: 13 01 01 ff  	addi	sp, sp, -16
   1111c: 23 26 11 00  	sw	ra, 12(sp)
   11120: 23 24 81 00  	sw	s0, 8(sp)
   11124: 13 04 01 01  	addi	s0, sp, 16
   11128: 23 2a a4 fe  	sw	a0, -12(s0)
   1112c: 23 28 b4 fe  	sw	a1, -16(s0)
   11130: 03 25 44 ff  	lw	a0, -12(s0)
   11134: 83 25 04 ff  	lw	a1, -16(s0)
   11138: 97 00 00 00  	auipc	ra, 0
   1113c: e7 80 c0 f7  	jalr	ra, -132(ra)
   11140: 13 15 15 00  	slli	a0, a0, 1
   11144: 03 24 81 00  	lw	s0, 8(sp)
   11148: 83 20 c1 00  	lw	ra, 12(sp)
   1114c: 13 01 01 01  	addi	sp, sp, 16
   11150: 67 80 00 00  	jalr	zero, 0(ra)

00011154 <main>:
   11154: 13 01 01 ff  	addi	sp, sp, -16
   11158: 23 26 11 00  	sw	ra, 12(sp)
   1115c: 23 24 81 00  	sw	s0, 8(sp)
   11160: 13 04 01 01  	addi	s0, sp, 16
   11164: 13 05 00 00  	addi	a0, zero, 0
   11168: 23 28 a4 fe  	sw	a0, -16(s0)
   1116c: 23 2a a4 fe  	sw	a0, -12(s0)
   11170: 13 05 10 00  	addi	a0, zero, 1
   11174: 93 05 20 00  	addi	a1, zero, 2
   11178: 97 00 00 00  	auipc	ra, 0
   1117c: e7 80 c0 f3  	jalr	ra, -196(ra)
   11180: 03 25 04 ff  	lw	a0, -16(s0)
   11184: 03 24 81 00  	lw	s0, 8(sp)
   11188: 83 20 c1 00  	lw	ra, 12(sp)
   1118c: 13 01 01 01  	addi	sp, sp, 16
   11190: 67 80 00 00  	jalr	zero, 0(ra)
