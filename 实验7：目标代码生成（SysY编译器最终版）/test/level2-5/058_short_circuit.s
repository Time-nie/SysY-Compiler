	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global g
	.align 4
	.size g, 4
g:
	.word 0
	.text
	.global func
	.type func , %function
func:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub  sp, sp, #4
.L52:
	str r0, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, addr_g
	ldr r6, [r5]
	add  r5, r6, r4
	ldr r4, addr_g
	str r5, [r4]
	ldr r4, addr_g
	ldr r5, [r4]
	mov r0, r5
	bl putint
	ldr r4, addr_g
	ldr r5, [r4]
	mov r0, r5
	sub  sp, fp, #0
	pop {r4, r5, r6, fp, lr}
	bx lr

	.global main
	.type main , %function
main:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub  sp, sp, #4
.L55:
	bl getint
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, =10
	cmp r4, r5
	movgt r4, #1
	movle r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L63
	b .L58
.L57:
	ldr r4, =1
	str r4, [fp, #-4]
	b .L59
.L58:
	ldr r4, =0
	str r4, [fp, #-4]
	b .L59
.L59:
	bl getint
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, =11
	cmp r4, r5
	movgt r4, #1
	movle r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L71
	b .L66
.L63:
	ldr r4, [fp, #-4]
	mov r0, r4
	bl func
	mov r4, r0
	ldr r5, =0
	cmp r4, r5
	bne .L57
	b .L58
.L65:
	ldr r4, =1
	str r4, [fp, #-4]
	b .L67
.L66:
	ldr r4, =0
	str r4, [fp, #-4]
	b .L67
.L67:
	bl getint
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, =99
	cmp r4, r5
	movle r4, #1
	movgt r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L73
	b .L79
.L71:
	ldr r4, [fp, #-4]
	mov r0, r4
	bl func
	mov r4, r0
	ldr r5, =0
	cmp r4, r5
	bne .L65
	b .L66
.L73:
	ldr r4, =1
	str r4, [fp, #-4]
	b .L75
.L74:
	ldr r4, =0
	str r4, [fp, #-4]
	b .L75
.L75:
	bl getint
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, =100
	cmp r4, r5
	movle r4, #1
	movgt r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L81
	b .L87
.L79:
	ldr r4, [fp, #-4]
	mov r0, r4
	bl func
	mov r4, r0
	ldr r5, =0
	cmp r4, r5
	bne .L73
	b .L74
.L81:
	ldr r4, =1
	str r4, [fp, #-4]
	b .L83
.L82:
	ldr r4, =0
	str r4, [fp, #-4]
	b .L83
.L83:
	mov r0, #99
	bl func
	mov r4, r0
	ldr r5, =0
	cmp r4, r5
	moveq r4, #1
	movne r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L95
	b .L90
.L87:
	ldr r4, [fp, #-4]
	mov r0, r4
	bl func
	mov r4, r0
	ldr r5, =0
	cmp r4, r5
	bne .L81
	b .L82
.L89:
	ldr r4, =1
	str r4, [fp, #-4]
	b .L91
.L90:
	ldr r4, =0
	str r4, [fp, #-4]
	b .L91
.L91:
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, fp, lr}
	bx lr
.L95:
	mov r0, #100
	bl func
	mov r4, r0
	ldr r5, =0
	cmp r4, r5
	bne .L89
	b .L90

addr_g:
	.word g
