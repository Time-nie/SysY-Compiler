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
.L17:
	ldr r4, =0
	str r4, [fp, #-8]
	ldr r4, =0
	str r4, [fp, #-4]
	b .L20
.L20:
	ldr r4, [fp, #-8]
	ldr r5, =100
	cmp r5, r4
	bgt .L21
	b .L22
.L21:
	ldr r4, [fp, #-8]
	ldr r5, =50
	cmp r5, r4
	beq .L24
	b .L25
.L22:
	ldr r4, [fp, #-4]
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, fp, lr}
	bx lr
.L24:
	b .L22
.L25:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-8]
	add  r6, r5, r4
	str r6, [fp, #-4]
	ldr r4, [fp, #-8]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-8]
	b .L20
.L27:
	b .L25

