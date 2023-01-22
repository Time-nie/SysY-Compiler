	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global b
	.align 4
	.size b, 4
b:
	.word 5
	.global c
	.align 4
	.size c, 16
c:
	.word 6
	.word 7
	.word 8
	.word 9
	.text
	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub  sp, sp, #220
.L35:
	ldr r4, =1
	str r4, [fp, #-220]
	ldr r4, =2
	str r4, [fp, #-216]
	ldr r4, =3
	str r4, [fp, #-216]
	ldr r4, [fp, #-216]
	mov r0, r4
	bl putint
	ldr r4, [fp, #-216]
	mov r0, r4
	bl putint
	ldr r4, [fp, #-220]
	mov r0, r4
	bl putint
	mov r0, #10
	bl putch
	b .L38
.L38:
	ldr r4, [fp, #-220]
	ldr r5, =5
	cmp r5, r4
	bgt .L39
	b .L40
.L39:
	ldr r4, =0
	str r4, [fp, #-212]
	ldr r4, [fp, #-212]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-212]
	ldr r4, [fp, #-212]
	ldr r5, =0
	cmp r4, r5
	bne .L43
	b .L44
.L40:
	ldr r4, [fp, #-220]
	mov r0, r4
	bl putint
	mov r0, #10
	bl putch
	mov r4, #2
	ldr r5, addr_c
	mov r7, #4
	mul  r6, r4, r7
	add  r4, r5, r6
	mov r5, r4
	ldr r4, =1
	str r4, [r5]
	mov r4, #0
	mov r5, #-208
	mov r6, #32
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
	ldr r4, =9
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
	ldr r5, =8
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =3
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
	ldr r4, =2
	str r4, [fp, #-144]
	mov r4, #2
	ldr r5, addr_c
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	ldr r5, =0
	cmp r4, r5
	bne .L81
	b .L82
.L43:
	b .L40
.L44:
	b .L38
.L46:
	b .L44
.L81:
	mov r4, #0
	mov r5, #-140
	mov r6, #20
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	mov r4, #0
	mov r6, #20
	mul  r7, r4, r6
	add  r4, r5, r7
	mov r5, #0
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
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
	ldr r4, =2
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =1
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =8
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
	ldr r4, [fp, #-144]
	mov r5, #-140
	mov r6, #20
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	mov r4, #0
	mov r6, #20
	mul  r7, r4, r6
	add  r4, r5, r7
	mov r5, #0
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	mov r0, r4
	bl putint
	ldr r4, [fp, #-144]
	mov r5, #-140
	mov r7, #20
	mul  r6, r4, r7
	add  r4, r5, r6
	add  r5, fp, r4
	mov r4, #0
	mov r6, #20
	mul  r7, r4, r6
	add  r4, r5, r7
	mov r5, #1
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	mov r0, r4
	bl putint
	ldr r4, [fp, #-144]
	mov r5, #-140
	mov r6, #20
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	mov r4, #0
	mov r6, #20
	mul  r7, r4, r6
	add  r4, r5, r7
	mov r5, #2
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	mov r0, r4
	bl putint
	b .L82
.L82:
	mov r0, #10
	bl putch
	ldr r4, addr_b
	ldr r5, [r4]
	mov r0, r5
	bl putint
	mov r0, #10
	bl putch
	mov r4, #0
	ldr r5, addr_c
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	mov r0, r4
	bl putint
	mov r4, #1
	ldr r5, addr_c
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	mov r0, r4
	bl putint
	mov r4, #2
	ldr r5, addr_c
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	mov r0, r4
	bl putint
	mov r4, #3
	ldr r5, addr_c
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	mov r0, r4
	bl putint
	mov r0, #10
	bl putch
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

addr_b:
	.word b
addr_c:
	.word c
