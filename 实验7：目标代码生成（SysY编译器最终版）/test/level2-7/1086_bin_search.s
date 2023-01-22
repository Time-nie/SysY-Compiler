	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.text
	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub  sp, sp, #68
.L64:
	ldr r4, =0
	str r4, [fp, #-64]
	ldr r4, =0
	str r4, [fp, #-68]
	b .L68
.L68:
	ldr r4, [fp, #-68]
	ldr r5, =10
	cmp r5, r4
	bgt .L69
	b .L70
.L69:
	ldr r4, [fp, #-68]
	ldr r5, =1
	add  r6, r5, r4
	ldr r4, [fp, #-68]
	mov r5, #-60
	mov r7, #4
	mul  r8, r4, r7
	add  r4, r5, r8
	add  r5, fp, r4
	str r6, [r5]
	ldr r4, [fp, #-68]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-68]
	b .L68
.L70:
	ldr r4, =10
	str r4, [fp, #-4]
	bl getint
	mov r4, r0
	str r4, [fp, #-20]
	ldr r4, [fp, #-4]
	sub  r5, r4, #1
	str r5, [fp, #-16]
	ldr r4, =0
	str r4, [fp, #-12]
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-12]
	add  r6, r5, r4
	ldr r4, =2
	sdiv  r5, r6, r4
	str r5, [fp, #-8]
	b .L77
.L77:
	ldr r4, [fp, #-20]
	ldr r5, [fp, #-8]
	mov r6, #-60
	mov r7, #4
	mul  r8, r5, r7
	add  r5, r6, r8
	add  r6, fp, r5
	ldr r5, [r6]
	cmp r4, r5
	movne r4, #1
	moveq r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L84
	b .L79
.L78:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-12]
	add  r6, r5, r4
	ldr r4, =2
	sdiv  r5, r6, r4
	str r5, [fp, #-8]
	ldr r4, [fp, #-8]
	mov r5, #-60
	mov r7, #4
	mul  r6, r4, r7
	add  r4, r5, r6
	add  r5, fp, r4
	ldr r4, [r5]
	ldr r5, [fp, #-20]
	cmp r4, r5
	bgt .L88
	b .L89
.L79:
	ldr r4, [fp, #-8]
	mov r5, #-60
	mov r7, #4
	mul  r6, r4, r7
	add  r4, r5, r6
	add  r5, fp, r4
	ldr r4, [r5]
	ldr r5, [fp, #-20]
	cmp r4, r5
	beq .L93
	b .L94
.L84:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-12]
	cmp r4, r5
	movgt r4, #1
	movle r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L78
	b .L79
.L88:
	ldr r4, [fp, #-8]
	sub  r5, r4, #1
	str r5, [fp, #-16]
	b .L90
.L89:
	ldr r4, [fp, #-8]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-12]
	b .L90
.L90:
	b .L77
.L93:
	ldr r4, [fp, #-20]
	mov r0, r4
	bl putint
	b .L95
.L94:
	ldr r4, =0
	str r4, [fp, #-20]
	ldr r4, [fp, #-20]
	mov r0, r4
	bl putint
	b .L95
.L95:
	ldr r4, =10
	str r4, [fp, #-20]
	ldr r4, [fp, #-20]
	mov r0, r4
	bl putch
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

