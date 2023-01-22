	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.text
	.global ififElse
	.type ififElse , %function
ififElse:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub  sp, sp, #8
.L15:
	ldr r4, =5
	str r4, [fp, #-8]
	ldr r4, =10
	str r4, [fp, #-4]
	ldr r4, [fp, #-8]
	ldr r5, =5
	cmp r5, r4
	beq .L18
	b .L19
.L18:
	ldr r4, [fp, #-4]
	ldr r5, =10
	cmp r5, r4
	beq .L21
	b .L22
.L19:
	ldr r4, [fp, #-8]
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, fp, lr}
	bx lr
.L21:
	ldr r4, =25
	str r4, [fp, #-8]
	b .L23
.L22:
	ldr r4, [fp, #-8]
	ldr r5, =15
	add  r6, r5, r4
	str r6, [fp, #-8]
	b .L23
.L23:
	b .L19

	.global main
	.type main , %function
main:
	push {r4, fp, lr}
	mov fp, sp
	sub  sp, sp, #0
.L25:
	bl ififElse
	mov r4, r0
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, fp, lr}
	bx lr

