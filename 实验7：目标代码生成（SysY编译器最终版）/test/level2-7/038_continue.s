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
.L20:
	ldr r4, =0
	str r4, [fp, #-8]
	ldr r4, =0
	str r4, [fp, #-4]
	b .L23
.L23:
	ldr r4, [fp, #-8]
	ldr r5, =100
	cmp r5, r4
	bgt .L24
	b .L25
.L24:
	ldr r4, [fp, #-8]
	ldr r5, =50
	cmp r5, r4
	beq .L27
	b .L28
.L25:
	ldr r4, [fp, #-4]
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, fp, lr}
	bx lr
.L27:
	ldr r4, [fp, #-8]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-8]
	b .L23
.L28:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-8]
	add  r6, r5, r4
	str r6, [fp, #-4]
	ldr r4, [fp, #-8]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-8]
	b .L23
.L30:
	b .L28

