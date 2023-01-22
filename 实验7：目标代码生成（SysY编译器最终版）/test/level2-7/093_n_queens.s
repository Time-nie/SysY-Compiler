	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.balign 4
	ans: .skip 200
	.global sum
	.align 4
	.size sum, 4
sum:
	.word 0
	.global n
	.align 4
	.size n, 4
n:
	.word 0
	.balign 4
	row: .skip 200
	.balign 4
	line1: .skip 200
	.balign 4
	line2: .skip 400
	.text
	.global printans
	.type printans , %function
printans:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub  sp, sp, #4
.L89:
	ldr r4, addr_sum
	ldr r5, [r4]
	ldr r4, =1
	add  r6, r4, r5
	ldr r4, addr_sum
	str r6, [r4]
	ldr r4, =1
	str r4, [fp, #-4]
	b .L91
.L91:
	ldr r4, addr_n
	ldr r5, [r4]
	ldr r4, [fp, #-4]
	cmp r5, r4
	bge .L92
	b .L93
.L92:
	ldr r4, [fp, #-4]
	ldr r5, addr_ans
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	mov r0, r4
	bl putint
	ldr r4, addr_n
	ldr r5, [r4]
	ldr r4, [fp, #-4]
	cmp r5, r4
	beq .L96
	b .L97
.L93:
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L96:
	mov r0, #10
	bl putch
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
	b .L98
.L97:
	mov r0, #32
	bl putch
	b .L98
.L98:
	ldr r4, [fp, #-4]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-4]
	b .L91

	.global f
	.type f , %function
f:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub  sp, sp, #8
.L100:
	str r0, [fp, #-8]
	ldr r4, =1
	str r4, [fp, #-4]
	b .L104
.L104:
	ldr r4, addr_n
	ldr r5, [r4]
	ldr r4, [fp, #-4]
	cmp r5, r4
	bge .L105
	b .L106
.L105:
	ldr r4, [fp, #-4]
	ldr r5, addr_row
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	ldr r5, =1
	cmp r5, r4
	movne r4, #1
	moveq r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L114
	b .L109
.L106:
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L108:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-8]
	ldr r6, addr_ans
	mov r7, #4
	mul  r8, r5, r7
	add  r5, r6, r8
	mov r6, r5
	str r4, [r6]
	ldr r4, addr_n
	ldr r5, [r4]
	ldr r4, [fp, #-8]
	cmp r5, r4
	beq .L124
	b .L125
.L109:
	ldr r4, [fp, #-4]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-4]
	b .L104
.L114:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	add  r6, r5, r4
	ldr r4, addr_line1
	mov r5, #4
	mul  r7, r6, r5
	add  r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	ldr r4, =0
	cmp r4, r5
	moveq r4, #1
	movne r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L119
	b .L109
.L119:
	ldr r4, addr_n
	ldr r5, [r4]
	ldr r4, [fp, #-8]
	add  r6, r4, r5
	ldr r4, [fp, #-4]
	sub  r5, r6, r4
	ldr r4, addr_line2
	mov r7, #4
	mul  r6, r5, r7
	add  r5, r4, r6
	mov r4, r5
	ldr r5, [r4]
	ldr r4, =0
	cmp r5, r4
	moveq r4, #1
	movne r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L108
	b .L109
.L124:
	bl printans
	b .L125
.L125:
	ldr r4, [fp, #-4]
	ldr r5, addr_row
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	mov r5, r4
	ldr r4, =1
	str r4, [r5]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	add  r6, r5, r4
	ldr r4, addr_line1
	mov r5, #4
	mul  r7, r6, r5
	add  r5, r4, r7
	mov r4, r5
	ldr r5, =1
	str r5, [r4]
	ldr r4, addr_n
	ldr r5, [r4]
	ldr r4, [fp, #-8]
	add  r6, r4, r5
	ldr r4, [fp, #-4]
	sub  r5, r6, r4
	ldr r4, addr_line2
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	mov r4, r5
	ldr r5, =1
	str r5, [r4]
	ldr r4, [fp, #-8]
	ldr r5, =1
	add  r6, r5, r4
	mov r0, r6
	bl f
	ldr r4, [fp, #-4]
	ldr r5, addr_row
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	mov r5, r4
	ldr r4, =0
	str r4, [r5]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	add  r6, r5, r4
	ldr r4, addr_line1
	mov r5, #4
	mul  r7, r6, r5
	add  r5, r4, r7
	mov r4, r5
	ldr r5, =0
	str r5, [r4]
	ldr r4, addr_n
	ldr r5, [r4]
	ldr r4, [fp, #-8]
	add  r6, r4, r5
	ldr r4, [fp, #-4]
	sub  r5, r6, r4
	ldr r4, addr_line2
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	mov r4, r5
	ldr r5, =0
	str r5, [r4]
	b .L109

	.global main
	.type main , %function
main:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub  sp, sp, #4
.L127:
	bl getint
	mov r4, r0
	str r4, [fp, #-4]
	b .L129
.L129:
	ldr r4, [fp, #-4]
	ldr r5, =0
	cmp r5, r4
	blt .L130
	b .L131
.L130:
	bl getint
	mov r4, r0
	ldr r5, addr_n
	str r4, [r5]
	mov r0, #1
	bl f
	ldr r4, [fp, #-4]
	sub  r5, r4, #1
	str r5, [fp, #-4]
	b .L129
.L131:
	ldr r4, addr_sum
	ldr r5, [r4]
	mov r0, r5
	sub  sp, fp, #0
	pop {r4, r5, fp, lr}
	bx lr

addr_ans:
	.word ans
addr_sum:
	.word sum
addr_n:
	.word n
addr_row:
	.word row
addr_line1:
	.word line1
addr_line2:
	.word line2
