	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.text
	.global exgcd
	.type exgcd , %function
exgcd:
	push {r4, r5, r6, r7, r8, r9, fp, lr}
	mov fp, sp
	sub  sp, sp, #24
.L51:
	str r0, [fp, #-24]
	str r1, [fp, #-20]
	str r2, [fp, #-16]
	str r3, [fp, #-12]
	ldr r4, [fp, #-20]
	ldr r5, =0
	cmp r5, r4
	beq .L60
	b .L61
.L60:
	ldr r4, [fp, #-16]
	mov r5, #0
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, =1
	str r4, [r5]
	ldr r4, [fp, #-12]
	mov r5, #0
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, =0
	str r4, [r5]
	ldr r4, [fp, #-24]
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, r9, fp, lr}
	bx lr
	b .L62
.L61:
	ldr r4, [fp, #-20]
	ldr r5, [fp, #-24]
	ldr r6, [fp, #-20]
	sdiv  r7, r5, r6
	mul  r7, r7, r6
	sub  r6, r5, r7
	ldr r5, [fp, #-16]
	ldr r7, [fp, #-12]
	mov r0, r4
	mov r1, r6
	mov r2, r5
	mov r3, r7
	bl exgcd
	mov r4, r0
	str r4, [fp, #-8]
	ldr r4, [fp, #-16]
	mov r5, #0
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	str r4, [fp, #-4]
	ldr r4, [fp, #-12]
	mov r5, #0
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-16]
	mov r6, #0
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r5, r8
	str r4, [r6]
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-24]
	ldr r6, [fp, #-20]
	sdiv  r7, r5, r6
	ldr r5, [fp, #-12]
	mov r6, #0
	mov r8, #4
	mul  r9, r6, r8
	add  r6, r5, r9
	ldr r5, [r6]
	mul  r6, r5, r7
	sub  r5, r4, r6
	ldr r4, [fp, #-12]
	mov r6, #0
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r4, r8
	str r5, [r6]
	ldr r4, [fp, #-8]
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, r9, fp, lr}
	bx lr
	b .L62
.L62:
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, r9, fp, lr}
	bx lr

	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov fp, sp
	sub  sp, sp, #16
.L78:
	ldr r4, =7
	str r4, [fp, #-16]
	ldr r4, =15
	str r4, [fp, #-12]
	mov r4, #0
	mov r5, #-8
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =1
	str r4, [r5]
	mov r4, #0
	mov r5, #-4
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =1
	str r4, [r5]
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-12]
	mov r6, #0
	mov r7, #-8
	mov r8, #4
	mul  r9, r6, r8
	add  r6, r7, r9
	add  r7, fp, r6
	mov r6, #0
	mov r8, #-4
	mov r9, #4
	mul  r10, r6, r9
	add  r6, r8, r10
	add  r8, fp, r6
	mov r0, r4
	mov r1, r5
	mov r2, r7
	mov r3, r8
	bl exgcd
	mov r4, r0
	mov r4, #0
	mov r5, #-8
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, [r5]
	ldr r5, [fp, #-12]
	sdiv  r6, r4, r5
	mul  r6, r6, r5
	sub  r5, r4, r6
	ldr r4, [fp, #-12]
	add  r6, r4, r5
	ldr r4, [fp, #-12]
	sdiv  r5, r6, r4
	mul  r5, r5, r4
	sub  r4, r6, r5
	mov r5, #0
	mov r6, #-8
	mov r7, #4
	mul  r8, r5, r7
	add  r5, r6, r8
	add  r6, fp, r5
	str r4, [r6]
	mov r4, #0
	mov r5, #-8
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, [r5]
	mov r0, r4
	bl putint
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr

