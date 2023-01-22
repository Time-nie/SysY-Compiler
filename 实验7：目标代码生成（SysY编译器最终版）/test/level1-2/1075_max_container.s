	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.text
	.global maxArea
	.type maxArea , %function
maxArea:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub  sp, sp, #24
.L71:
	str r0, [fp, #-24]
	str r1, [fp, #-20]
	ldr r4, =0
	str r4, [fp, #-16]
	ldr r4, [fp, #-20]
	add  r4, r4, #1
	sub  r4, r4, #1
	sub  r5, r4, #1
	str r5, [fp, #-12]
	ldr r4, =0
	add  r4, r4, #1
	sub  r4, r4, #1
	sub  r5, r4, #1
	str r5, [fp, #-8]
	b .L79
.L79:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-16]
	cmp r4, r5
	bgt .L80
	b .L81
.L80:
	ldr r4, [fp, #-24]
	ldr r5, [fp, #-12]
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-24]
	ldr r6, [fp, #-16]
	mov r8, #4
	mul  r7, r6, r8
	add  r6, r5, r7
	ldr r5, [r6]
	cmp r4, r5
	bgt .L84
	b .L85
.L81:
	ldr r4, [fp, #-8]
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L84:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-16]
	add  r4, r4, r5
	sub  r4, r4, r5
	sub  r6, r4, r5
	ldr r4, [fp, #-24]
	ldr r5, [fp, #-16]
	mov r7, #4
	mul  r8, r5, r7
	add  r5, r4, r8
	ldr r4, [r5]
	mul  r5, r4, r6
	str r5, [fp, #-4]
	b .L86
.L85:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-16]
	add  r4, r4, r5
	sub  r4, r4, r5
	sub  r6, r4, r5
	ldr r4, [fp, #-24]
	ldr r5, [fp, #-12]
	mov r7, #4
	mul  r8, r5, r7
	add  r5, r4, r8
	ldr r4, [r5]
	mul  r5, r4, r6
	str r5, [fp, #-4]
	b .L86
.L86:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	cmp r4, r5
	blt .L96
	b .L97
.L96:
	ldr r4, [fp, #-4]
	str r4, [fp, #-8]
	b .L97
.L97:
	ldr r4, [fp, #-24]
	ldr r5, [fp, #-12]
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-24]
	ldr r6, [fp, #-16]
	mov r8, #4
	mul  r7, r6, r8
	add  r6, r5, r7
	ldr r5, [r6]
	cmp r4, r5
	blt .L99
	b .L100
.L99:
	ldr r4, [fp, #-12]
	add  r4, r4, #1
	sub  r4, r4, #1
	sub  r5, r4, #1
	str r5, [fp, #-12]
	b .L101
.L100:
	ldr r4, [fp, #-16]
	ldr r5, =1
	mov r5, r5
	add  r5, r5, r4
	str r5, [fp, #-16]
	b .L101
.L101:
	b .L79

	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub  sp, sp, #44
.L107:
	mov r4, #0
	mov r5, #-40
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =3
	str r4, [r5]
	mov r4, #1
	mov r5, #-40
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =3
	str r4, [r5]
	mov r4, #2
	mov r5, #-40
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =9
	str r4, [r5]
	mov r4, #3
	mov r5, #-40
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =0
	str r4, [r5]
	mov r4, #4
	mov r5, #-40
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =0
	str r4, [r5]
	mov r4, #5
	mov r5, #-40
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =1
	str r4, [r5]
	mov r4, #6
	mov r5, #-40
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =1
	str r4, [r5]
	mov r4, #7
	mov r5, #-40
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =5
	str r4, [r5]
	mov r4, #8
	mov r5, #-40
	mov r7, #4
	mul  r6, r4, r7
	add  r4, r5, r6
	add  r5, fp, r4
	ldr r4, =7
	str r4, [r5]
	mov r4, #9
	mov r5, #-40
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =8
	str r4, [r5]
	ldr r4, =10
	str r4, [fp, #-44]
	mov r4, #0
	mov r5, #-40
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, [fp, #-44]
	mov r0, r5
	mov r1, r4
	bl maxArea
	mov r4, r0
	str r4, [fp, #-44]
	ldr r4, [fp, #-44]
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

