	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global ascii_0
	.align 4
	.size ascii_0, 4
ascii_0:
	.word 48
	.text
	.global my_getint
	.type my_getint , %function
my_getint:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub  sp, sp, #8
.L64:
	ldr r4, =0
	str r4, [fp, #-8]
	b .L67
.L67:
	ldr r4, =1
	ldr r5, =0
	cmp r4, r5
	bne .L68
	b .L69
.L68:
	bl getch
	mov r4, r0
	ldr r5, addr_ascii_0
	ldr r6, [r5]
	sub  r5, r4, r6
	str r5, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, =0
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L71
	b .L77
.L69:
	ldr r4, [fp, #-4]
	str r4, [fp, #-8]
	b .L83
.L71:
	b .L67
.L72:
	b .L69
.L73:
	b .L67
.L77:
	ldr r4, [fp, #-4]
	ldr r5, =9
	cmp r4, r5
	movgt r4, #1
	movle r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L71
	b .L72
.L81:
	b .L73
.L82:
	b .L73
.L83:
	ldr r4, =1
	ldr r5, =0
	cmp r4, r5
	bne .L84
	b .L85
.L84:
	bl getch
	mov r4, r0
	ldr r5, addr_ascii_0
	ldr r6, [r5]
	sub  r5, r4, r6
	str r5, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, =0
	cmp r4, r5
	movge r4, #1
	movlt r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L93
	b .L88
.L85:
	ldr r4, [fp, #-8]
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L87:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-8]
	ldr r6, =10
	mul  r7, r6, r5
	add  r5, r7, r4
	str r5, [fp, #-8]
	b .L89
.L88:
	b .L85
.L89:
	b .L83
.L93:
	ldr r4, [fp, #-4]
	ldr r5, =9
	cmp r4, r5
	movle r4, #1
	movgt r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L87
	b .L88
.L97:
	b .L89

	.global my_putint
	.type my_putint , %function
my_putint:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub  sp, sp, #72
.L98:
	str r0, [fp, #-72]
	ldr r4, =0
	str r4, [fp, #-4]
	b .L103
.L103:
	ldr r4, [fp, #-72]
	ldr r5, =0
	cmp r4, r5
	bgt .L104
	b .L105
.L104:
	ldr r4, addr_ascii_0
	ldr r5, [r4]
	ldr r4, [fp, #-72]
	ldr r6, =10
	sdiv  r7, r4, r6
	mul  r7, r7, r6
	sub  r6, r4, r7
	add  r4, r6, r5
	ldr r5, [fp, #-4]
	mov r6, #-68
	mov r7, #4
	mul  r8, r5, r7
	add  r5, r6, r8
	add  r6, fp, r5
	str r4, [r6]
	ldr r4, [fp, #-72]
	ldr r5, =10
	sdiv  r6, r4, r5
	str r6, [fp, #-72]
	ldr r4, [fp, #-4]
	add  r5, r4, #1
	str r5, [fp, #-4]
	b .L103
.L105:
	b .L107
.L107:
	ldr r4, [fp, #-4]
	ldr r5, =0
	cmp r4, r5
	bgt .L108
	b .L109
.L108:
	ldr r4, [fp, #-4]
	sub  r5, r4, #1
	str r5, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r5, #-68
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, [r5]
	mov r0, r4
	bl putch
	b .L107
.L109:
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

	.global main
	.type main , %function
main:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub  sp, sp, #8
.L112:
	bl my_getint
	mov r4, r0
	str r4, [fp, #-8]
	b .L114
.L114:
	ldr r4, [fp, #-8]
	ldr r5, =0
	cmp r4, r5
	bgt .L115
	b .L116
.L115:
	bl my_getint
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl my_putint
	mov r0, #10
	bl putch
	ldr r4, [fp, #-8]
	sub  r5, r4, #1
	str r5, [fp, #-8]
	b .L114
.L116:
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, fp, lr}
	bx lr

addr_ascii_0:
	.word ascii_0
