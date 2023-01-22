	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global a
	.align 4
	.size a, 24
a:
	.word 10
	.word 1
	.word 50
	.word 50
	.word 20
	.word 5
	.balign 4
	dp: .skip 400
	.text
	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, r9, fp, lr}
	mov fp, sp
	sub  sp, sp, #24
.L75:
	ldr r4, =6
	str r4, [fp, #-24]
	ldr r4, =3
	str r4, [fp, #-20]
	b .L82
.L82:
	ldr r4, [fp, #-24]
	ldr r5, [fp, #-20]
	cmp r4, r5
	bge .L83
	b .L84
.L83:
	ldr r4, =0
	str r4, [fp, #-16]
	b .L86
.L84:
	mov r4, #0
	ldr r5, addr_dp
	mov r6, #40
	mul  r7, r4, r6
	add  r4, r5, r7
	mov r5, r4
	ldr r4, [fp, #-24]
	sub  r6, r4, #1
	mov r4, #4
	mul  r7, r6, r4
	add  r4, r5, r7
	ldr r5, [r4]
	mov r0, r5
	bl putint
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, r9, fp, lr}
	bx lr
.L86:
	ldr r4, [fp, #-24]
	ldr r5, [fp, #-20]
	sub  r6, r4, r5
	ldr r4, =1
	add  r5, r4, r6
	ldr r4, [fp, #-16]
	cmp r5, r4
	bgt .L87
	b .L88
.L87:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-20]
	add  r6, r5, r4
	sub  r4, r6, #1
	str r4, [fp, #-8]
	ldr r4, [fp, #-16]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-12]
	b .L90
.L88:
	ldr r4, [fp, #-20]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-20]
	b .L82
.L90:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-12]
	cmp r4, r5
	bgt .L91
	b .L92
.L91:
	ldr r4, [fp, #-16]
	ldr r5, addr_dp
	mov r6, #40
	mul  r7, r4, r6
	add  r4, r5, r7
	mov r5, r4
	ldr r4, [fp, #-12]
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	ldr r5, [r4]
	ldr r4, [fp, #-12]
	ldr r6, addr_dp
	mov r7, #40
	mul  r8, r4, r7
	add  r4, r6, r8
	mov r6, r4
	ldr r4, [fp, #-8]
	mov r7, #4
	mul  r8, r4, r7
	add  r4, r6, r8
	ldr r6, [r4]
	add  r4, r6, r5
	ldr r5, [fp, #-16]
	ldr r6, addr_a
	mov r8, #4
	mul  r7, r5, r8
	add  r5, r6, r7
	mov r6, r5
	ldr r5, [r6]
	ldr r6, [fp, #-12]
	ldr r7, addr_a
	mov r9, #4
	mul  r8, r6, r9
	add  r6, r7, r8
	mov r7, r6
	ldr r6, [r7]
	mul  r7, r6, r5
	ldr r5, [fp, #-8]
	ldr r6, addr_a
	mov r8, #4
	mul  r9, r5, r8
	add  r5, r6, r9
	mov r6, r5
	ldr r5, [r6]
	mul  r6, r5, r7
	add  r5, r6, r4
	str r5, [fp, #-4]
	ldr r4, [fp, #-16]
	ldr r5, addr_dp
	mov r6, #40
	mul  r7, r4, r6
	add  r4, r5, r7
	mov r5, r4
	ldr r4, [fp, #-8]
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	ldr r5, [r4]
	ldr r4, =0
	cmp r5, r4
	moveq r4, #1
	movne r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L101
	b .L108
.L92:
	ldr r4, [fp, #-16]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-16]
	b .L86
.L101:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-16]
	ldr r6, addr_dp
	mov r7, #40
	mul  r8, r5, r7
	add  r5, r6, r8
	mov r6, r5
	ldr r5, [fp, #-8]
	mov r8, #4
	mul  r7, r5, r8
	add  r5, r6, r7
	str r4, [r5]
	b .L102
.L102:
	ldr r4, [fp, #-12]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-12]
	b .L90
.L108:
	ldr r4, [fp, #-16]
	ldr r5, addr_dp
	mov r6, #40
	mul  r7, r4, r6
	add  r4, r5, r7
	mov r5, r4
	ldr r4, [fp, #-8]
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	ldr r5, [r4]
	ldr r4, [fp, #-4]
	cmp r5, r4
	movgt r4, #1
	movle r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L101
	b .L102

addr_a:
	.word a
addr_dp:
	.word dp
