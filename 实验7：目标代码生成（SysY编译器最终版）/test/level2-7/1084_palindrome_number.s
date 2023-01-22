	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.text
	.global palindrome
	.type palindrome , %function
palindrome:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub  sp, sp, #28
.L41:
	str r0, [fp, #-28]
	ldr r4, =0
	str r4, [fp, #-8]
	b .L47
.L47:
	ldr r4, [fp, #-8]
	ldr r5, =4
	cmp r5, r4
	bgt .L48
	b .L49
.L48:
	ldr r4, [fp, #-28]
	ldr r5, =10
	sdiv  r6, r4, r5
	mul  r6, r6, r5
	sub  r5, r4, r6
	ldr r4, [fp, #-8]
	mov r6, #-24
	mov r7, #4
	mul  r8, r4, r7
	add  r4, r6, r8
	add  r6, fp, r4
	str r5, [r6]
	ldr r4, [fp, #-28]
	ldr r5, =10
	sdiv  r6, r4, r5
	str r6, [fp, #-28]
	ldr r4, [fp, #-8]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-8]
	b .L47
.L49:
	mov r4, #3
	mov r5, #-24
	mov r7, #4
	mul  r6, r4, r7
	add  r4, r5, r6
	add  r5, fp, r4
	ldr r4, [r5]
	mov r5, #0
	mov r6, #-24
	mov r7, #4
	mul  r8, r5, r7
	add  r5, r6, r8
	add  r6, fp, r5
	ldr r5, [r6]
	cmp r4, r5
	moveq r4, #1
	movne r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L59
	b .L52
.L51:
	ldr r4, =1
	str r4, [fp, #-4]
	b .L53
.L52:
	ldr r4, =0
	str r4, [fp, #-4]
	b .L53
.L53:
	ldr r4, [fp, #-4]
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L59:
	mov r4, #2
	mov r5, #-24
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, [r5]
	mov r5, #1
	mov r6, #-24
	mov r7, #4
	mul  r8, r5, r7
	add  r5, r6, r8
	add  r6, fp, r5
	ldr r5, [r6]
	cmp r4, r5
	moveq r4, #1
	movne r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L51
	b .L52

	.global main
	.type main , %function
main:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub  sp, sp, #8
.L65:
	mov r4, #1221
	add  r4, r4, #0
	str r4, [fp, #-8]
	ldr r4, [fp, #-8]
	mov r0, r4
	bl palindrome
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, =1
	cmp r5, r4
	beq .L68
	b .L69
.L68:
	ldr r4, [fp, #-8]
	mov r0, r4
	bl putint
	b .L70
.L69:
	ldr r4, =0
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putint
	b .L70
.L70:
	ldr r4, =10
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putch
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, fp, lr}
	bx lr

