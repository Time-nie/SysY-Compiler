	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.text
	.global deepWhileBr
	.type deepWhileBr , %function
deepWhileBr:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub  sp, sp, #20
.L34:
	str r0, [fp, #-20]
	str r1, [fp, #-16]
	ldr r4, [fp, #-20]
	ldr r5, [fp, #-16]
	add  r6, r5, r4
	str r6, [fp, #-12]
	b .L40
.L40:
	ldr r4, [fp, #-12]
	ldr r5, =75
	cmp r5, r4
	bgt .L41
	b .L42
.L41:
	ldr r4, =42
	str r4, [fp, #-8]
	ldr r4, [fp, #-12]
	ldr r5, =100
	cmp r5, r4
	bgt .L45
	b .L46
.L42:
	ldr r4, [fp, #-12]
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, fp, lr}
	bx lr
.L45:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-8]
	add  r6, r5, r4
	str r6, [fp, #-12]
	ldr r4, [fp, #-12]
	ldr r5, =99
	cmp r5, r4
	blt .L48
	b .L49
.L46:
	b .L40
.L48:
	ldr r4, [fp, #-8]
	ldr r5, =2
	mul  r6, r5, r4
	str r6, [fp, #-4]
	ldr r4, =1
	ldr r5, =1
	cmp r4, r5
	beq .L52
	b .L53
.L49:
	b .L46
.L52:
	ldr r4, [fp, #-4]
	ldr r5, =2
	mul  r6, r5, r4
	str r6, [fp, #-12]
	b .L53
.L53:
	b .L49

	.global main
	.type main , %function
main:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub  sp, sp, #4
.L55:
	ldr r4, =2
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-4]
	mov r0, r4
	mov r1, r5
	bl deepWhileBr
	mov r4, r0
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, fp, lr}
	bx lr

