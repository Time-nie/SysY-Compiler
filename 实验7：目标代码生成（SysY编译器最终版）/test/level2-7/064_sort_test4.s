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
	.global select_sort
	.type select_sort , %function
select_sort:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub  sp, sp, #24
.L79:
	str r0, [fp, #-24]
	str r1, [fp, #-20]
	ldr r4, =0
	str r4, [fp, #-16]
	b .L87
.L87:
	ldr r4, [fp, #-20]
	sub  r5, r4, #1
	ldr r4, [fp, #-16]
	cmp r5, r4
	bgt .L88
	b .L89
.L88:
	ldr r4, [fp, #-16]
	str r4, [fp, #-8]
	ldr r4, [fp, #-16]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-12]
	b .L91
.L89:
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L91:
	ldr r4, [fp, #-20]
	ldr r5, [fp, #-12]
	cmp r4, r5
	bgt .L92
	b .L93
.L92:
	ldr r4, [fp, #-24]
	ldr r5, [fp, #-12]
	mov r7, #4
	mul  r6, r5, r7
	add  r5, r4, r6
	ldr r4, [r5]
	ldr r5, [fp, #-24]
	ldr r6, [fp, #-8]
	mov r8, #4
	mul  r7, r6, r8
	add  r6, r5, r7
	ldr r5, [r6]
	cmp r4, r5
	blt .L95
	b .L96
.L93:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-8]
	cmp r4, r5
	bne .L102
	b .L103
.L95:
	ldr r4, [fp, #-12]
	str r4, [fp, #-8]
	b .L96
.L96:
	ldr r4, [fp, #-12]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-12]
	b .L91
.L102:
	ldr r4, [fp, #-24]
	ldr r5, [fp, #-8]
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	str r4, [fp, #-4]
	ldr r4, [fp, #-24]
	ldr r5, [fp, #-16]
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-24]
	ldr r6, [fp, #-8]
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r5, r8
	str r4, [r6]
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-24]
	ldr r6, [fp, #-16]
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r5, r8
	str r4, [r6]
	b .L103
.L103:
	ldr r4, [fp, #-16]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-16]
	b .L87

	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub  sp, sp, #48
.L112:
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
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
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
	ldr r4, =0
	str r4, [fp, #-8]
	mov r4, #0
	mov r5, #-48
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, addr_n
	ldr r6, [r4]
	mov r0, r5
	mov r1, r6
	bl select_sort
	mov r4, r0
	str r4, [fp, #-8]
	b .L115
.L115:
	ldr r4, addr_n
	ldr r5, [r4]
	ldr r4, [fp, #-8]
	cmp r5, r4
	bgt .L116
	b .L117
.L116:
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
	b .L115
.L117:
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

addr_n:
	.word n
