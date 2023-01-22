	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.text
	.global enc
	.type enc , %function
enc:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub  sp, sp, #4
.L33:
	str r0, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, =25
	cmp r5, r4
	blt .L36
	b .L37
.L36:
	ldr r4, [fp, #-4]
	ldr r5, =60
	add  r6, r5, r4
	str r6, [fp, #-4]
	b .L38
.L37:
	ldr r4, [fp, #-4]
	sub  r5, r4, #15
	str r5, [fp, #-4]
	b .L38
.L38:
	ldr r4, [fp, #-4]
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, fp, lr}
	bx lr

	.global dec
	.type dec , %function
dec:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub  sp, sp, #4
.L40:
	str r0, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, =85
	cmp r5, r4
	blt .L43
	b .L44
.L43:
	ldr r4, [fp, #-4]
	sub  r5, r4, #59
	str r5, [fp, #-4]
	b .L45
.L44:
	ldr r4, [fp, #-4]
	ldr r5, =14
	add  r6, r5, r4
	str r6, [fp, #-4]
	b .L45
.L45:
	ldr r4, [fp, #-4]
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, fp, lr}
	bx lr

	.global main
	.type main , %function
main:
	push {r4, fp, lr}
	mov fp, sp
	sub  sp, sp, #8
.L47:
	ldr r4, =400
	str r4, [fp, #-8]
	ldr r4, [fp, #-8]
	mov r0, r4
	bl enc
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl dec
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putint
	ldr r4, =10
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putch
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, fp, lr}
	bx lr

