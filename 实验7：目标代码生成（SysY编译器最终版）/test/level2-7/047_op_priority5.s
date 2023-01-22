	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global a
	.align 4
	.size a, 4
a:
	.word 1
	.global b
	.align 4
	.size b, 4
b:
	.word 0
	.global c
	.align 4
	.size c, 4
c:
	.word 1
	.global d
	.align 4
	.size d, 4
d:
	.word 2
	.global e
	.align 4
	.size e, 4
e:
	.word 4
	.text
	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub  sp, sp, #4
.L43:
	ldr r4, =0
	str r4, [fp, #-4]
	ldr r4, addr_e
	ldr r5, [r4]
	ldr r4, addr_d
	ldr r6, [r4]
	add  r4, r6, r5
	ldr r5, addr_a
	ldr r6, [r5]
	ldr r5, addr_b
	ldr r7, [r5]
	mul  r5, r7, r6
	ldr r6, addr_c
	ldr r7, [r6]
	sdiv  r6, r5, r7
	cmp r4, r6
	moveq r4, #1
	movne r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L50
	b .L54
.L45:
	ldr r4, =1
	str r4, [fp, #-4]
	b .L46
.L46:
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putint
	ldr r4, [fp, #-4]
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L50:
	ldr r4, addr_d
	ldr r5, [r4]
	ldr r4, addr_e
	ldr r6, [r4]
	add  r4, r6, r5
	ldr r5, addr_a
	ldr r6, [r5]
	ldr r5, addr_a
	ldr r7, [r5]
	ldr r5, addr_b
	ldr r8, [r5]
	add  r5, r8, r7
	mul  r7, r5, r6
	ldr r5, addr_c
	ldr r6, [r5]
	add  r5, r6, r7
	cmp r4, r5
	movge r4, #1
	movlt r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L45
	b .L54
.L54:
	ldr r4, addr_d
	ldr r5, [r4]
	ldr r4, addr_a
	ldr r6, [r4]
	ldr r4, addr_c
	ldr r7, [r4]
	sdiv  r4, r6, r7
	sub  r6, r5, r4
	ldr r4, addr_a
	ldr r5, [r4]
	ldr r4, addr_b
	ldr r7, [r4]
	ldr r4, addr_c
	ldr r8, [r4]
	mul  r4, r8, r7
	sub  r7, r5, r4
	cmp r6, r7
	moveq r4, #1
	movne r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L45
	b .L46

addr_a:
	.word a
addr_b:
	.word b
addr_c:
	.word c
addr_d:
	.word d
addr_e:
	.word e
