	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.text
	.global canJump
	.type canJump , %function
canJump:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub  sp, sp, #56
.L82:
	str r0, [fp, #-56]
	str r1, [fp, #-52]
	ldr r4, [fp, #-52]
	ldr r5, =1
	cmp r5, r4
	beq .L87
	b .L88
.L87:
	mov r0, #1
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
	b .L88
.L88:
	ldr r4, [fp, #-52]
	sub  r5, r4, #2
	ldr r4, [fp, #-56]
	mov r6, #0
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r4, r8
	ldr r4, [r6]
	cmp r5, r4
	blt .L90
	b .L91
.L90:
	mov r0, #1
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
	b .L91
.L91:
	ldr r4, =0
	str r4, [fp, #-8]
	b .L97
.L97:
	ldr r4, [fp, #-52]
	sub  r5, r4, #1
	ldr r4, [fp, #-8]
	cmp r5, r4
	bgt .L98
	b .L99
.L98:
	ldr r4, [fp, #-8]
	mov r5, #-48
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =0
	str r4, [r5]
	ldr r4, [fp, #-8]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-8]
	b .L97
.L99:
	ldr r4, [fp, #-52]
	sub  r5, r4, #1
	mov r4, #-48
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	add  r4, fp, r5
	ldr r5, =1
	str r5, [r4]
	ldr r4, [fp, #-52]
	sub  r5, r4, #2
	str r5, [fp, #-8]
	b .L101
.L101:
	ldr r4, =0
	sub  r5, r4, #1
	ldr r4, [fp, #-8]
	cmp r5, r4
	blt .L102
	b .L103
.L102:
	ldr r4, [fp, #-52]
	sub  r5, r4, #1
	ldr r4, [fp, #-8]
	sub  r6, r5, r4
	ldr r4, [fp, #-56]
	ldr r5, [fp, #-8]
	mov r7, #4
	mul  r8, r5, r7
	add  r5, r4, r8
	ldr r4, [r5]
	cmp r6, r4
	bgt .L106
	b .L107
.L103:
	mov r4, #0
	mov r5, #-48
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, [r5]
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L106:
	ldr r4, [fp, #-56]
	ldr r5, [fp, #-8]
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	str r4, [fp, #-4]
	b .L108
.L107:
	ldr r4, [fp, #-52]
	sub  r5, r4, #1
	ldr r4, [fp, #-8]
	sub  r6, r5, r4
	str r6, [fp, #-4]
	b .L108
.L108:
	b .L114
.L114:
	ldr r4, =0
	sub  r5, r4, #1
	ldr r4, [fp, #-4]
	cmp r5, r4
	blt .L115
	b .L116
.L115:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	add  r6, r5, r4
	mov r4, #-48
	mov r5, #4
	mul  r7, r6, r5
	add  r5, r4, r7
	add  r4, fp, r5
	ldr r5, [r4]
	ldr r4, =0
	cmp r4, r5
	bne .L118
	b .L119
.L116:
	ldr r4, [fp, #-8]
	sub  r5, r4, #1
	str r5, [fp, #-8]
	b .L101
.L118:
	ldr r4, [fp, #-8]
	mov r5, #-48
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =1
	str r4, [r5]
	b .L119
.L119:
	ldr r4, [fp, #-4]
	sub  r5, r4, #1
	str r5, [fp, #-4]
	b .L114

	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub  sp, sp, #44
.L123:
	mov r4, #0
	mov r5, #-40
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =3
	str r4, [r5]
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
	mov r4, #3
	mov r5, #-40
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =0
	str r4, [r5]
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
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =1
	str r4, [r5]
	mov r4, #6
	mov r5, #-40
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =1
	str r4, [r5]
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
	mov r7, #4
	mul  r6, r4, r7
	add  r4, r5, r6
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
	bl canJump
	mov r4, r0
	str r4, [fp, #-44]
	ldr r4, [fp, #-44]
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

