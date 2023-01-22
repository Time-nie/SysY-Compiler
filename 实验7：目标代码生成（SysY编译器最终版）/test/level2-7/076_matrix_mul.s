	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global M
	.align 4
	.size M, 4
M:
	.word 0
	.global L
	.align 4
	.size L, 4
L:
	.word 0
	.global N
	.align 4
	.size N, 4
N:
	.word 0
	.text
	.global mul
	.type mul , %function
mul:
	push {r4, r5, r6, r7, r8, r9, fp, lr}
	mov fp, sp
	sub  sp, sp, #40
.L220:
	str r0, [fp, #-40]
	str r1, [fp, #-36]
	str r2, [fp, #-32]
	str r3, [fp, #-28]
	ldr r4, [fp, #32]
	str r4, [fp, #-24]
	ldr r4, [fp, #36]
	str r4, [fp, #-20]
	ldr r4, [fp, #40]
	str r4, [fp, #-16]
	ldr r4, [fp, #44]
	str r4, [fp, #-12]
	ldr r4, [fp, #48]
	str r4, [fp, #-8]
	ldr r4, =0
	str r4, [fp, #-4]
	ldr r4, [fp, #-40]
	mov r5, #0
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-28]
	mov r6, #0
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r5, r8
	ldr r5, [r6]
	mul  r6, r5, r4
	ldr r4, [fp, #-40]
	mov r5, #1
	mov r7, #4
	mul  r8, r5, r7
	add  r5, r4, r8
	ldr r4, [r5]
	ldr r5, [fp, #-24]
	mov r7, #0
	mov r9, #4
	mul  r8, r7, r9
	add  r7, r5, r8
	ldr r5, [r7]
	mul  r7, r5, r4
	add  r4, r7, r6
	ldr r5, [fp, #-40]
	mov r6, #2
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r5, r8
	ldr r5, [r6]
	ldr r6, [fp, #-20]
	mov r7, #0
	mov r8, #4
	mul  r9, r7, r8
	add  r7, r6, r9
	ldr r6, [r7]
	mul  r7, r6, r5
	add  r5, r7, r4
	ldr r4, [fp, #-16]
	mov r6, #0
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r4, r8
	str r5, [r6]
	ldr r4, [fp, #-40]
	mov r5, #0
	mov r7, #4
	mul  r6, r5, r7
	add  r5, r4, r6
	ldr r4, [r5]
	ldr r5, [fp, #-28]
	mov r6, #1
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r5, r8
	ldr r5, [r6]
	mul  r6, r5, r4
	ldr r4, [fp, #-40]
	mov r5, #1
	mov r7, #4
	mul  r8, r5, r7
	add  r5, r4, r8
	ldr r4, [r5]
	ldr r5, [fp, #-24]
	mov r7, #1
	mov r8, #4
	mul  r9, r7, r8
	add  r7, r5, r9
	ldr r5, [r7]
	mul  r7, r5, r4
	add  r4, r7, r6
	ldr r5, [fp, #-40]
	mov r6, #2
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r5, r8
	ldr r5, [r6]
	ldr r6, [fp, #-20]
	mov r7, #1
	mov r8, #4
	mul  r9, r7, r8
	add  r7, r6, r9
	ldr r6, [r7]
	mul  r7, r6, r5
	add  r5, r7, r4
	ldr r4, [fp, #-16]
	mov r6, #1
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r4, r8
	str r5, [r6]
	ldr r4, [fp, #-40]
	mov r5, #0
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-28]
	mov r6, #2
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r5, r8
	ldr r5, [r6]
	mul  r6, r5, r4
	ldr r4, [fp, #-40]
	mov r5, #1
	mov r7, #4
	mul  r8, r5, r7
	add  r5, r4, r8
	ldr r4, [r5]
	ldr r5, [fp, #-24]
	mov r7, #2
	mov r9, #4
	mul  r8, r7, r9
	add  r7, r5, r8
	ldr r5, [r7]
	mul  r7, r5, r4
	add  r4, r7, r6
	ldr r5, [fp, #-40]
	mov r6, #2
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r5, r8
	ldr r5, [r6]
	ldr r6, [fp, #-20]
	mov r7, #2
	mov r9, #4
	mul  r8, r7, r9
	add  r7, r6, r8
	ldr r6, [r7]
	mul  r7, r6, r5
	add  r5, r7, r4
	ldr r4, [fp, #-16]
	mov r6, #2
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r4, r8
	str r5, [r6]
	ldr r4, [fp, #-36]
	mov r5, #0
	mov r7, #4
	mul  r6, r5, r7
	add  r5, r4, r6
	ldr r4, [r5]
	ldr r5, [fp, #-28]
	mov r6, #0
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r5, r8
	ldr r5, [r6]
	mul  r6, r5, r4
	ldr r4, [fp, #-36]
	mov r5, #1
	mov r8, #4
	mul  r7, r5, r8
	add  r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-24]
	mov r7, #0
	mov r8, #4
	mul  r9, r7, r8
	add  r7, r5, r9
	ldr r5, [r7]
	mul  r7, r5, r4
	add  r4, r7, r6
	ldr r5, [fp, #-36]
	mov r6, #2
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r5, r8
	ldr r5, [r6]
	ldr r6, [fp, #-20]
	mov r7, #0
	mov r8, #4
	mul  r9, r7, r8
	add  r7, r6, r9
	ldr r6, [r7]
	mul  r7, r6, r5
	add  r5, r7, r4
	ldr r4, [fp, #-12]
	mov r6, #0
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r4, r8
	str r5, [r6]
	ldr r4, [fp, #-36]
	mov r5, #0
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-28]
	mov r6, #1
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r5, r8
	ldr r5, [r6]
	mul  r6, r5, r4
	ldr r4, [fp, #-36]
	mov r5, #1
	mov r8, #4
	mul  r7, r5, r8
	add  r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-24]
	mov r7, #1
	mov r8, #4
	mul  r9, r7, r8
	add  r7, r5, r9
	ldr r5, [r7]
	mul  r7, r5, r4
	add  r4, r7, r6
	ldr r5, [fp, #-36]
	mov r6, #2
	mov r8, #4
	mul  r7, r6, r8
	add  r6, r5, r7
	ldr r5, [r6]
	ldr r6, [fp, #-20]
	mov r7, #1
	mov r8, #4
	mul  r9, r7, r8
	add  r7, r6, r9
	ldr r6, [r7]
	mul  r7, r6, r5
	add  r5, r7, r4
	ldr r4, [fp, #-12]
	mov r6, #1
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r4, r8
	str r5, [r6]
	ldr r4, [fp, #-36]
	mov r5, #0
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-28]
	mov r6, #2
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r5, r8
	ldr r5, [r6]
	mul  r6, r5, r4
	ldr r4, [fp, #-36]
	mov r5, #1
	mov r7, #4
	mul  r8, r5, r7
	add  r5, r4, r8
	ldr r4, [r5]
	ldr r5, [fp, #-24]
	mov r7, #2
	mov r8, #4
	mul  r9, r7, r8
	add  r7, r5, r9
	ldr r5, [r7]
	mul  r7, r5, r4
	add  r4, r7, r6
	ldr r5, [fp, #-36]
	mov r6, #2
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r5, r8
	ldr r5, [r6]
	ldr r6, [fp, #-20]
	mov r7, #2
	mov r8, #4
	mul  r9, r7, r8
	add  r7, r6, r9
	ldr r6, [r7]
	mul  r7, r6, r5
	add  r5, r7, r4
	ldr r4, [fp, #-12]
	mov r6, #2
	mov r8, #4
	mul  r7, r6, r8
	add  r6, r4, r7
	str r5, [r6]
	ldr r4, [fp, #-32]
	mov r5, #0
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-28]
	mov r6, #0
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r5, r8
	ldr r5, [r6]
	mul  r6, r5, r4
	ldr r4, [fp, #-32]
	mov r5, #1
	mov r7, #4
	mul  r8, r5, r7
	add  r5, r4, r8
	ldr r4, [r5]
	ldr r5, [fp, #-24]
	mov r7, #0
	mov r8, #4
	mul  r9, r7, r8
	add  r7, r5, r9
	ldr r5, [r7]
	mul  r7, r5, r4
	add  r4, r7, r6
	ldr r5, [fp, #-32]
	mov r6, #2
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r5, r8
	ldr r5, [r6]
	ldr r6, [fp, #-20]
	mov r7, #0
	mov r8, #4
	mul  r9, r7, r8
	add  r7, r6, r9
	ldr r6, [r7]
	mul  r7, r6, r5
	add  r5, r7, r4
	ldr r4, [fp, #-8]
	mov r6, #0
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r4, r8
	str r5, [r6]
	ldr r4, [fp, #-32]
	mov r5, #0
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-28]
	mov r6, #1
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r5, r8
	ldr r5, [r6]
	mul  r6, r5, r4
	ldr r4, [fp, #-32]
	mov r5, #1
	mov r8, #4
	mul  r7, r5, r8
	add  r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-24]
	mov r7, #1
	mov r8, #4
	mul  r9, r7, r8
	add  r7, r5, r9
	ldr r5, [r7]
	mul  r7, r5, r4
	add  r4, r7, r6
	ldr r5, [fp, #-32]
	mov r6, #2
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r5, r8
	ldr r5, [r6]
	ldr r6, [fp, #-20]
	mov r7, #1
	mov r8, #4
	mul  r9, r7, r8
	add  r7, r6, r9
	ldr r6, [r7]
	mul  r7, r6, r5
	add  r5, r7, r4
	ldr r4, [fp, #-8]
	mov r6, #1
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r4, r8
	str r5, [r6]
	ldr r4, [fp, #-32]
	mov r5, #0
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-28]
	mov r6, #2
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r5, r8
	ldr r5, [r6]
	mul  r6, r5, r4
	ldr r4, [fp, #-32]
	mov r5, #1
	mov r7, #4
	mul  r8, r5, r7
	add  r5, r4, r8
	ldr r4, [r5]
	ldr r5, [fp, #-24]
	mov r7, #2
	mov r8, #4
	mul  r9, r7, r8
	add  r7, r5, r9
	ldr r5, [r7]
	mul  r7, r5, r4
	add  r4, r7, r6
	ldr r5, [fp, #-32]
	mov r6, #2
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r5, r8
	ldr r5, [r6]
	ldr r6, [fp, #-20]
	mov r7, #2
	mov r8, #4
	mul  r9, r7, r8
	add  r7, r6, r9
	ldr r6, [r7]
	mul  r7, r6, r5
	add  r5, r7, r4
	ldr r4, [fp, #-8]
	mov r6, #2
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r4, r8
	str r5, [r6]
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, r9, fp, lr}
	bx lr

	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov fp, sp
	sub  sp, sp, #168
.L357:
	ldr r4, =3
	ldr r5, addr_N
	str r4, [r5]
	ldr r4, =3
	ldr r5, addr_M
	str r4, [r5]
	ldr r4, =3
	ldr r5, addr_L
	str r4, [r5]
	ldr r4, =0
	str r4, [fp, #-8]
	b .L368
.L368:
	ldr r4, addr_M
	ldr r5, [r4]
	ldr r4, [fp, #-8]
	cmp r5, r4
	bgt .L369
	b .L370
.L369:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-8]
	mov r6, #-128
	mov r7, #4
	mul  r8, r5, r7
	add  r5, r6, r8
	add  r6, fp, r5
	str r4, [r6]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-8]
	mov r6, #-116
	mov r7, #4
	mul  r8, r5, r7
	add  r5, r6, r8
	add  r6, fp, r5
	str r4, [r6]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-8]
	mov r6, #-104
	mov r7, #4
	mul  r8, r5, r7
	add  r5, r6, r8
	add  r6, fp, r5
	str r4, [r6]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-8]
	mov r6, #-92
	mov r7, #4
	mul  r8, r5, r7
	add  r5, r6, r8
	add  r6, fp, r5
	str r4, [r6]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-8]
	mov r6, #-80
	mov r7, #4
	mul  r8, r5, r7
	add  r5, r6, r8
	add  r6, fp, r5
	str r4, [r6]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-8]
	mov r6, #-68
	mov r7, #4
	mul  r8, r5, r7
	add  r5, r6, r8
	add  r6, fp, r5
	str r4, [r6]
	ldr r4, [fp, #-8]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-8]
	b .L368
.L370:
	mov r4, #0
	mov r5, #-128
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	mov r4, #0
	mov r6, #-116
	mov r8, #4
	mul  r7, r4, r8
	add  r4, r6, r7
	add  r6, fp, r4
	mov r4, #0
	mov r7, #-104
	mov r8, #4
	mul  r9, r4, r8
	add  r4, r7, r9
	add  r7, fp, r4
	mov r4, #0
	mov r8, #-92
	mov r9, #4
	mul  r10, r4, r9
	add  r4, r8, r10
	add  r8, fp, r4
	str r8, [fp, #-152]
	mov r4, #0
	mov r8, #-80
	mov r9, #4
	mul  r10, r4, r9
	add  r4, r8, r10
	add  r8, fp, r4
	str r8, [fp, #-156]
	mov r4, #0
	mov r8, #-68
	mov r9, #4
	mul  r10, r4, r9
	add  r4, r8, r10
	add  r8, fp, r4
	str r8, [fp, #-160]
	mov r4, #0
	mov r8, #-56
	mov r9, #4
	mul  r10, r4, r9
	add  r4, r8, r10
	add  r8, fp, r4
	str r8, [fp, #-164]
	mov r4, #0
	mov r8, #-32
	mov r10, #4
	mul  r9, r4, r10
	add  r4, r8, r9
	add  r8, fp, r4
	str r8, [fp, #-168]
	mov r4, #0
	mov r8, #-20
	mov r9, #4
	mul  r10, r4, r9
	add  r4, r8, r10
	add  r8, fp, r4
	mov r0, r5
	mov r1, r6
	mov r2, r7
	ldr r4, [fp, #-152]
	mov r3, r4
	ldr r4, [fp, #-156]
	mov r4, r4
	str r4, [sp, #-20]
	ldr r4, [fp, #-160]
	mov r4, r4
	str r4, [sp, #-16]
	ldr r4, [fp, #-164]
	mov r4, r4
	str r4, [sp, #-12]
	ldr r4, [fp, #-168]
	mov r4, r4
	str r4, [sp, #-8]
	mov r4, r8
	str r4, [sp, #-4]
	sub  sp, sp, #20
	bl mul
	add  sp, sp, #20
	mov r4, r0
	str r4, [fp, #-8]
	b .L373
.L373:
	ldr r4, addr_N
	ldr r5, [r4]
	ldr r4, [fp, #-8]
	cmp r5, r4
	bgt .L374
	b .L375
.L374:
	ldr r4, [fp, #-8]
	mov r5, #-56
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, [r5]
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putint
	ldr r4, [fp, #-8]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-8]
	b .L373
.L375:
	ldr r4, =10
	str r4, [fp, #-4]
	ldr r4, =0
	str r4, [fp, #-8]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putch
	b .L378
.L378:
	ldr r4, addr_N
	ldr r5, [r4]
	ldr r4, [fp, #-8]
	cmp r5, r4
	bgt .L379
	b .L380
.L379:
	ldr r4, [fp, #-8]
	mov r5, #-32
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, [r5]
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putint
	ldr r4, [fp, #-8]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-8]
	b .L378
.L380:
	ldr r4, =10
	str r4, [fp, #-4]
	ldr r4, =0
	str r4, [fp, #-8]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putch
	b .L383
.L383:
	ldr r4, addr_N
	ldr r5, [r4]
	ldr r4, [fp, #-8]
	cmp r5, r4
	bgt .L384
	b .L385
.L384:
	ldr r4, [fp, #-8]
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
	ldr r4, [fp, #-8]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-8]
	b .L383
.L385:
	ldr r4, =10
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putch
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr

addr_M:
	.word M
addr_L:
	.word L
addr_N:
	.word N
