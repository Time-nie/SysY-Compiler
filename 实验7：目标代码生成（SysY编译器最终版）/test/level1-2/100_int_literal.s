	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global s
	.align 4
	.size s, 4
s:
	.word 0
	.text
	.global get_ans_se
	.type get_ans_se , %function
get_ans_se:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub  sp, sp, #16
.L185:
	str r0, [fp, #-16]
	str r1, [fp, #-12]
	str r2, [fp, #-8]
	ldr r4, =0
	str r4, [fp, #-4]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-12]
	cmp r4, r5
	beq .L193
	b .L194
.L193:
	ldr r4, =1
	str r4, [fp, #-4]
	b .L194
.L194:
	ldr r4, [fp, #-16]
	ldr r5, =2
	mul  r6, r5, r4
	str r6, [fp, #-16]
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-4]
	mov r5, r5
	add  r5, r5, r4
	str r5, [fp, #-16]
	ldr r4, addr_s
	ldr r5, [r4]
	ldr r4, [fp, #-16]
	mov r4, r4
	add  r4, r4, r5
	ldr r5, addr_s
	str r4, [r5]
	ldr r4, [fp, #-16]
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, fp, lr}
	bx lr

	.global get_ans
	.type get_ans , %function
get_ans:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub  sp, sp, #16
.L196:
	str r0, [fp, #-16]
	str r1, [fp, #-12]
	str r2, [fp, #-8]
	ldr r4, =0
	str r4, [fp, #-4]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-12]
	cmp r4, r5
	beq .L204
	b .L205
.L204:
	ldr r4, =1
	str r4, [fp, #-4]
	b .L205
.L205:
	ldr r4, [fp, #-16]
	ldr r5, =2
	mul  r6, r5, r4
	str r6, [fp, #-16]
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-4]
	mov r5, r5
	add  r5, r5, r4
	str r5, [fp, #-16]
	ldr r4, [fp, #-16]
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, fp, lr}
	bx lr

	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub  sp, sp, #36
.L207:
	ldr r4, =0
	add  r4, r4, #-2147483648
	sub  r4, r4, #-2147483648
	sub  r5, r4, #-2147483648
	str r5, [fp, #-36]
	ldr r4, =-2147483648
	str r4, [fp, #-32]
	ldr r4, =1
	mov r4, r4
	add  r4, r4, #-2147483648
	str r4, [fp, #-28]
	mov r4, #65535
	add  r4, r4, #16711680
	add  r4, r4, #2130706432
	str r4, [fp, #-24]
	ldr r4, =2147483647
	add  r4, r4, #1
	sub  r4, r4, #1
	sub  r5, r4, #1
	str r5, [fp, #-20]
	ldr r4, [fp, #-36]
	ldr r5, [fp, #-32]
	mov r0, #0
	mov r1, r4
	mov r2, r5
	bl get_ans
	mov r4, r0
	str r4, [fp, #-16]
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-36]
	ldr r6, =1
	mov r6, r6
	add  r6, r6, r5
	ldr r5, [fp, #-28]
	mov r0, r4
	mov r1, r6
	mov r2, r5
	bl get_ans
	mov r4, r0
	str r4, [fp, #-16]
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-36]
	ldr r6, [fp, #-24]
	ldr r7, =0
	add  r7, r7, r6
	sub  r7, r7, r6
	sub  r8, r7, r6
	add  r8, r8, #1
	sub  r8, r8, #1
	sub  r6, r8, #1
	mov r0, r4
	mov r1, r5
	mov r2, r6
	bl get_ans
	mov r4, r0
	str r4, [fp, #-16]
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-36]
	ldr r6, [fp, #-20]
	ldr r7, =1
	mov r7, r7
	add  r7, r7, r6
	mov r0, r4
	mov r1, r5
	mov r2, r7
	bl get_ans
	mov r4, r0
	str r4, [fp, #-16]
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-32]
	ldr r6, =2
	sdiv  r7, r5, r6
	ldr r5, [fp, #-28]
	ldr r6, =2
	sdiv  r8, r5, r6
	mov r0, r4
	mov r1, r7
	mov r2, r8
	bl get_ans
	mov r4, r0
	str r4, [fp, #-16]
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-32]
	ldr r6, [fp, #-24]
	ldr r7, =0
	add  r7, r7, r6
	sub  r7, r7, r6
	sub  r8, r7, r6
	add  r8, r8, #1
	sub  r8, r8, #1
	sub  r6, r8, #1
	mov r0, r4
	mov r1, r5
	mov r2, r6
	bl get_ans
	mov r4, r0
	str r4, [fp, #-16]
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-32]
	ldr r6, [fp, #-20]
	ldr r7, =1
	mov r7, r7
	add  r7, r7, r6
	mov r0, r4
	mov r1, r5
	mov r2, r7
	bl get_ans
	mov r4, r0
	str r4, [fp, #-16]
	ldr r4, [fp, #-28]
	ldr r5, [fp, #-24]
	mov r0, #0
	mov r1, r4
	mov r2, r5
	bl get_ans
	mov r4, r0
	str r4, [fp, #-12]
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-28]
	ldr r6, [fp, #-20]
	mov r0, r4
	mov r1, r5
	mov r2, r6
	bl get_ans
	mov r4, r0
	str r4, [fp, #-12]
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-24]
	ldr r6, [fp, #-20]
	mov r0, r4
	mov r1, r5
	mov r2, r6
	bl get_ans
	mov r4, r0
	str r4, [fp, #-12]
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-36]
	ldr r6, =2
	sdiv  r7, r5, r6
	ldr r5, [fp, #-32]
	ldr r6, =2
	sdiv  r8, r5, r6
	mov r0, r4
	mov r1, r7
	mov r2, r8
	bl get_ans
	mov r4, r0
	str r4, [fp, #-12]
	ldr r4, [fp, #-36]
	ldr r5, [fp, #-32]
	mov r0, #0
	mov r1, r4
	mov r2, r5
	bl get_ans_se
	mov r4, r0
	str r4, [fp, #-8]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-36]
	ldr r6, =1
	mov r6, r6
	add  r6, r6, r5
	ldr r5, [fp, #-28]
	mov r0, r4
	mov r1, r6
	mov r2, r5
	bl get_ans_se
	mov r4, r0
	str r4, [fp, #-8]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-36]
	ldr r6, [fp, #-24]
	ldr r7, =0
	add  r7, r7, r6
	sub  r7, r7, r6
	sub  r8, r7, r6
	add  r8, r8, #1
	sub  r8, r8, #1
	sub  r6, r8, #1
	mov r0, r4
	mov r1, r5
	mov r2, r6
	bl get_ans_se
	mov r4, r0
	str r4, [fp, #-8]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-36]
	ldr r6, [fp, #-20]
	ldr r7, =1
	mov r7, r7
	add  r7, r7, r6
	mov r0, r4
	mov r1, r5
	mov r2, r7
	bl get_ans_se
	mov r4, r0
	str r4, [fp, #-8]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-32]
	ldr r6, =2
	sdiv  r7, r5, r6
	ldr r5, [fp, #-28]
	ldr r6, =2
	sdiv  r8, r5, r6
	mov r0, r4
	mov r1, r7
	mov r2, r8
	bl get_ans_se
	mov r4, r0
	str r4, [fp, #-8]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-32]
	ldr r6, [fp, #-24]
	ldr r7, =0
	add  r7, r7, r6
	sub  r7, r7, r6
	sub  r8, r7, r6
	add  r8, r8, #1
	sub  r8, r8, #1
	sub  r6, r8, #1
	mov r0, r4
	mov r1, r5
	mov r2, r6
	bl get_ans_se
	mov r4, r0
	str r4, [fp, #-8]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-32]
	ldr r6, [fp, #-20]
	ldr r7, =1
	mov r7, r7
	add  r7, r7, r6
	mov r0, r4
	mov r1, r5
	mov r2, r7
	bl get_ans_se
	mov r4, r0
	str r4, [fp, #-8]
	ldr r4, [fp, #-28]
	ldr r5, [fp, #-24]
	mov r0, #0
	mov r1, r4
	mov r2, r5
	bl get_ans_se
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-28]
	ldr r6, [fp, #-20]
	mov r0, r4
	mov r1, r5
	mov r2, r6
	bl get_ans_se
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-24]
	ldr r6, [fp, #-20]
	mov r0, r4
	mov r1, r5
	mov r2, r6
	bl get_ans_se
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-36]
	ldr r6, =2
	sdiv  r7, r5, r6
	ldr r5, [fp, #-32]
	ldr r6, =2
	sdiv  r8, r5, r6
	mov r0, r4
	mov r1, r7
	mov r2, r8
	bl get_ans_se
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-12]
	mov r5, r5
	add  r5, r5, r4
	ldr r4, [fp, #-8]
	mov r4, r4
	add  r4, r4, r5
	ldr r5, [fp, #-4]
	mov r5, r5
	add  r5, r5, r4
	mov r0, r5
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

addr_s:
	.word s
