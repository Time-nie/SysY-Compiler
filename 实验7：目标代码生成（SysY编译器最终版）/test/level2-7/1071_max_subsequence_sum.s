	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.text
	.global maxSubArray
	.type maxSubArray , %function
maxSubArray:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub  sp, sp, #20
.L58:
	str r0, [fp, #-20]
	str r1, [fp, #-16]
	ldr r4, [fp, #-16]
	ldr r5, =0
	cmp r5, r4
	beq .L63
	b .L64
.L63:
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
	b .L64
.L64:
	ldr r4, [fp, #-16]
	ldr r5, =1
	cmp r5, r4
	beq .L66
	b .L67
.L66:
	ldr r4, [fp, #-20]
	mov r5, #0
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
	b .L67
.L67:
	ldr r4, [fp, #-20]
	mov r5, #0
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	str r4, [fp, #-12]
	ldr r4, [fp, #-12]
	str r4, [fp, #-8]
	ldr r4, =1
	str r4, [fp, #-4]
	b .L76
.L76:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-4]
	cmp r4, r5
	bgt .L77
	b .L78
.L77:
	ldr r4, [fp, #-12]
	ldr r5, =0
	cmp r5, r4
	bgt .L80
	b .L81
.L78:
	ldr r4, [fp, #-8]
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L80:
	ldr r4, =0
	str r4, [fp, #-12]
	b .L81
.L81:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-20]
	ldr r6, [fp, #-4]
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r5, r8
	ldr r5, [r6]
	add  r6, r5, r4
	str r6, [fp, #-12]
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-8]
	cmp r4, r5
	bgt .L85
	b .L86
.L85:
	ldr r4, [fp, #-12]
	str r4, [fp, #-8]
	b .L86
.L86:
	ldr r4, [fp, #-4]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-4]
	b .L76

	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub  sp, sp, #44
.L88:
	ldr r4, =0
	sub  r5, r4, #4
	mov r4, #0
	mov r6, #-40
	mov r7, #4
	mul  r8, r4, r7
	add  r4, r6, r8
	add  r6, fp, r4
	str r5, [r6]
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
	ldr r4, =0
	sub  r5, r4, #2
	mov r4, #3
	mov r6, #-40
	mov r7, #4
	mul  r8, r4, r7
	add  r4, r6, r8
	add  r6, fp, r4
	str r5, [r6]
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
	mov r7, #4
	mul  r6, r4, r7
	add  r4, r5, r6
	add  r5, fp, r4
	ldr r4, =1
	str r4, [r5]
	ldr r4, =0
	sub  r5, r4, #6
	mov r4, #6
	mov r6, #-40
	mov r8, #4
	mul  r7, r4, r8
	add  r4, r6, r7
	add  r6, fp, r4
	str r5, [r6]
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
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
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
	bl maxSubArray
	mov r4, r0
	str r4, [fp, #-44]
	ldr r4, [fp, #-44]
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

