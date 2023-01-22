	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.text
	.global func
	.type func , %function
func:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub  sp, sp, #4
.L27:
	str r0, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, =50
	cmp r5, r4
	bge .L30
	b .L31
.L30:
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putint
	mov r0, #1
	sub  sp, fp, #0
	pop {r4, r5, fp, lr}
	bx lr
	b .L32
.L31:
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putint
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, fp, lr}
	bx lr
	b .L32
.L32:
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, fp, lr}
	bx lr

	.global main
	.type main , %function
main:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub  sp, sp, #4
.L34:
	mov r0, #0
	bl func
	mov r4, r0
	ldr r5, =1
	cmp r5, r4
	moveq r4, #1
	movne r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L36
	b .L42
.L36:
	ldr r4, =0
	str r4, [fp, #-4]
	b .L38
.L37:
	ldr r4, =1
	str r4, [fp, #-4]
	b .L38
.L38:
	mov r0, #50
	bl func
	mov r4, r0
	ldr r5, =1
	cmp r5, r4
	moveq r4, #1
	movne r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L56
	b .L60
.L42:
	mov r0, #50
	bl func
	mov r4, r0
	ldr r5, =1
	cmp r5, r4
	moveq r4, #1
	movne r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L46
	b .L37
.L46:
	mov r0, #100
	bl func
	mov r4, r0
	ldr r5, =0
	cmp r5, r4
	moveq r4, #1
	movne r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L36
	b .L37
.L50:
	ldr r4, =0
	str r4, [fp, #-4]
	b .L52
.L51:
	ldr r4, =1
	str r4, [fp, #-4]
	b .L52
.L52:
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, fp, lr}
	bx lr
.L56:
	mov r0, #40
	bl func
	mov r4, r0
	ldr r5, =1
	cmp r5, r4
	moveq r4, #1
	movne r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L50
	b .L60
.L60:
	mov r0, #1
	bl func
	mov r4, r0
	ldr r5, =1
	cmp r5, r4
	moveq r4, #1
	movne r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L50
	b .L51

