	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.text
	.global removeElement
	.type removeElement , %function
removeElement:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub  sp, sp, #16
.L47:
	str r0, [fp, #-16]
	str r1, [fp, #-12]
	str r2, [fp, #-8]
	ldr r4, =0
	str r4, [fp, #-4]
	b .L55
.L55:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-4]
	cmp r4, r5
	bgt .L56
	b .L57
.L56:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-16]
	ldr r6, [fp, #-4]
	mov r8, #4
	mul  r7, r6, r8
	add  r6, r5, r7
	ldr r5, [r6]
	cmp r4, r5
	beq .L59
	b .L60
.L57:
	ldr r4, [fp, #-12]
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L59:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-12]
	sub  r6, r5, #1
	mov r5, #4
	mul  r7, r6, r5
	add  r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-16]
	ldr r6, [fp, #-4]
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r5, r8
	str r4, [r6]
	ldr r4, [fp, #-12]
	sub  r5, r4, #1
	str r5, [fp, #-12]
	b .L61
.L60:
	ldr r4, [fp, #-4]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-4]
	b .L61
.L61:
	b .L55

	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub  sp, sp, #48
.L68:
	mov r4, #0
	mov r5, #-44
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =3
	str r4, [r5]
	mov r4, #1
	mov r5, #-44
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =3
	str r4, [r5]
	mov r4, #2
	mov r5, #-44
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =9
	str r4, [r5]
	mov r4, #3
	mov r5, #-44
	mov r7, #4
	mul  r6, r4, r7
	add  r4, r5, r6
	add  r5, fp, r4
	ldr r4, =0
	str r4, [r5]
	mov r4, #4
	mov r5, #-44
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =0
	str r4, [r5]
	mov r4, #5
	mov r5, #-44
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =1
	str r4, [r5]
	mov r4, #6
	mov r5, #-44
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =1
	str r4, [r5]
	mov r4, #7
	mov r5, #-44
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =5
	str r4, [r5]
	mov r4, #8
	mov r5, #-44
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =7
	str r4, [r5]
	mov r4, #9
	mov r5, #-44
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =8
	str r4, [r5]
	ldr r4, =10
	str r4, [fp, #-48]
	ldr r4, =3
	str r4, [fp, #-4]
	mov r4, #0
	mov r5, #-44
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, [fp, #-48]
	ldr r6, [fp, #-4]
	mov r0, r5
	mov r1, r4
	mov r2, r6
	bl removeElement
	mov r4, r0
	str r4, [fp, #-48]
	ldr r4, [fp, #-48]
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

