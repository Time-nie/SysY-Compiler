	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global N
	.align 4
	.size N, 4
N:
	.word 0
	.global newline
	.align 4
	.size newline, 4
newline:
	.word 0
	.text
	.global split
	.type split , %function
split:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub  sp, sp, #12
.L45:
	str r0, [fp, #-12]
	str r1, [fp, #-8]
	ldr r4, addr_N
	ldr r5, [r4]
	sub  r4, r5, #1
	str r4, [fp, #-4]
	b .L51
.L51:
	ldr r4, =0
	sub  r5, r4, #1
	ldr r4, [fp, #-4]
	cmp r5, r4
	bne .L52
	b .L53
.L52:
	ldr r4, [fp, #-12]
	ldr r5, =10
	sdiv  r6, r4, r5
	mul  r5, r6, r5
	sub  r6, r4, r5
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	mov r7, #4
	mul  r8, r5, r7
	add  r5, r4, r8
	str r6, [r5]
	ldr r4, [fp, #-12]
	ldr r5, =10
	sdiv  r6, r4, r5
	str r6, [fp, #-12]
	ldr r4, [fp, #-4]
	sub  r5, r4, #1
	str r5, [fp, #-4]
	b .L51
.L53:
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub  sp, sp, #28
.L56:
	ldr r4, =4
	ldr r5, addr_N
	str r4, [r5]
	ldr r4, =10
	ldr r5, addr_newline
	str r4, [r5]
	mov r4, #1478
	add  r4, r4, #0
	str r4, [fp, #-24]
	ldr r4, [fp, #-24]
	mov r5, #0
	mov r6, #-20
	mov r7, #4
	mul  r8, r5, r7
	add  r5, r6, r8
	add  r6, fp, r5
	mov r0, r4
	mov r1, r6
	bl split
	mov r4, r0
	str r4, [fp, #-24]
	ldr r4, =0
	str r4, [fp, #-28]
	b .L61
.L61:
	ldr r4, [fp, #-28]
	ldr r5, =4
	cmp r5, r4
	bgt .L62
	b .L63
.L62:
	ldr r4, [fp, #-28]
	mov r5, #-20
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, [r5]
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putint
	ldr r4, addr_newline
	ldr r5, [r4]
	mov r0, r5
	bl putch
	ldr r4, [fp, #-28]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-28]
	b .L61
.L63:
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

addr_N:
	.word N
addr_newline:
	.word newline
