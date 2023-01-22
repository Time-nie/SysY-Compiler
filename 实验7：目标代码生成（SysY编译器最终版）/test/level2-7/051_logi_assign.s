	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global a
	.align 4
	.size a, 4
a:
	.word 0
	.global b
	.align 4
	.size b, 4
b:
	.word 0
	.text
	.global main
	.type main , %function
main:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub  sp, sp, #4
.L17:
	bl getint
	mov r4, r0
	ldr r5, addr_a
	str r4, [r5]
	bl getint
	mov r4, r0
	ldr r5, addr_b
	str r4, [r5]
	ldr r4, addr_b
	ldr r5, [r4]
	ldr r4, addr_a
	ldr r6, [r4]
	cmp r5, r6
	moveq r4, #1
	movne r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L25
	b .L20
.L19:
	ldr r4, =1
	str r4, [fp, #-4]
	b .L21
.L20:
	ldr r4, =0
	str r4, [fp, #-4]
	b .L21
.L21:
	ldr r4, [fp, #-4]
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, fp, lr}
	bx lr
.L25:
	ldr r4, addr_a
	ldr r5, [r4]
	ldr r4, =3
	cmp r4, r5
	movne r4, #1
	moveq r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L19
	b .L20

addr_a:
	.word a
addr_b:
	.word b
