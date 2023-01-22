	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.balign 4
	a: .skip 60
	.text
	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub  sp, sp, #24
.L6:
	mov r4, #0
	mov r5, #-24
	mov r6, #12
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
	mov r4, #1
	ldr r5, addr_a
	mov r6, #20
	mul  r7, r4, r6
	add  r4, r5, r7
	mov r5, r4
	mov r4, #3
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	ldr r5, [r4]
	mov r4, #0
	mov r6, #-24
	mov r7, #12
	mul  r8, r4, r7
	add  r4, r6, r8
	add  r6, fp, r4
	mov r4, #2
	mov r7, #4
	mul  r8, r4, r7
	add  r4, r6, r8
	ldr r6, [r4]
	add  r4, r6, r5
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

addr_a:
	.word a
