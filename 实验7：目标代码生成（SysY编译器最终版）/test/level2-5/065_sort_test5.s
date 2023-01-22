	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global n
	.align 4
	.size n, 4
n:
	.word 0
	.text
	.global swap
	.type swap , %function
swap:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub  sp, sp, #16
.L139:
	str r0, [fp, #-16]
	str r1, [fp, #-12]
	str r2, [fp, #-8]
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-12]
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	str r4, [fp, #-4]
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-8]
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-16]
	ldr r6, [fp, #-12]
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r5, r8
	str r4, [r6]
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-16]
	ldr r6, [fp, #-8]
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r5, r8
	str r4, [r6]
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

	.global heap_ajust
	.type heap_ajust , %function
heap_ajust:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub  sp, sp, #20
.L153:
	str r0, [fp, #-20]
	str r1, [fp, #-16]
	str r2, [fp, #-12]
	ldr r4, [fp, #-16]
	str r4, [fp, #-8]
	ldr r4, [fp, #-8]
	ldr r5, =2
	mul  r6, r5, r4
	add  r4, r6, #1
	str r4, [fp, #-4]
	b .L162
.L162:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-12]
	add  r6, r5, #1
	cmp r4, r6
	blt .L163
	b .L164
.L163:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-12]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L171
	b .L167
.L164:
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L166:
	ldr r4, [fp, #-4]
	add  r5, r4, #1
	str r5, [fp, #-4]
	b .L167
.L167:
	ldr r4, [fp, #-20]
	ldr r5, [fp, #-8]
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-20]
	ldr r6, [fp, #-4]
	mov r8, #4
	mul  r7, r6, r8
	add  r6, r5, r7
	ldr r5, [r6]
	cmp r4, r5
	bgt .L179
	b .L180
.L171:
	ldr r4, [fp, #-20]
	ldr r5, [fp, #-4]
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-20]
	ldr r6, [fp, #-4]
	add  r7, r6, #1
	mov r6, #4
	mul  r8, r7, r6
	add  r6, r5, r8
	ldr r5, [r6]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L166
	b .L167
.L179:
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
	b .L181
.L180:
	ldr r4, [fp, #-20]
	ldr r5, [fp, #-8]
	ldr r6, [fp, #-4]
	mov r0, r4
	mov r1, r5
	mov r2, r6
	bl swap
	mov r4, r0
	str r4, [fp, #-8]
	ldr r4, [fp, #-4]
	str r4, [fp, #-8]
	ldr r4, [fp, #-8]
	ldr r5, =2
	mul  r6, r5, r4
	add  r4, r6, #1
	str r4, [fp, #-4]
	b .L181
.L181:
	b .L162

	.global heap_sort
	.type heap_sort , %function
heap_sort:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub  sp, sp, #20
.L188:
	str r0, [fp, #-20]
	str r1, [fp, #-16]
	ldr r4, [fp, #-16]
	ldr r5, =2
	sdiv  r6, r4, r5
	sub  r4, r6, #1
	str r4, [fp, #-12]
	b .L195
.L195:
	ldr r4, [fp, #-12]
	ldr r5, =0
	sub  r6, r5, #1
	cmp r4, r6
	bgt .L196
	b .L197
.L196:
	ldr r4, [fp, #-16]
	sub  r5, r4, #1
	str r5, [fp, #-8]
	ldr r4, [fp, #-20]
	ldr r5, [fp, #-12]
	ldr r6, [fp, #-8]
	mov r0, r4
	mov r1, r5
	mov r2, r6
	bl heap_ajust
	mov r4, r0
	str r4, [fp, #-8]
	ldr r4, [fp, #-12]
	sub  r5, r4, #1
	str r5, [fp, #-12]
	b .L195
.L197:
	ldr r4, [fp, #-16]
	sub  r5, r4, #1
	str r5, [fp, #-12]
	b .L200
.L200:
	ldr r4, [fp, #-12]
	ldr r5, =0
	cmp r4, r5
	bgt .L201
	b .L202
.L201:
	ldr r4, =0
	str r4, [fp, #-4]
	ldr r4, [fp, #-20]
	ldr r5, [fp, #-4]
	ldr r6, [fp, #-12]
	mov r0, r4
	mov r1, r5
	mov r2, r6
	bl swap
	mov r4, r0
	str r4, [fp, #-8]
	ldr r4, [fp, #-12]
	sub  r5, r4, #1
	str r5, [fp, #-8]
	ldr r4, [fp, #-20]
	ldr r5, [fp, #-4]
	ldr r6, [fp, #-8]
	mov r0, r4
	mov r1, r5
	mov r2, r6
	bl heap_ajust
	mov r4, r0
	str r4, [fp, #-8]
	ldr r4, [fp, #-12]
	sub  r5, r4, #1
	str r5, [fp, #-12]
	b .L200
.L202:
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, r6, fp, lr}
	bx lr

	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub  sp, sp, #48
.L207:
	ldr r4, =10
	ldr r5, addr_n
	str r4, [r5]
	mov r4, #0
	mov r5, #-48
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =4
	str r4, [r5]
	mov r4, #1
	mov r5, #-48
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =3
	str r4, [r5]
	mov r4, #2
	mov r5, #-48
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =9
	str r4, [r5]
	mov r4, #3
	mov r5, #-48
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =2
	str r4, [r5]
	mov r4, #4
	mov r5, #-48
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =0
	str r4, [r5]
	mov r4, #5
	mov r5, #-48
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =1
	str r4, [r5]
	mov r4, #6
	mov r5, #-48
	mov r7, #4
	mul  r6, r4, r7
	add  r4, r5, r6
	add  r5, fp, r4
	ldr r4, =6
	str r4, [r5]
	mov r4, #7
	mov r5, #-48
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =5
	str r4, [r5]
	mov r4, #8
	mov r5, #-48
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =7
	str r4, [r5]
	mov r4, #9
	mov r5, #-48
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =8
	str r4, [r5]
	ldr r4, =0
	str r4, [fp, #-8]
	mov r4, #0
	mov r5, #-48
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, addr_n
	ldr r6, [r4]
	mov r0, r5
	mov r1, r6
	bl heap_sort
	mov r4, r0
	str r4, [fp, #-8]
	b .L210
.L210:
	ldr r4, [fp, #-8]
	ldr r5, addr_n
	ldr r6, [r5]
	cmp r4, r6
	blt .L211
	b .L212
.L211:
	ldr r4, [fp, #-8]
	mov r5, #-48
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, [r5]
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putint
	ldr r4, =10
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putch
	ldr r4, [fp, #-8]
	add  r5, r4, #1
	str r5, [fp, #-8]
	b .L210
.L212:
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

addr_n:
	.word n
