	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.text
	.global main
	.type main , %function
main:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub  sp, sp, #20
.L43:
	ldr r4, =5
	str r4, [fp, #-20]
	ldr r4, =5
	str r4, [fp, #-16]
	ldr r4, =1
	str r4, [fp, #-12]
	ldr r4, =0
	add  r4, r4, #2
	sub  r4, r4, #2
	sub  r5, r4, #2
	str r5, [fp, #-8]
	ldr r4, =2
	str r4, [fp, #-4]
	ldr r4, [fp, #-8]
	ldr r5, =1
	mul  r6, r5, r4
	ldr r4, =2
	sdiv  r5, r6, r4
	ldr r4, =0
	cmp r4, r5
	movgt r4, #1
	movle r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L49
	b .L54
.L49:
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putint
	b .L50
.L50:
	ldr r4, [fp, #-8]
	ldr r5, =2
	sdiv  r6, r4, r5
	mul  r6, r6, r5
	sub  r5, r4, r6
	ldr r4, =67
	mov r4, r4
	add  r4, r4, r5
	ldr r5, =0
	cmp r5, r4
	movgt r4, #1
	movle r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L62
	b .L67
.L54:
	ldr r4, [fp, #-20]
	ldr r5, [fp, #-16]
	add  r4, r4, r5
	sub  r4, r4, r5
	sub  r6, r4, r5
	ldr r4, =0
	cmp r4, r6
	movne r4, #1
	moveq r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L58
	b .L50
.L58:
	ldr r4, [fp, #-12]
	ldr r5, =3
	mov r5, r5
	add  r5, r5, r4
	ldr r4, =2
	sdiv  r6, r5, r4
	mul  r6, r6, r4
	sub  r4, r5, r6
	ldr r5, =0
	cmp r5, r4
	movne r4, #1
	moveq r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L49
	b .L50
.L62:
	ldr r4, =4
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putint
	b .L63
.L63:
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, r6, fp, lr}
	bx lr
.L67:
	ldr r4, [fp, #-20]
	ldr r5, [fp, #-16]
	add  r4, r4, r5
	sub  r4, r4, r5
	sub  r6, r4, r5
	ldr r4, =0
	cmp r4, r6
	movne r4, #1
	moveq r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L71
	b .L63
.L71:
	ldr r4, [fp, #-12]
	ldr r5, =2
	mov r5, r5
	add  r5, r5, r4
	ldr r4, =2
	sdiv  r6, r5, r4
	mul  r6, r6, r4
	sub  r4, r5, r6
	ldr r5, =0
	cmp r5, r4
	movne r4, #1
	moveq r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L62
	b .L63

