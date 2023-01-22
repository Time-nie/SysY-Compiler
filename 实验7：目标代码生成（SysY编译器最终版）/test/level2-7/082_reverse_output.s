	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.text
	.global reverse
	.type reverse , %function
reverse:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub  sp, sp, #8
.L15:
	str r0, [fp, #-8]
	ldr r4, [fp, #-8]
	ldr r5, =1
	cmp r5, r4
	bge .L19
	b .L20
.L19:
	bl getint
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putint
	b .L21
.L20:
	bl getint
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-8]
	sub  r5, r4, #1
	mov r0, r5
	bl reverse
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putint
	b .L21
.L21:
	sub  sp, fp, #0
	pop {r4, r5, fp, lr}
	bx lr

	.global main
	.type main , %function
main:
	push {r4, fp, lr}
	mov fp, sp
	sub  sp, sp, #4
.L23:
	ldr r4, =200
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl reverse
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, fp, lr}
	bx lr

