	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.text
	.global gcd
	.type gcd , %function
gcd:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub  sp, sp, #8
.L25:
	str r0, [fp, #-8]
	str r1, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, =0
	cmp r4, r5
	beq .L30
	b .L31
.L30:
	ldr r4, [fp, #-8]
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
	b .L31
.L31:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-8]
	ldr r6, [fp, #-4]
	sdiv  r7, r5, r6
	mul  r7, r7, r6
	sub  r6, r5, r7
	mov r0, r4
	mov r1, r6
	bl gcd
	mov r4, r0
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

	.global main
	.type main , %function
main:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub  sp, sp, #12
.L33:
	bl getint
	mov r4, r0
	str r4, [fp, #-12]
	b .L35
.L35:
	ldr r4, [fp, #-12]
	ldr r5, =0
	cmp r4, r5
	bgt .L36
	b .L37
.L36:
	bl getint
	mov r4, r0
	str r4, [fp, #-8]
	bl getint
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	mov r0, r4
	mov r1, r5
	bl gcd
	mov r4, r0
	mov r0, r4
	bl putint
	mov r0, #10
	bl putch
	ldr r4, [fp, #-12]
	sub  r5, r4, #1
	str r5, [fp, #-12]
	b .L35
.L37:
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, fp, lr}
	bx lr

