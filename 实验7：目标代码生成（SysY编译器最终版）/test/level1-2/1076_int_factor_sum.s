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
	.global factor
	.type factor , %function
factor:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub  sp, sp, #12
.L32:
	str r0, [fp, #-12]
	ldr r4, =0
	str r4, [fp, #-4]
	ldr r4, =1
	str r4, [fp, #-8]
	b .L37
.L37:
	ldr r4, [fp, #-12]
	ldr r5, =1
	mov r5, r5
	add  r5, r5, r4
	ldr r4, [fp, #-8]
	cmp r5, r4
	bgt .L38
	b .L39
.L38:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-8]
	sdiv  r6, r4, r5
	mul  r6, r6, r5
	sub  r5, r4, r6
	ldr r4, =0
	cmp r4, r5
	beq .L41
	b .L42
.L39:
	ldr r4, [fp, #-4]
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, fp, lr}
	bx lr
.L41:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-8]
	mov r5, r5
	add  r5, r5, r4
	str r5, [fp, #-4]
	b .L42
.L42:
	ldr r4, [fp, #-8]
	ldr r5, =1
	mov r5, r5
	add  r5, r5, r4
	str r5, [fp, #-8]
	b .L37

	.global main
	.type main , %function
main:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub  sp, sp, #12
.L44:
	ldr r4, =4
	ldr r5, addr_N
	str r4, [r5]
	ldr r4, =10
	ldr r5, addr_newline
	str r4, [r5]
	mov r4, #1478
	add  r4, r4, #0
	str r4, [fp, #-8]
	ldr r4, [fp, #-8]
	mov r0, r4
	bl factor
	mov r4, r0
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, fp, lr}
	bx lr

addr_N:
	.word N
addr_newline:
	.word newline
