	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.text
	.global fsqrt
	.type fsqrt , %function
fsqrt:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub  sp, sp, #12
.L32:
	str r0, [fp, #-12]
	ldr r4, =0
	str r4, [fp, #-8]
	ldr r4, [fp, #-12]
	ldr r5, =2
	sdiv  r6, r4, r5
	str r6, [fp, #-4]
	b .L37
.L37:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	add  r4, r4, r5
	sub  r4, r4, r5
	sub  r6, r4, r5
	ldr r4, =0
	cmp r4, r6
	bne .L38
	b .L39
.L38:
	ldr r4, [fp, #-4]
	str r4, [fp, #-8]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-12]
	ldr r6, [fp, #-8]
	sdiv  r7, r5, r6
	mov r5, r7
	add  r5, r5, r4
	str r5, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, =2
	sdiv  r6, r4, r5
	str r6, [fp, #-4]
	b .L37
.L39:
	ldr r4, [fp, #-4]
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

	.global main
	.type main , %function
main:
	push {r4, fp, lr}
	mov fp, sp
	sub  sp, sp, #8
.L41:
	ldr r4, =400
	str r4, [fp, #-8]
	ldr r4, [fp, #-8]
	mov r0, r4
	bl fsqrt
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putint
	ldr r4, =10
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putch
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, fp, lr}
	bx lr

