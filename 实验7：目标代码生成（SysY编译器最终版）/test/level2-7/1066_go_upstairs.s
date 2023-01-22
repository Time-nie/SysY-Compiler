	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.text
	.global climbStairs
	.type climbStairs , %function
climbStairs:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub  sp, sp, #48
.L36:
	str r0, [fp, #-48]
	ldr r4, [fp, #-48]
	ldr r5, =4
	cmp r5, r4
	bgt .L39
	b .L40
.L39:
	ldr r4, [fp, #-48]
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
	b .L40
.L40:
	mov r4, #0
	mov r5, #-44
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =0
	str r4, [r5]
	mov r4, #1
	mov r5, #-44
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =1
	str r4, [r5]
	mov r4, #2
	mov r5, #-44
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =2
	str r4, [r5]
	ldr r4, =3
	str r4, [fp, #-4]
	b .L44
.L44:
	ldr r4, [fp, #-48]
	ldr r5, =1
	add  r6, r5, r4
	ldr r4, [fp, #-4]
	cmp r6, r4
	bgt .L45
	b .L46
.L45:
	ldr r4, [fp, #-4]
	sub  r5, r4, #1
	mov r4, #-44
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	add  r4, fp, r5
	ldr r5, [r4]
	ldr r4, [fp, #-4]
	sub  r6, r4, #2
	mov r4, #-44
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r4, r8
	add  r4, fp, r6
	ldr r6, [r4]
	add  r4, r6, r5
	ldr r5, [fp, #-4]
	mov r6, #-44
	mov r7, #4
	mul  r8, r5, r7
	add  r5, r6, r8
	add  r6, fp, r5
	str r4, [r6]
	ldr r4, [fp, #-4]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-4]
	b .L44
.L46:
	ldr r4, [fp, #-48]
	mov r5, #-44
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, [r5]
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

	.global main
	.type main , %function
main:
	push {r4, fp, lr}
	mov fp, sp
	sub  sp, sp, #8
.L51:
	ldr r4, =5
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl climbStairs
	mov r4, r0
	str r4, [fp, #-8]
	ldr r4, [fp, #-8]
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, fp, lr}
	bx lr

