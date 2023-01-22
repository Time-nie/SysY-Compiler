	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global a
	.align 4
	.size a, 4
a:
	.word -1
	.global b
	.align 4
	.size b, 4
b:
	.word 1
	.text
	.global inc_a
	.type inc_a , %function
inc_a:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub  sp, sp, #4
.L42:
	ldr r4, addr_a
	ldr r5, [r4]
	str r5, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, addr_a
	str r4, [r5]
	ldr r4, addr_a
	ldr r5, [r4]
	mov r0, r5
	sub  sp, fp, #0
	pop {r4, r5, r6, fp, lr}
	bx lr

	.global main
	.type main , %function
main:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub  sp, sp, #4
.L44:
	ldr r4, =5
	str r4, [fp, #-4]
	b .L46
.L46:
	ldr r4, [fp, #-4]
	ldr r5, =0
	cmp r5, r4
	ble .L47
	b .L48
.L47:
	bl inc_a
	mov r4, r0
	ldr r5, =0
	cmp r4, r5
	bne .L53
	b .L51
.L48:
	ldr r4, addr_a
	ldr r5, [r4]
	mov r0, r5
	bl putint
	mov r0, #32
	bl putch
	ldr r4, addr_b
	ldr r5, [r4]
	mov r0, r5
	bl putint
	mov r0, #10
	bl putch
	ldr r4, addr_a
	ldr r5, [r4]
	mov r0, r5
	sub  sp, fp, #0
	pop {r4, r5, r6, fp, lr}
	bx lr
.L50:
	ldr r4, addr_a
	ldr r5, [r4]
	mov r0, r5
	bl putint
	mov r0, #32
	bl putch
	ldr r4, addr_b
	ldr r5, [r4]
	mov r0, r5
	bl putint
	mov r0, #10
	bl putch
	b .L51
.L51:
	bl inc_a
	mov r4, r0
	ldr r5, =14
	cmp r5, r4
	movgt r4, #1
	movle r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L57
	b .L63
.L53:
	bl inc_a
	mov r4, r0
	ldr r5, =0
	cmp r4, r5
	bne .L55
	b .L51
.L55:
	bl inc_a
	mov r4, r0
	ldr r5, =0
	cmp r4, r5
	bne .L50
	b .L51
.L57:
	ldr r4, addr_a
	ldr r5, [r4]
	mov r0, r5
	bl putint
	mov r0, #10
	bl putch
	ldr r4, addr_b
	ldr r5, [r4]
	ldr r4, =2
	mul  r6, r4, r5
	ldr r4, addr_b
	str r6, [r4]
	b .L59
.L58:
	bl inc_a
	mov r4, r0
	b .L59
.L59:
	ldr r4, [fp, #-4]
	sub  r5, r4, #1
	str r5, [fp, #-4]
	b .L46
.L63:
	bl inc_a
	mov r4, r0
	ldr r5, =0
	cmp r4, r5
	bne .L65
	b .L58
.L65:
	bl inc_a
	mov r4, r0
	bl inc_a
	mov r5, r0
	sub  r6, r4, r5
	ldr r4, =1
	add  r5, r4, r6
	ldr r4, =0
	cmp r5, r4
	bne .L57
	b .L58

addr_a:
	.word a
addr_b:
	.word b
