	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.text
	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub  sp, sp, #16
.L39:
	ldr r4, =0
	str r4, [fp, #-16]
	ldr r4, =0
	str r4, [fp, #-12]
	ldr r4, =0
	str r4, [fp, #-8]
	b .L44
.L44:
	ldr r4, [fp, #-16]
	ldr r5, =21
	cmp r5, r4
	bgt .L45
	b .L46
.L45:
	b .L48
.L46:
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L48:
	ldr r4, [fp, #-16]
	ldr r5, =101
	add  r5, r5, r4
	sub  r5, r5, r4
	sub  r6, r5, r4
	ldr r4, [fp, #-12]
	cmp r6, r4
	bgt .L49
	b .L50
.L49:
	ldr r4, [fp, #-16]
	ldr r5, =100
	add  r5, r5, r4
	sub  r5, r5, r4
	sub  r6, r5, r4
	ldr r4, [fp, #-12]
	add  r6, r6, r4
	sub  r6, r6, r4
	sub  r5, r6, r4
	str r5, [fp, #-8]
	ldr r4, [fp, #-16]
	ldr r5, =5
	mul  r6, r4, r5
	ldr r4, [fp, #-12]
	ldr r5, =1
	mul  r7, r4, r5
	mov r4, r7
	add  r4, r4, r6
	ldr r5, [fp, #-8]
	ldr r6, =2
	sdiv  r7, r5, r6
	mov r5, r7
	add  r5, r5, r4
	ldr r4, =100
	cmp r4, r5
	beq .L52
	b .L53
.L50:
	ldr r4, [fp, #-16]
	ldr r5, =1
	mov r5, r5
	add  r5, r5, r4
	str r5, [fp, #-16]
	b .L44
.L52:
	ldr r4, [fp, #-16]
	mov r0, r4
	bl putint
	ldr r4, [fp, #-12]
	mov r0, r4
	bl putint
	ldr r4, [fp, #-8]
	mov r0, r4
	bl putint
	ldr r4, =10
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putch
	b .L53
.L53:
	ldr r4, [fp, #-12]
	ldr r5, =1
	mov r5, r5
	add  r5, r5, r4
	str r5, [fp, #-12]
	b .L48

