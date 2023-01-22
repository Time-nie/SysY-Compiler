	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.text
	.global whileIf
	.type whileIf , %function
whileIf:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub  sp, sp, #8
.L21:
	ldr r4, =0
	str r4, [fp, #-8]
	ldr r4, =0
	str r4, [fp, #-4]
	b .L24
.L24:
	ldr r4, [fp, #-8]
	ldr r5, =100
	cmp r5, r4
	bgt .L25
	b .L26
.L25:
	ldr r4, [fp, #-8]
	ldr r5, =5
	cmp r5, r4
	beq .L28
	b .L29
.L26:
	ldr r4, [fp, #-4]
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, fp, lr}
	bx lr
.L28:
	ldr r4, =25
	str r4, [fp, #-4]
	b .L30
.L29:
	ldr r4, [fp, #-8]
	ldr r5, =10
	cmp r5, r4
	beq .L32
	b .L33
.L30:
	ldr r4, [fp, #-8]
	ldr r5, =1
	mov r5, r5
	add  r5, r5, r4
	str r5, [fp, #-8]
	b .L24
.L32:
	ldr r4, =42
	str r4, [fp, #-4]
	b .L34
.L33:
	ldr r4, [fp, #-8]
	ldr r5, =2
	mul  r6, r5, r4
	str r6, [fp, #-4]
	b .L34
.L34:
	b .L30

	.global main
	.type main , %function
main:
	push {r4, fp, lr}
	mov fp, sp
	sub  sp, sp, #0
.L36:
	bl whileIf
	mov r4, r0
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, fp, lr}
	bx lr

