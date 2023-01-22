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
	.global counting_sort
	.type counting_sort , %function
counting_sort:
	push {r4, r5, r6, r7, r8, r9, fp, lr}
	mov fp, sp
	sub  sp, sp, #64
.L105:
	str r0, [fp, #-64]
	str r1, [fp, #-60]
	str r2, [fp, #-56]
	ldr r4, =0
	str r4, [fp, #-4]
	ldr r4, =0
	str r4, [fp, #-12]
	ldr r4, =0
	str r4, [fp, #-8]
	b .L116
.L116:
	ldr r4, [fp, #-4]
	ldr r5, =10
	cmp r5, r4
	bgt .L117
	b .L118
.L117:
	ldr r4, [fp, #-4]
	mov r5, #-52
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =0
	str r4, [r5]
	ldr r4, [fp, #-4]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-4]
	b .L116
.L118:
	b .L120
.L120:
	ldr r4, [fp, #-56]
	ldr r5, [fp, #-12]
	cmp r4, r5
	bgt .L121
	b .L122
.L121:
	ldr r4, [fp, #-64]
	ldr r5, [fp, #-12]
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	mov r5, #-52
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, [r5]
	ldr r5, =1
	add  r6, r5, r4
	ldr r4, [fp, #-64]
	ldr r5, [fp, #-12]
	mov r7, #4
	mul  r8, r5, r7
	add  r5, r4, r8
	ldr r4, [r5]
	mov r5, #-52
	mov r7, #4
	mul  r8, r4, r7
	add  r4, r5, r8
	add  r5, fp, r4
	str r6, [r5]
	ldr r4, [fp, #-12]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-12]
	b .L120
.L122:
	ldr r4, =1
	str r4, [fp, #-4]
	b .L129
.L129:
	ldr r4, [fp, #-4]
	ldr r5, =10
	cmp r5, r4
	bgt .L130
	b .L131
.L130:
	ldr r4, [fp, #-4]
	mov r5, #-52
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, [r5]
	ldr r5, [fp, #-4]
	sub  r6, r5, #1
	mov r5, #-52
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r5, r8
	add  r5, fp, r6
	ldr r6, [r5]
	add  r5, r6, r4
	ldr r4, [fp, #-4]
	mov r6, #-52
	mov r7, #4
	mul  r8, r4, r7
	add  r4, r6, r8
	add  r6, fp, r4
	str r5, [r6]
	ldr r4, [fp, #-4]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-4]
	b .L129
.L131:
	ldr r4, [fp, #-56]
	str r4, [fp, #-8]
	b .L135
.L135:
	ldr r4, [fp, #-8]
	ldr r5, =0
	cmp r5, r4
	blt .L136
	b .L137
.L136:
	ldr r4, [fp, #-64]
	ldr r5, [fp, #-8]
	sub  r6, r5, #1
	mov r5, #4
	mul  r7, r6, r5
	add  r5, r4, r7
	ldr r4, [r5]
	mov r5, #-52
	mov r7, #4
	mul  r6, r4, r7
	add  r4, r5, r6
	add  r5, fp, r4
	ldr r4, [r5]
	sub  r5, r4, #1
	ldr r4, [fp, #-64]
	ldr r6, [fp, #-8]
	sub  r7, r6, #1
	mov r6, #4
	mul  r8, r7, r6
	add  r6, r4, r8
	ldr r4, [r6]
	mov r6, #-52
	mov r7, #4
	mul  r8, r4, r7
	add  r4, r6, r8
	add  r6, fp, r4
	str r5, [r6]
	ldr r4, [fp, #-64]
	ldr r5, [fp, #-8]
	sub  r6, r5, #1
	mov r5, #4
	mul  r7, r6, r5
	add  r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-60]
	ldr r6, [fp, #-64]
	ldr r7, [fp, #-8]
	sub  r8, r7, #1
	mov r7, #4
	mul  r9, r8, r7
	add  r7, r6, r9
	ldr r6, [r7]
	mov r7, #-52
	mov r8, #4
	mul  r9, r6, r8
	add  r6, r7, r9
	add  r7, fp, r6
	ldr r6, [r7]
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r5, r8
	str r4, [r6]
	ldr r4, [fp, #-8]
	sub  r5, r4, #1
	str r5, [fp, #-8]
	b .L135
.L137:
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, r9, fp, lr}
	bx lr

	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub  sp, sp, #88
.L150:
	ldr r4, =10
	ldr r5, addr_n
	str r4, [r5]
	mov r4, #0
	mov r5, #-88
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =4
	str r4, [r5]
	mov r4, #1
	mov r5, #-88
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =3
	str r4, [r5]
	mov r4, #2
	mov r5, #-88
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =9
	str r4, [r5]
	mov r4, #3
	mov r5, #-88
	mov r7, #4
	mul  r6, r4, r7
	add  r4, r5, r6
	add  r5, fp, r4
	ldr r4, =2
	str r4, [r5]
	mov r4, #4
	mov r5, #-88
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =0
	str r4, [r5]
	mov r4, #5
	mov r5, #-88
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =1
	str r4, [r5]
	mov r4, #6
	mov r5, #-88
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =6
	str r4, [r5]
	mov r4, #7
	mov r5, #-88
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =5
	str r4, [r5]
	mov r4, #8
	mov r5, #-88
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =7
	str r4, [r5]
	mov r4, #9
	mov r5, #-88
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =8
	str r4, [r5]
	ldr r4, =0
	str r4, [fp, #-48]
	mov r4, #0
	mov r5, #-88
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	mov r4, #0
	mov r6, #-44
	mov r7, #4
	mul  r8, r4, r7
	add  r4, r6, r8
	add  r6, fp, r4
	ldr r4, addr_n
	ldr r7, [r4]
	mov r0, r5
	mov r1, r6
	mov r2, r7
	bl counting_sort
	mov r4, r0
	str r4, [fp, #-48]
	b .L154
.L154:
	ldr r4, addr_n
	ldr r5, [r4]
	ldr r4, [fp, #-48]
	cmp r5, r4
	bgt .L155
	b .L156
.L155:
	ldr r4, [fp, #-48]
	mov r5, #-44
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
	ldr r4, [fp, #-48]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-48]
	b .L154
.L156:
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

addr_n:
	.word n
