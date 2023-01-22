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
	sub  sp, sp, #188
.L15:
	mov r4, #0
	mov r5, #-188
	mov r6, #12
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	mov r4, #0
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	ldr r5, =0
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =0
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =0
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =0
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =0
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =0
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =0
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =0
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =0
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =0
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =0
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =0
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =0
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =0
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =0
	str r5, [r4]
	mov r4, #0
	mov r5, #-128
	mov r6, #8
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
	ldr r4, =2
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =3
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =4
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =5
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =6
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =7
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =8
	str r4, [r5]
	mov r4, #0
	mov r5, #-96
	mov r6, #8
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
	ldr r4, =2
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =3
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =4
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =5
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =6
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =7
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =8
	str r4, [r5]
	mov r4, #0
	mov r5, #-64
	mov r6, #8
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
	ldr r4, =2
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =3
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =0
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =5
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =0
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =7
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =8
	str r4, [r5]
	mov r4, #2
	mov r5, #-64
	mov r6, #8
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	mov r4, #1
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	ldr r5, [r4]
	mov r4, #0
	mov r6, #-32
	mov r7, #8
	mul  r8, r4, r7
	add  r4, r6, r8
	add  r6, fp, r4
	mov r4, #0
	mov r7, #4
	mul  r8, r4, r7
	add  r4, r6, r8
	str r5, [r4]
	mov r5, #2
	mov r6, #-96
	mov r7, #8
	mul  r8, r5, r7
	add  r5, r6, r8
	add  r6, fp, r5
	mov r5, #1
	mov r7, #4
	mul  r8, r5, r7
	add  r5, r6, r8
	ldr r6, [r5]
	add  r5, r4, #4
	str r6, [r5]
	add  r4, r5, #4
	ldr r5, =3
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =4
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =5
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =6
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =7
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =8
	str r4, [r5]
	mov r4, #3
	mov r5, #-32
	mov r6, #8
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	mov r4, #1
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	ldr r5, [r4]
	mov r4, #0
	mov r6, #-32
	mov r7, #8
	mul  r8, r4, r7
	add  r4, r6, r8
	add  r6, fp, r4
	mov r4, #0
	mov r7, #4
	mul  r8, r4, r7
	add  r4, r6, r8
	ldr r6, [r4]
	add  r4, r6, r5
	mov r5, #0
	mov r6, #-32
	mov r7, #8
	mul  r8, r5, r7
	add  r5, r6, r8
	add  r6, fp, r5
	mov r5, #1
	mov r8, #4
	mul  r7, r5, r8
	add  r5, r6, r7
	ldr r6, [r5]
	add  r5, r6, r4
	mov r4, #2
	mov r6, #-188
	mov r7, #12
	mul  r8, r4, r7
	add  r4, r6, r8
	add  r6, fp, r4
	mov r4, #0
	mov r7, #4
	mul  r8, r4, r7
	add  r4, r6, r8
	ldr r6, [r4]
	add  r4, r6, r5
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

