	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.text
	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	ldr r4, =408
	sub  sp, sp, r4
.L22:
	ldr r4, =0
	str r4, [fp, #-8]
	ldr r4, =0
	str r4, [fp, #-4]
	b .L26
.L26:
	bl getint
	mov r4, r0
	ldr r5, =0
	cmp r4, r5
	bne .L27
	b .L28
.L27:
	bl getint
	mov r4, r0
	ldr r5, [fp, #-8]
	mov r6, #65128
	add  r6, r6, #16711680
	add  r6, r6, #-16777216
	mov r7, #4
	mul  r8, r5, r7
	add  r5, r6, r8
	add  r6, fp, r5
	str r4, [r6]
	ldr r4, [fp, #-8]
	ldr r5, =1
	mov r5, r5
	add  r5, r5, r4
	str r5, [fp, #-8]
	b .L26
.L28:
	b .L30
.L30:
	ldr r4, [fp, #-8]
	ldr r5, =0
	cmp r4, r5
	bne .L31
	b .L32
.L31:
	ldr r4, [fp, #-8]
	add  r4, r4, #1
	sub  r4, r4, #1
	sub  r5, r4, #1
	str r5, [fp, #-8]
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-8]
	mov r6, #65128
	add  r6, r6, #16711680
	add  r6, r6, #-16777216
	mov r7, #4
	mul  r8, r5, r7
	add  r5, r6, r8
	add  r6, fp, r5
	ldr r5, [r6]
	mov r5, r5
	add  r5, r5, r4
	str r5, [fp, #-4]
	b .L30
.L32:
	ldr r4, [fp, #-4]
	ldr r5, =79
	sdiv  r6, r4, r5
	mul  r6, r6, r5
	sub  r5, r4, r6
	mov r0, r5
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

