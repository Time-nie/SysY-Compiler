	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.text
	.global dec2bin
	.type dec2bin , %function
dec2bin:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub  sp, sp, #20
.L37:
	str r0, [fp, #-20]
	ldr r4, =0
	str r4, [fp, #-16]
	ldr r4, =1
	str r4, [fp, #-12]
	ldr r4, [fp, #-20]
	str r4, [fp, #-4]
	b .L44
.L44:
	ldr r4, [fp, #-4]
	ldr r5, =0
	cmp r5, r4
	bne .L45
	b .L46
.L45:
	ldr r4, [fp, #-4]
	ldr r5, =2
	sdiv  r6, r4, r5
	mul  r6, r6, r5
	sub  r5, r4, r6
	str r5, [fp, #-8]
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-8]
	mul  r6, r5, r4
	ldr r4, [fp, #-16]
	add  r5, r4, r6
	str r5, [fp, #-16]
	ldr r4, [fp, #-12]
	ldr r5, =10
	mul  r6, r5, r4
	str r6, [fp, #-12]
	ldr r4, [fp, #-4]
	ldr r5, =2
	sdiv  r6, r4, r5
	str r6, [fp, #-4]
	b .L44
.L46:
	ldr r4, [fp, #-16]
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, fp, lr}
	bx lr

	.global main
	.type main , %function
main:
	push {r4, fp, lr}
	mov fp, sp
	sub  sp, sp, #8
.L48:
	ldr r4, =400
	str r4, [fp, #-8]
	ldr r4, [fp, #-8]
	mov r0, r4
	bl dec2bin
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

