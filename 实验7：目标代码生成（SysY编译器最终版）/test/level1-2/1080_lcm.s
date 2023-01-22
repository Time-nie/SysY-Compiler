	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global n
	.align 4
	.size n, 4
n:
	.word 0
	.text
	.global gcd
	.type gcd , %function
gcd:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub  sp, sp, #24
.L49:
	str r0, [fp, #-24]
	str r1, [fp, #-20]
	ldr r4, [fp, #-24]
	str r4, [fp, #-16]
	ldr r4, [fp, #-20]
	str r4, [fp, #-12]
	ldr r4, [fp, #-20]
	ldr r5, [fp, #-24]
	cmp r4, r5
	bgt .L58
	b .L59
.L58:
	ldr r4, [fp, #-24]
	str r4, [fp, #-8]
	ldr r4, [fp, #-20]
	str r4, [fp, #-24]
	ldr r4, [fp, #-8]
	str r4, [fp, #-20]
	b .L59
.L59:
	ldr r4, [fp, #-24]
	ldr r5, [fp, #-20]
	sdiv  r6, r4, r5
	mul  r6, r6, r5
	sub  r5, r4, r6
	str r5, [fp, #-4]
	b .L61
.L61:
	ldr r4, [fp, #-4]
	ldr r5, =0
	cmp r5, r4
	bne .L62
	b .L63
.L62:
	ldr r4, [fp, #-20]
	str r4, [fp, #-24]
	ldr r4, [fp, #-4]
	str r4, [fp, #-20]
	ldr r4, [fp, #-24]
	ldr r5, [fp, #-20]
	sdiv  r6, r4, r5
	mul  r6, r6, r5
	sub  r5, r4, r6
	str r5, [fp, #-4]
	b .L61
.L63:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-12]
	mul  r6, r5, r4
	ldr r4, [fp, #-20]
	sdiv  r5, r6, r4
	mov r0, r5
	sub  sp, fp, #0
	pop {r4, r5, r6, fp, lr}
	bx lr

	.global main
	.type main , %function
main:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub  sp, sp, #8
.L65:
	bl getint
	mov r4, r0
	str r4, [fp, #-8]
	bl getint
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	mov r0, r4
	mov r1, r5
	bl gcd
	mov r4, r0
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, fp, lr}
	bx lr

addr_n:
	.word n
