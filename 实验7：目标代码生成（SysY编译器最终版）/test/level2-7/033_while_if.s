	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.text
	.global get_one
	.type get_one , %function
get_one:
	push {fp, lr}
	mov fp, sp
	sub  sp, sp, #4
.L38:
	str r0, [fp, #-4]
	mov r0, #1
	sub  sp, fp, #0
	pop {fp, lr}
	bx lr

	.global deepWhileBr
	.type deepWhileBr , %function
deepWhileBr:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub  sp, sp, #20
.L41:
	str r0, [fp, #-20]
	str r1, [fp, #-16]
	ldr r4, [fp, #-20]
	ldr r5, [fp, #-16]
	add  r6, r5, r4
	str r6, [fp, #-12]
	b .L47
.L47:
	ldr r4, [fp, #-12]
	ldr r5, =75
	cmp r5, r4
	bgt .L48
	b .L49
.L48:
	ldr r4, =42
	str r4, [fp, #-8]
	ldr r4, [fp, #-12]
	ldr r5, =100
	cmp r5, r4
	bgt .L52
	b .L53
.L49:
	ldr r4, [fp, #-12]
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, fp, lr}
	bx lr
.L52:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-8]
	add  r6, r5, r4
	str r6, [fp, #-12]
	ldr r4, [fp, #-12]
	ldr r5, =99
	cmp r5, r4
	blt .L55
	b .L56
.L53:
	b .L47
.L55:
	ldr r4, [fp, #-8]
	ldr r5, =2
	mul  r6, r5, r4
	str r6, [fp, #-4]
	mov r0, #0
	bl get_one
	mov r4, r0
	ldr r5, =1
	cmp r5, r4
	beq .L59
	b .L60
.L56:
	b .L53
.L59:
	ldr r4, [fp, #-4]
	ldr r5, =2
	mul  r6, r5, r4
	str r6, [fp, #-12]
	b .L60
.L60:
	b .L56

	.global main
	.type main , %function
main:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub  sp, sp, #4
.L62:
	ldr r4, =2
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-4]
	mov r0, r4
	mov r1, r5
	bl deepWhileBr
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putint
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, fp, lr}
	bx lr

