	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.text
	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub  sp, sp, #8
.L27:
	ldr r4, =56
	str r4, [fp, #-8]
	ldr r4, =4
	str r4, [fp, #-4]
	ldr r4, [fp, #-8]
	ldr r5, =0
	sub  r6, r5, #4
	sub  r5, r4, r6
	ldr r4, [fp, #-4]
	ldr r6, =0
	add  r7, r6, r4
	add  r4, r7, r5
	str r4, [fp, #-8]
	ldr r4, [fp, #-8]
	ldr r5, =0
	cmp r4, r5
	moveq r4, #1
	movne r4, #0
	moveq r4, #1
	movne r4, #0
	moveq r4, #1
	movne r4, #0
	mov r5, r4
	ldr r4, =0
	sub  r6, r4, r5
	ldr r4, =0
	add  r5, r4, r6
	ldr r4, =0
	cmp r5, r4
	bne .L30
	b .L31
.L30:
	ldr r4, =0
	sub  r5, r4, #1
	ldr r4, =0
	sub  r6, r4, r5
	ldr r4, =0
	sub  r5, r4, r6
	str r5, [fp, #-8]
	b .L32
.L31:
	ldr r4, [fp, #-4]
	ldr r5, =0
	add  r6, r5, r4
	add  r4, r6, #0
	str r4, [fp, #-8]
	b .L32
.L32:
	ldr r4, [fp, #-8]
	mov r0, r4
	bl putint
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

