	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global N
	.align 4
	.size N, 4
N:
	.word -1
	.global arr
	.align 4
	.size arr, 24
arr:
	.word 1
	.word 2
	.word 33
	.word 4
	.word 5
	.word 6
	.text
	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub  sp, sp, #8
.L22:
	ldr r4, =0
	str r4, [fp, #-8]
	ldr r4, =0
	str r4, [fp, #-4]
	b .L25
.L25:
	ldr r4, [fp, #-8]
	ldr r5, =6
	cmp r5, r4
	bgt .L26
	b .L27
.L26:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-8]
	ldr r6, addr_arr
	mov r7, #4
	mul  r8, r5, r7
	add  r5, r6, r8
	mov r6, r5
	ldr r5, [r6]
	add  r6, r5, r4
	str r6, [fp, #-4]
	ldr r4, [fp, #-8]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-8]
	b .L25
.L27:
	ldr r4, [fp, #-4]
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

addr_N:
	.word N
addr_arr:
	.word arr
