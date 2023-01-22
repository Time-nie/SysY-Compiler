	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.text
	.global ifWhile
	.type ifWhile , %function
ifWhile:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub  sp, sp, #8
.L25:
	ldr r4, =0
	str r4, [fp, #-8]
	ldr r4, =3
	str r4, [fp, #-4]
	ldr r4, [fp, #-8]
	ldr r5, =5
	cmp r5, r4
	beq .L28
	b .L29
.L28:
	b .L32
.L29:
	b .L36
.L30:
	ldr r4, [fp, #-4]
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, fp, lr}
	bx lr
.L32:
	ldr r4, [fp, #-4]
	ldr r5, =2
	cmp r5, r4
	beq .L33
	b .L34
.L33:
	ldr r4, [fp, #-4]
	ldr r5, =2
	add  r6, r5, r4
	str r6, [fp, #-4]
	b .L32
.L34:
	ldr r4, [fp, #-4]
	ldr r5, =25
	add  r6, r5, r4
	str r6, [fp, #-4]
	b .L30
.L36:
	ldr r4, [fp, #-8]
	ldr r5, =5
	cmp r5, r4
	bgt .L37
	b .L38
.L37:
	ldr r4, [fp, #-4]
	ldr r5, =2
	mul  r6, r5, r4
	str r6, [fp, #-4]
	ldr r4, [fp, #-8]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-8]
	b .L36
.L38:
	b .L30

	.global main
	.type main , %function
main:
	push {r4, fp, lr}
	mov fp, sp
	sub  sp, sp, #0
.L40:
	bl ifWhile
	mov r4, r0
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, fp, lr}
	bx lr

