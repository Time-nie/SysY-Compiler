	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.text
	.global uniquePaths
	.type uniquePaths , %function
uniquePaths:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub  sp, sp, #52
.L82:
	str r0, [fp, #-52]
	str r1, [fp, #-48]
	ldr r4, [fp, #-52]
	ldr r5, =1
	cmp r5, r4
	moveq r4, #1
	movne r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L87
	b .L92
.L87:
	mov r0, #1
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
	b .L88
.L88:
	ldr r4, =0
	str r4, [fp, #-8]
	b .L99
.L92:
	ldr r4, [fp, #-48]
	ldr r5, =1
	cmp r5, r4
	moveq r4, #1
	movne r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L87
	b .L88
.L99:
	ldr r4, [fp, #-52]
	ldr r5, [fp, #-8]
	cmp r4, r5
	bgt .L100
	b .L101
.L100:
	ldr r4, [fp, #-8]
	ldr r5, =3
	mul  r6, r5, r4
	ldr r4, [fp, #-48]
	add  r5, r4, r6
	sub  r4, r5, #1
	mov r5, #-44
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =1
	str r4, [r5]
	ldr r4, [fp, #-8]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-8]
	b .L99
.L101:
	ldr r4, =0
	str r4, [fp, #-8]
	b .L103
.L103:
	ldr r4, [fp, #-48]
	ldr r5, [fp, #-8]
	cmp r4, r5
	bgt .L104
	b .L105
.L104:
	ldr r4, [fp, #-52]
	sub  r5, r4, #1
	ldr r4, =3
	mul  r6, r4, r5
	ldr r4, [fp, #-8]
	add  r5, r4, r6
	mov r4, #-44
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	add  r4, fp, r5
	ldr r5, =1
	str r5, [r4]
	ldr r4, [fp, #-8]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-8]
	b .L103
.L105:
	ldr r4, [fp, #-52]
	sub  r5, r4, #2
	str r5, [fp, #-8]
	b .L107
.L107:
	ldr r4, =0
	sub  r5, r4, #1
	ldr r4, [fp, #-8]
	cmp r5, r4
	blt .L108
	b .L109
.L108:
	ldr r4, [fp, #-48]
	sub  r5, r4, #2
	str r5, [fp, #-4]
	b .L111
.L109:
	mov r4, #0
	mov r5, #-44
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, [r5]
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L111:
	ldr r4, =0
	sub  r5, r4, #1
	ldr r4, [fp, #-4]
	cmp r5, r4
	blt .L112
	b .L113
.L112:
	ldr r4, [fp, #-8]
	ldr r5, =1
	add  r6, r5, r4
	ldr r4, =3
	mul  r5, r4, r6
	ldr r4, [fp, #-4]
	add  r6, r4, r5
	mov r4, #-44
	mov r7, #4
	mul  r5, r6, r7
	add  r6, r4, r5
	add  r4, fp, r6
	ldr r5, [r4]
	ldr r4, [fp, #-8]
	ldr r6, =3
	mul  r7, r6, r4
	ldr r4, [fp, #-4]
	add  r6, r4, r7
	ldr r4, =1
	add  r7, r4, r6
	mov r4, #-44
	mov r6, #4
	mul  r8, r7, r6
	add  r6, r4, r8
	add  r4, fp, r6
	ldr r6, [r4]
	add  r4, r6, r5
	ldr r5, [fp, #-8]
	ldr r6, =3
	mul  r7, r6, r5
	ldr r5, [fp, #-4]
	add  r6, r5, r7
	mov r5, #-44
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r5, r8
	add  r5, fp, r6
	str r4, [r5]
	ldr r4, [fp, #-4]
	sub  r5, r4, #1
	str r5, [fp, #-4]
	b .L111
.L113:
	ldr r4, [fp, #-8]
	sub  r5, r4, #1
	str r5, [fp, #-8]
	b .L107

	.global main
	.type main , %function
main:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub  sp, sp, #8
.L118:
	ldr r4, =3
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-4]
	mov r0, r4
	mov r1, r5
	bl uniquePaths
	mov r4, r0
	str r4, [fp, #-8]
	ldr r4, [fp, #-8]
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, fp, lr}
	bx lr

