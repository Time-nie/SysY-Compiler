	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.text
	.global main
	.type main , %function
main:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub  sp, sp, #8
.L15:
	ldr r4, =0
	str r4, [fp, #-4]
	ldr r4, =0
	str r4, [fp, #-8]
	b .L18
.L18:
	ldr r4, [fp, #-8]
	ldr r5, =21
	cmp r5, r4
	bgt .L19
	b .L20
.L19:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-8]
	mul  r6, r5, r4
	str r6, [fp, #-4]
	ldr r4, [fp, #-8]
	ldr r5, =1
	mov r5, r5
	add  r5, r5, r4
	str r5, [fp, #-8]
	b .L18
.L20:
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putint
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, r6, fp, lr}
	bx lr

