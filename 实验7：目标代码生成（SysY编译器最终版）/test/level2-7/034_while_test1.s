	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.text
	.global doubleWhile
	.type doubleWhile , %function
doubleWhile:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub  sp, sp, #8
.L20:
	ldr r4, =5
	str r4, [fp, #-8]
	ldr r4, =7
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
	ldr r5, =30
	add  r6, r5, r4
	str r6, [fp, #-8]
	b .L27
.L25:
	ldr r4, [fp, #-4]
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, fp, lr}
	bx lr
.L27:
	ldr r4, [fp, #-4]
	ldr r5, =100
	cmp r5, r4
	bgt .L28
	b .L29
.L28:
	ldr r4, [fp, #-4]
	ldr r5, =6
	add  r6, r5, r4
	str r6, [fp, #-4]
	b .L27
.L29:
	ldr r4, [fp, #-4]
	sub  r5, r4, #100
	str r5, [fp, #-4]
	b .L23

	.global main
	.type main , %function
main:
	push {r4, fp, lr}
	mov fp, sp
	sub  sp, sp, #0
.L31:
	bl doubleWhile
	mov r4, r0
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, fp, lr}
	bx lr

