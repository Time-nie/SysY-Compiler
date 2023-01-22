	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global n
	.align 4
	.size n, 4
n:
	.word 0
	.text
	.global insertsort
	.type insertsort , %function
insertsort:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub  sp, sp, #16
.L69:
	str r0, [fp, #-16]
	ldr r4, =1
	str r4, [fp, #-12]
	b .L73
.L73:
	ldr r4, addr_n
	ldr r5, [r4]
	ldr r4, [fp, #-12]
	cmp r5, r4
	bgt .L74
	b .L75
.L74:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-12]
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	str r4, [fp, #-8]
	ldr r4, [fp, #-12]
	sub  r5, r4, #1
	str r5, [fp, #-4]
	b .L81
.L75:
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L81:
	ldr r4, =0
	sub  r5, r4, #1
	ldr r4, [fp, #-4]
	cmp r5, r4
	movlt r4, #1
	movge r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L87
	b .L83
.L82:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-4]
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-16]
	ldr r6, [fp, #-4]
	ldr r7, =1
	add  r8, r7, r6
	mov r6, #4
	mul  r7, r8, r6
	add  r6, r5, r7
	str r4, [r6]
	ldr r4, [fp, #-4]
	sub  r5, r4, #1
	str r5, [fp, #-4]
	b .L81
.L83:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-16]
	ldr r6, [fp, #-4]
	ldr r7, =1
	add  r8, r7, r6
	mov r6, #4
	mul  r7, r8, r6
	add  r6, r5, r7
	str r4, [r6]
	ldr r4, [fp, #-12]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-12]
	b .L73
.L87:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-4]
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-8]
	cmp r4, r5
	movgt r4, #1
	movle r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L82
	b .L83

	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub  sp, sp, #48
.L97:
	ldr r4, =10
	ldr r5, addr_n
	str r4, [r5]
	mov r4, #0
	mov r5, #-48
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =4
	str r4, [r5]
	mov r4, #1
	mov r5, #-48
	mov r7, #4
	mul  r6, r4, r7
	add  r4, r5, r6
	add  r5, fp, r4
	ldr r4, =3
	str r4, [r5]
	mov r4, #2
	mov r5, #-48
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =9
	str r4, [r5]
	mov r4, #3
	mov r5, #-48
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =2
	str r4, [r5]
	mov r4, #4
	mov r5, #-48
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =0
	str r4, [r5]
	mov r4, #5
	mov r5, #-48
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =1
	str r4, [r5]
	mov r4, #6
	mov r5, #-48
	mov r7, #4
	mul  r6, r4, r7
	add  r4, r5, r6
	add  r5, fp, r4
	ldr r4, =6
	str r4, [r5]
	mov r4, #7
	mov r5, #-48
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =5
	str r4, [r5]
	mov r4, #8
	mov r5, #-48
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =7
	str r4, [r5]
	mov r4, #9
	mov r5, #-48
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =8
	str r4, [r5]
	mov r4, #0
	mov r5, #-48
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	mov r0, r5
	bl insertsort
	mov r4, r0
	str r4, [fp, #-8]
	b .L100
.L100:
	ldr r4, addr_n
	ldr r5, [r4]
	ldr r4, [fp, #-8]
	cmp r5, r4
	bgt .L101
	b .L102
.L101:
	ldr r4, [fp, #-8]
	mov r5, #-48
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, [r5]
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putint
	ldr r4, =10
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putch
	ldr r4, [fp, #-8]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-8]
	b .L100
.L102:
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

addr_n:
	.word n
