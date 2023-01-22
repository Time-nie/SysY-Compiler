	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global k
	.align 4
	.size k, 4
k:
	.word 0
	.text
	.global main
	.type main , %function
main:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub  sp, sp, #16
.L32:
	ldr r4, =3389
	ldr r5, addr_k
	str r4, [r5]
	ldr r4, addr_k
	ldr r5, [r4]
	ldr r4, =10000
	cmp r4, r5
	bgt .L33
	b .L34
.L33:
	ldr r4, addr_k
	ldr r5, [r4]
	ldr r4, =1
	mov r4, r4
	add  r4, r4, r5
	ldr r5, addr_k
	str r4, [r5]
	ldr r4, =112
	str r4, [fp, #-16]
	b .L37
.L34:
	ldr r4, addr_k
	ldr r5, [r4]
	mov r0, r5
	sub  sp, fp, #0
	pop {r4, r5, r6, fp, lr}
	bx lr
.L37:
	ldr r4, [fp, #-16]
	ldr r5, =10
	cmp r5, r4
	blt .L38
	b .L39
.L38:
	ldr r4, [fp, #-16]
	add  r4, r4, #88
	sub  r4, r4, #88
	sub  r5, r4, #88
	str r5, [fp, #-16]
	ldr r4, [fp, #-16]
	ldr r5, =1000
	cmp r5, r4
	bgt .L41
	b .L42
.L39:
	ldr r4, [fp, #-16]
	mov r0, r4
	bl putint
	b .L34
.L41:
	ldr r4, =9
	str r4, [fp, #-12]
	ldr r4, =11
	str r4, [fp, #-8]
	ldr r4, =10
	str r4, [fp, #-12]
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-12]
	add  r4, r4, r5
	sub  r4, r4, r5
	sub  r6, r4, r5
	str r6, [fp, #-16]
	ldr r4, =11
	str r4, [fp, #-4]
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-4]
	mov r5, r5
	add  r5, r5, r4
	ldr r4, [fp, #-8]
	mov r4, r4
	add  r4, r4, r5
	str r4, [fp, #-16]
	b .L42
.L42:
	b .L37

addr_k:
	.word k
