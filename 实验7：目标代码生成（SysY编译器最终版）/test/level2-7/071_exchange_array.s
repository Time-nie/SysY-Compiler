	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.text
	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub  sp, sp, #116
.L33:
	mov r4, #0
	mov r5, #-116
	mov r6, #20
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	mov r4, #0
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	ldr r5, =1
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =1
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =1
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =1
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =1
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =2
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =2
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =2
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =2
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =2
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =3
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =3
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =3
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =3
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =3
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =4
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =4
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =4
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =4
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =4
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =5
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =5
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =5
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =5
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =5
	str r5, [r4]
	ldr r4, =2
	str r4, [fp, #-16]
	ldr r4, =3
	str r4, [fp, #-12]
	ldr r4, =0
	str r4, [fp, #-4]
	b .L89
.L89:
	ldr r4, [fp, #-4]
	ldr r5, =5
	cmp r5, r4
	bgt .L90
	b .L91
.L90:
	ldr r4, [fp, #-16]
	sub  r5, r4, #1
	mov r4, #-116
	mov r6, #20
	mul  r7, r5, r6
	add  r5, r4, r7
	add  r4, fp, r5
	ldr r5, [fp, #-4]
	mov r7, #4
	mul  r6, r5, r7
	add  r5, r4, r6
	ldr r4, [r5]
	str r4, [fp, #-8]
	ldr r4, [fp, #-12]
	sub  r5, r4, #1
	mov r4, #-116
	mov r6, #20
	mul  r7, r5, r6
	add  r5, r4, r7
	add  r4, fp, r5
	ldr r5, [fp, #-4]
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-16]
	sub  r6, r5, #1
	mov r5, #-116
	mov r7, #20
	mul  r8, r6, r7
	add  r6, r5, r8
	add  r5, fp, r6
	ldr r6, [fp, #-4]
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r5, r8
	str r4, [r6]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-12]
	sub  r6, r5, #1
	mov r5, #-116
	mov r7, #20
	mul  r8, r6, r7
	add  r6, r5, r8
	add  r5, fp, r6
	ldr r6, [fp, #-4]
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r5, r8
	str r4, [r6]
	ldr r4, [fp, #-4]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-4]
	b .L89
.L91:
	mov r4, #2
	mov r5, #-116
	mov r6, #20
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	mov r4, #0
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	ldr r5, [r4]
	mov r0, r5
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

