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
	sub  sp, sp, #76
.L59:
	ldr r4, =0
	str r4, [fp, #-72]
	ldr r4, =0
	str r4, [fp, #-76]
	b .L63
.L63:
	ldr r4, [fp, #-76]
	ldr r5, =10
	cmp r5, r4
	bgt .L64
	b .L65
.L64:
	ldr r4, [fp, #-76]
	ldr r5, =1
	add  r6, r5, r4
	ldr r4, [fp, #-76]
	mov r5, #-68
	mov r7, #4
	mul  r8, r4, r7
	add  r4, r5, r8
	add  r5, fp, r4
	str r6, [r5]
	ldr r4, [fp, #-76]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-76]
	b .L63
.L65:
	ldr r4, =10
	str r4, [fp, #-12]
	bl getint
	mov r4, r0
	str r4, [fp, #-28]
	ldr r4, [fp, #-12]
	sub  r5, r4, #1
	str r5, [fp, #-24]
	ldr r4, =0
	str r4, [fp, #-20]
	ldr r4, [fp, #-24]
	ldr r5, [fp, #-20]
	add  r6, r5, r4
	ldr r4, =2
	sdiv  r5, r6, r4
	str r5, [fp, #-16]
	ldr r4, =0
	str r4, [fp, #-8]
	ldr r4, =0
	str r4, [fp, #-76]
	ldr r4, =0
	str r4, [fp, #-4]
	b .L74
.L74:
	ldr r4, [fp, #-76]
	ldr r5, =10
	cmp r5, r4
	movgt r4, #1
	movle r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L80
	b .L76
.L75:
	ldr r4, [fp, #-28]
	ldr r5, [fp, #-76]
	mov r6, #-68
	mov r7, #4
	mul  r8, r5, r7
	add  r5, r6, r8
	add  r6, fp, r5
	ldr r5, [r6]
	cmp r4, r5
	beq .L84
	b .L85
.L76:
	ldr r4, [fp, #-8]
	ldr r5, =1
	cmp r5, r4
	beq .L88
	b .L89
.L80:
	ldr r4, [fp, #-8]
	ldr r5, =0
	cmp r5, r4
	moveq r4, #1
	movne r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L75
	b .L76
.L84:
	ldr r4, =1
	str r4, [fp, #-8]
	ldr r4, [fp, #-76]
	str r4, [fp, #-4]
	b .L85
.L85:
	ldr r4, [fp, #-76]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-76]
	b .L74
.L88:
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putint
	b .L90
.L89:
	ldr r4, =0
	str r4, [fp, #-28]
	ldr r4, [fp, #-28]
	mov r0, r4
	bl putint
	b .L90
.L90:
	ldr r4, =10
	str r4, [fp, #-28]
	ldr r4, [fp, #-28]
	mov r0, r4
	bl putch
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

