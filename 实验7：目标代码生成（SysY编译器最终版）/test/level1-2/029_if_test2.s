	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.text
	.global ifElseIf
	.type ifElseIf , %function
ifElseIf:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub  sp, sp, #8
.L32:
	ldr r4, =5
	str r4, [fp, #-8]
	ldr r4, =10
	str r4, [fp, #-4]
	ldr r4, [fp, #-8]
	ldr r5, =6
	cmp r5, r4
	moveq r4, #1
	movne r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L35
	b .L41
.L35:
	ldr r4, [fp, #-8]
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, fp, lr}
	bx lr
	b .L37
.L36:
	ldr r4, [fp, #-4]
	ldr r5, =10
	cmp r5, r4
	moveq r4, #1
	movne r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L51
	b .L46
.L37:
	ldr r4, [fp, #-8]
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, fp, lr}
	bx lr
.L41:
	ldr r4, [fp, #-4]
	ldr r5, =11
	cmp r5, r4
	moveq r4, #1
	movne r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L35
	b .L36
.L45:
	ldr r4, =25
	str r4, [fp, #-8]
	b .L47
.L46:
	ldr r4, [fp, #-4]
	ldr r5, =10
	cmp r5, r4
	moveq r4, #1
	movne r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L61
	b .L56
.L47:
	b .L37
.L51:
	ldr r4, [fp, #-8]
	ldr r5, =1
	cmp r5, r4
	moveq r4, #1
	movne r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L45
	b .L46
.L55:
	ldr r4, [fp, #-8]
	ldr r5, =15
	mov r5, r5
	add  r5, r5, r4
	str r5, [fp, #-8]
	b .L57
.L56:
	ldr r4, [fp, #-8]
	ldr r5, =0
	mov r5, r5
	add  r5, r5, r4
	ldr r4, =0
	add  r4, r4, r5
	sub  r4, r4, r5
	sub  r6, r4, r5
	str r6, [fp, #-8]
	b .L57
.L57:
	b .L47
.L61:
	ldr r4, =0
	add  r4, r4, #5
	sub  r4, r4, #5
	sub  r5, r4, #5
	ldr r4, [fp, #-8]
	cmp r5, r4
	moveq r4, #1
	movne r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L55
	b .L56

	.global main
	.type main , %function
main:
	push {r4, fp, lr}
	mov fp, sp
	sub  sp, sp, #0
.L65:
	bl ifElseIf
	mov r4, r0
	mov r0, r4
	bl putint
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, fp, lr}
	bx lr

