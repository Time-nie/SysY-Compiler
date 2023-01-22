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
	sub  sp, sp, #4
.L15:
	ldr r4, =10
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
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
	add  r4, r4, r5
	sub  r4, r4, r5
	sub  r6, r4, r5
	ldr r4, =0
	mov r4, r4
	add  r4, r4, r6
	ldr r5, =0
	cmp r4, r5
	bne .L17
	b .L18
.L17:
	ldr r4, =0
	add  r4, r4, #1
	sub  r4, r4, #1
	sub  r5, r4, #1
	ldr r4, =0
	add  r4, r4, r5
	sub  r4, r4, r5
	sub  r6, r4, r5
	ldr r4, =0
	add  r4, r4, r6
	sub  r4, r4, r6
	sub  r5, r4, r6
	str r5, [fp, #-4]
	b .L19
.L18:
	ldr r4, =0
	str r4, [fp, #-4]
	b .L19
.L19:
	ldr r4, [fp, #-4]
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, fp, lr}
	bx lr

