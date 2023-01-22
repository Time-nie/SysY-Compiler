	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.text
	.global lengthOfLastWord
	.type lengthOfLastWord , %function
lengthOfLastWord:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub  sp, sp, #16
.L68:
	str r0, [fp, #-16]
	str r1, [fp, #-12]
	ldr r4, [fp, #-12]
	ldr r5, =0
	cmp r5, r4
	beq .L73
	b .L74
.L73:
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
	b .L74
.L74:
	ldr r4, [fp, #-12]
	sub  r5, r4, #1
	str r5, [fp, #-8]
	b .L77
.L77:
	ldr r4, =0
	sub  r5, r4, #1
	ldr r4, [fp, #-8]
	cmp r5, r4
	movlt r4, #1
	movge r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L83
	b .L79
.L78:
	ldr r4, [fp, #-8]
	sub  r5, r4, #1
	str r5, [fp, #-8]
	b .L77
.L79:
	ldr r4, =0
	sub  r5, r4, #1
	ldr r4, [fp, #-8]
	cmp r5, r4
	beq .L89
	b .L90
.L83:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-8]
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	ldr r5, =0
	cmp r5, r4
	moveq r4, #1
	movne r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L78
	b .L79
.L89:
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
	b .L90
.L90:
	ldr r4, [fp, #-8]
	str r4, [fp, #-4]
	b .L93
.L93:
	ldr r4, =0
	sub  r5, r4, #1
	ldr r4, [fp, #-4]
	cmp r5, r4
	blt .L94
	b .L95
.L94:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-4]
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	ldr r5, =0
	cmp r5, r4
	beq .L97
	b .L98
.L95:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	sub  r6, r4, r5
	mov r0, r6
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L97:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-4]
	sub  r6, r4, r5
	sub  r4, r6, #1
	ldr r5, [fp, #-12]
	sub  r6, r5, #1
	ldr r5, [fp, #-8]
	sub  r7, r6, r5
	sub  r5, r4, r7
	mov r0, r5
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
	b .L98
.L98:
	ldr r4, [fp, #-4]
	sub  r5, r4, #1
	str r5, [fp, #-4]
	b .L93

	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub  sp, sp, #44
.L102:
	ldr r4, =0
	sub  r5, r4, #4
	mov r4, #0
	mov r6, #-40
	mov r7, #4
	mul  r8, r4, r7
	add  r4, r6, r8
	add  r6, fp, r4
	str r5, [r6]
	mov r4, #1
	mov r5, #-40
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =3
	str r4, [r5]
	mov r4, #2
	mov r5, #-40
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =9
	str r4, [r5]
	ldr r4, =0
	sub  r5, r4, #2
	mov r4, #3
	mov r6, #-40
	mov r7, #4
	mul  r8, r4, r7
	add  r4, r6, r8
	add  r6, fp, r4
	str r5, [r6]
	mov r4, #4
	mov r5, #-40
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =0
	str r4, [r5]
	mov r4, #5
	mov r5, #-40
	mov r7, #4
	mul  r6, r4, r7
	add  r4, r5, r6
	add  r5, fp, r4
	ldr r4, =1
	str r4, [r5]
	ldr r4, =0
	sub  r5, r4, #6
	mov r4, #6
	mov r6, #-40
	mov r8, #4
	mul  r7, r4, r8
	add  r4, r6, r7
	add  r6, fp, r4
	str r5, [r6]
	mov r4, #7
	mov r5, #-40
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =5
	str r4, [r5]
	mov r4, #8
	mov r5, #-40
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =7
	str r4, [r5]
	mov r4, #9
	mov r5, #-40
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =8
	str r4, [r5]
	ldr r4, =10
	str r4, [fp, #-44]
	mov r4, #0
	mov r5, #-40
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, [fp, #-44]
	mov r0, r5
	mov r1, r4
	bl lengthOfLastWord
	mov r4, r0
	str r4, [fp, #-44]
	ldr r4, [fp, #-44]
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

