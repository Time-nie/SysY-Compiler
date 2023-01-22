	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.text
	.global FourWhile
	.type FourWhile , %function
FourWhile:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub  sp, sp, #16
.L46:
	ldr r4, =5
	str r4, [fp, #-16]
	ldr r4, =6
	str r4, [fp, #-12]
	ldr r4, =7
	str r4, [fp, #-8]
	ldr r4, =10
	str r4, [fp, #-4]
	b .L51
.L51:
	ldr r4, [fp, #-16]
	ldr r5, =20
	cmp r5, r4
	bgt .L52
	b .L53
.L52:
	ldr r4, [fp, #-16]
	ldr r5, =3
	add  r6, r5, r4
	str r6, [fp, #-16]
	b .L55
.L53:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-12]
	ldr r6, [fp, #-4]
	add  r7, r6, r5
	add  r5, r7, r4
	ldr r4, [fp, #-8]
	add  r6, r4, r5
	mov r0, r6
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L55:
	ldr r4, [fp, #-12]
	ldr r5, =10
	cmp r5, r4
	bgt .L56
	b .L57
.L56:
	ldr r4, [fp, #-12]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-12]
	b .L59
.L57:
	ldr r4, [fp, #-12]
	sub  r5, r4, #2
	str r5, [fp, #-12]
	b .L51
.L59:
	ldr r4, [fp, #-8]
	ldr r5, =7
	cmp r5, r4
	beq .L60
	b .L61
.L60:
	ldr r4, [fp, #-8]
	sub  r5, r4, #1
	str r5, [fp, #-8]
	b .L63
.L61:
	ldr r4, [fp, #-8]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-8]
	b .L55
.L63:
	ldr r4, [fp, #-4]
	ldr r5, =20
	cmp r5, r4
	bgt .L64
	b .L65
.L64:
	ldr r4, [fp, #-4]
	ldr r5, =3
	add  r6, r5, r4
	str r6, [fp, #-4]
	b .L63
.L65:
	ldr r4, [fp, #-4]
	sub  r5, r4, #1
	str r5, [fp, #-4]
	b .L59

	.global main
	.type main , %function
main:
	push {r4, fp, lr}
	mov fp, sp
	sub  sp, sp, #0
.L67:
	bl FourWhile
	mov r4, r0
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, fp, lr}
	bx lr

