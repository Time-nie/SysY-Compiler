	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.text
	.global concat
	.type concat , %function
concat:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub  sp, sp, #20
.L83:
	str r0, [fp, #-20]
	str r1, [fp, #-16]
	str r2, [fp, #-12]
	ldr r4, =0
	str r4, [fp, #-8]
	b .L91
.L91:
	ldr r4, [fp, #-8]
	ldr r5, =3
	cmp r5, r4
	bgt .L92
	b .L93
.L92:
	ldr r4, [fp, #-20]
	ldr r5, [fp, #-8]
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-12]
	ldr r6, [fp, #-8]
	mov r8, #4
	mul  r7, r6, r8
	add  r6, r5, r7
	str r4, [r6]
	ldr r4, [fp, #-8]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-8]
	b .L91
.L93:
	ldr r4, =0
	str r4, [fp, #-4]
	b .L99
.L99:
	ldr r4, [fp, #-4]
	ldr r5, =3
	cmp r5, r4
	bgt .L100
	b .L101
.L100:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-4]
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-12]
	ldr r6, [fp, #-8]
	mov r8, #4
	mul  r7, r6, r8
	add  r6, r5, r7
	str r4, [r6]
	ldr r4, [fp, #-8]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-8]
	ldr r4, [fp, #-4]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-4]
	b .L99
.L101:
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, r9, fp, lr}
	mov fp, sp
	sub  sp, sp, #128
.L106:
	ldr r4, =0
	str r4, [fp, #-8]
	b .L117
.L117:
	ldr r4, [fp, #-8]
	ldr r5, =3
	cmp r5, r4
	bgt .L118
	b .L119
.L118:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-8]
	mov r6, #-128
	mov r7, #4
	mul  r8, r5, r7
	add  r5, r6, r8
	add  r6, fp, r5
	str r4, [r6]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-8]
	mov r6, #-116
	mov r7, #4
	mul  r8, r5, r7
	add  r5, r6, r8
	add  r6, fp, r5
	str r4, [r6]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-8]
	mov r6, #-104
	mov r8, #4
	mul  r7, r5, r8
	add  r5, r6, r7
	add  r6, fp, r5
	str r4, [r6]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-8]
	mov r6, #-92
	mov r7, #4
	mul  r8, r5, r7
	add  r5, r6, r8
	add  r6, fp, r5
	str r4, [r6]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-8]
	mov r6, #-80
	mov r7, #4
	mul  r8, r5, r7
	add  r5, r6, r8
	add  r6, fp, r5
	str r4, [r6]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-8]
	mov r6, #-68
	mov r7, #4
	mul  r8, r5, r7
	add  r5, r6, r8
	add  r6, fp, r5
	str r4, [r6]
	ldr r4, [fp, #-8]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-8]
	b .L117
.L119:
	mov r4, #0
	mov r5, #-128
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	mov r4, #0
	mov r6, #-92
	mov r8, #4
	mul  r7, r4, r8
	add  r4, r6, r7
	add  r6, fp, r4
	mov r4, #0
	mov r7, #-56
	mov r8, #4
	mul  r9, r4, r8
	add  r4, r7, r9
	add  r7, fp, r4
	mov r0, r5
	mov r1, r6
	mov r2, r7
	bl concat
	mov r4, r0
	str r4, [fp, #-8]
	b .L122
.L122:
	ldr r4, [fp, #-8]
	ldr r5, =6
	cmp r5, r4
	bgt .L123
	b .L124
.L123:
	ldr r4, [fp, #-8]
	mov r5, #-56
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, [r5]
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putint
	ldr r4, [fp, #-8]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-8]
	b .L122
.L124:
	ldr r4, =10
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putch
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, r9, fp, lr}
	bx lr

