	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.text
	.global if_if_Else
	.type if_if_Else , %function
if_if_Else:
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
	beq .L22
	b .L23
.L19:
	ldr r4, [fp, #-8]
	ldr r5, =15
	add  r6, r5, r4
	str r6, [fp, #-8]
	b .L20
.L20:
	ldr r4, [fp, #-8]
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, fp, lr}
	bx lr
.L22:
	ldr r4, =25
	str r4, [fp, #-8]
	b .L23
.L23:
	b .L20

	.global main
	.type main , %function
main:
	push {r4, fp, lr}
	mov fp, sp
	sub  sp, sp, #0
.L25:
	bl if_if_Else
	mov r4, r0
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, fp, lr}
	bx lr

