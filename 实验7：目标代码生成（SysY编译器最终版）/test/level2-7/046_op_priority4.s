	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global a
	.align 4
	.size a, 4
a:
	.word 0
	.global b
	.align 4
	.size b, 4
b:
	.word 0
	.global c
	.align 4
	.size c, 4
c:
	.word 0
	.global d
	.align 4
	.size d, 4
d:
	.word 0
	.global e
	.align 4
	.size e, 4
e:
	.word 0
	.text
	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub  sp, sp, #4
.L50:
	bl getint
	mov r4, r0
	ldr r5, addr_a
	str r4, [r5]
	bl getint
	mov r4, r0
	ldr r5, addr_b
	str r4, [r5]
	bl getint
	mov r4, r0
	ldr r5, addr_c
	str r4, [r5]
	bl getint
	mov r4, r0
	ldr r5, addr_d
	str r4, [r5]
	bl getint
	mov r4, r0
	ldr r5, addr_e
	str r4, [r5]
	ldr r4, =0
	str r4, [fp, #-4]
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
	movne r4, #1
	moveq r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L52
	b .L57
.L52:
	ldr r4, =1
	str r4, [fp, #-4]
	b .L53
.L53:
	ldr r4, [fp, #-4]
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L57:
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
	bne .L52
	b .L61
.L61:
	ldr r4, addr_d
	ldr r5, [r4]
	ldr r4, addr_e
	ldr r6, [r4]
	add  r4, r6, r5
	ldr r5, addr_a
	ldr r6, [r5]
	ldr r5, addr_b
	ldr r7, [r5]
	add  r5, r7, r6
	ldr r6, addr_c
	ldr r7, [r6]
	add  r6, r7, r5
	cmp r4, r6
	moveq r4, #1
	movne r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L52
	b .L53

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
