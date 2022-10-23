	.arch armv7-a
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.section	.rodata
	.align	2
.LC0:
	.ascii	"%d\000"
	.align	2
.LC1:
	.ascii	"success\000"
	.align	2
.LC2:
	.ascii	"%d\012\000"
	.text
	.align	1
	.global	main
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
	sub	sp, sp, #28
	add	r7, sp, #0
	ldr	r4, .L7
.LPIC0:
	add	r4, pc
	ldr	r3, .L7+4
	ldr	r3, [r4, r3]
	ldr	r3, [r3]
	str	r3, [r7, #20]
	movs	r3, #0
	str	r3, [r7, #4]
	movs	r3, #1
	str	r3, [r7, #8]
	movs	r3, #1
	str	r3, [r7, #12]
	mov	r3, r7
	mov	r1, r3
	ldr	r3, .L7+8
.LPIC1:
	add	r3, pc
	mov	r0, r3
	bl	__isoc99_scanf(PLT)
	ldr	r3, [r7]
	cmp	r3, #99
	bgt	.L2
	ldr	r3, .L7+12
.LPIC2:
	add	r3, pc
	mov	r0, r3
	bl	printf(PLT)
	ldr	r1, [r7, #4]
	ldr	r3, .L7+16
.LPIC3:
	add	r3, pc
	mov	r0, r3
	bl	printf(PLT)
	ldr	r1, [r7, #8]
	ldr	r3, .L7+20
.LPIC4:
	add	r3, pc
	mov	r0, r3
	bl	printf(PLT)
	b	.L3
.L4:
	ldr	r3, [r7, #8]
	str	r3, [r7, #16]
	ldr	r2, [r7, #8]
	ldr	r3, [r7, #4]
	add	r3, r3, r2
	str	r3, [r7, #8]
	ldr	r1, [r7, #8]
	ldr	r3, .L7+24
.LPIC5:
	add	r3, pc
	mov	r0, r3
	bl	printf(PLT)
	ldr	r3, [r7, #16]
	str	r3, [r7, #4]
	ldr	r3, [r7, #12]
	adds	r3, r3, #1
	str	r3, [r7, #12]
.L3:
	ldr	r3, [r7]
	ldr	r2, [r7, #12]
	cmp	r2, r3
	blt	.L4
.L2:
	movs	r3, #0
	mov	r0, r3
	ldr	r3, .L7+4
	ldr	r3, [r4, r3]
	ldr	r2, [r7, #20]
	ldr	r3, [r3]
	cmp	r2, r3
	beq	.L6
	bl	__stack_chk_fail(PLT)
.L6:
	adds	r7, r7, #28
	mov	sp, r7
	@ sp needed
	pop	{r4, r7, pc}
.L8:
	.align	2
.L7:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC0+4)
	.word	__stack_chk_guard(GOT)
	.word	.LC0-(.LPIC1+4)
	.word	.LC1-(.LPIC2+4)
	.word	.LC2-(.LPIC3+4)
	.word	.LC2-(.LPIC4+4)
	.word	.LC2-(.LPIC5+4)
	.size	main, .-main
	.ident	"GCC: (Ubuntu/Linaro 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",%progbits
