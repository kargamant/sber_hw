	.text
	.attribute	4, 16
	.attribute	5, "rv32i2p0"
	.file	"basic.c"
	.globl	foo
	.p2align	2
	.type	foo,@function
foo:
	addi	sp, sp, -32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	addi	s0, sp, 32
	sw	a0, -16(s0)
	sw	a1, -20(s0)
	lw	a1, -16(s0)
	lw	a0, -20(s0)
	bge	a0, a1, .LBB0_2
	j	.LBB0_1
.LBB0_1:
	lw	a0, -16(s0)
	lw	a1, -20(s0)
	add	a0, a0, a1
	sw	a0, -12(s0)
	j	.LBB0_3
.LBB0_2:
	lw	a0, -16(s0)
	lw	a1, -20(s0)
	sub	a0, a0, a1
	sw	a0, -12(s0)
	j	.LBB0_3
.LBB0_3:
	lw	a0, -12(s0)
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end0:
	.size	foo, .Lfunc_end0-foo

	.globl	bar_1
	.p2align	2
	.type	bar_1,@function
bar_1:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	addi	s0, sp, 16
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	lw	a0, -12(s0)
	lw	a1, -16(s0)
	call	foo
	slli	a0, a0, 1
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end1:
	.size	bar_1, .Lfunc_end1-bar_1

	.globl	main
	.p2align	2
	.type	main,@function
main:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	addi	s0, sp, 16
	mv	a0, zero
	sw	a0, -16(s0)
	sw	a0, -12(s0)
	addi	a0, zero, 1
	addi	a1, zero, 2
	call	foo
	lw	a0, -16(s0)
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end2:
	.size	main, .Lfunc_end2-main

	.ident	"Ubuntu clang version 12.0.0-3ubuntu1~20.04.5"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym foo
