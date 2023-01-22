	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global k
	.align 4
	.size k, 4
k:
	.word 0
	.global n
	.align 4
	.size n, 4
n:
	.word 10
	.text
	.global main
	.type main , %function
main:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub  sp, sp, #4
.L20:
	ldr r4, =0
	str r4, [fp, #-4]
	ldr r4, =1
	ldr r5, addr_k
	str r4, [r5]
	b .L22
.L22:
	ldr r4, addr_n
	ldr r5, [r4]
	sub  r4, r5, #1
	ldr r5, [fp, #-4]
	cmp r4, r5
	bge .L23
	b .L24
.L23:
	ldr r4, [fp, #-4]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-4]
	ldr r4, addr_k
	ldr r5, [r4]
	ldr r4, =1
	add  r6, r4, r5
	ldr r4, addr_k
	ldr r5, [r4]
	ldr r4, addr_k
	ldr r6, [r4]
	add  r4, r6, r5
	ldr r5, addr_k
	str r4, [r5]
	b .L22
.L24:
	ldr r4, addr_k
	ldr r5, [r4]
	mov r0, r5
	bl putint
	ldr r4, addr_k
	ldr r5, [r4]
	mov r0, r5
	sub  sp, fp, #0
	pop {r4, r5, r6, fp, lr}
	bx lr

addr_k:
	.word k
addr_n:
	.word n
