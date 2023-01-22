	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.balign 4
	V: .skip 160000
	.text
	.global KnapSack
	.type KnapSack , %function
KnapSack:
	push {r4, r5, r6, r7, r8, r9, fp, lr}
	mov fp, sp
	sub  sp, sp, #36
.L108:
	str r0, [fp, #-36]
	str r1, [fp, #-32]
	str r2, [fp, #-28]
	str r3, [fp, #-24]
	ldr r4, [fp, #32]
	str r4, [fp, #-20]
	ldr r4, =1
	str r4, [fp, #-16]
	b .L121
.L121:
	ldr r4, [fp, #-36]
	ldr r5, [fp, #-16]
	cmp r4, r5
	bge .L122
	b .L123
.L122:
	ldr r4, =0
	str r4, [fp, #-12]
	b .L125
.L123:
	ldr r4, [fp, #-20]
	str r4, [fp, #-12]
	ldr r4, [fp, #-36]
	str r4, [fp, #-16]
	b .L154
.L125:
	ldr r4, [fp, #-20]
	ldr r5, =1
	add  r6, r5, r4
	ldr r4, [fp, #-12]
	cmp r6, r4
	bgt .L126
	b .L127
.L126:
	ldr r4, [fp, #-32]
	ldr r5, [fp, #-16]
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-12]
	cmp r4, r5
	bgt .L129
	b .L130
.L127:
	ldr r4, [fp, #-16]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-16]
	b .L121
.L129:
	ldr r4, [fp, #-16]
	sub  r5, r4, #1
	ldr r4, addr_V
	mov r6, #800
	add  r6, r6, #0
	mov r6, #800
	mul  r7, r5, r6
	add  r5, r4, r7
	mov r4, r5
	ldr r5, [fp, #-12]
	mov r7, #4
	mul  r6, r5, r7
	add  r5, r4, r6
	ldr r4, [r5]
	ldr r5, [fp, #-16]
	ldr r6, addr_V
	mov r7, #800
	add  r7, r7, #0
	mov r7, #800
	mul  r8, r5, r7
	add  r5, r6, r8
	mov r6, r5
	ldr r5, [fp, #-12]
	mov r7, #4
	mul  r8, r5, r7
	add  r5, r6, r8
	str r4, [r5]
	b .L131
.L130:
	ldr r4, [fp, #-16]
	sub  r5, r4, #1
	ldr r4, addr_V
	mov r6, #800
	add  r6, r6, #0
	mov r6, #800
	mul  r7, r5, r6
	add  r5, r4, r7
	mov r4, r5
	ldr r5, [fp, #-12]
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	str r4, [fp, #-8]
	ldr r4, [fp, #-16]
	sub  r5, r4, #1
	ldr r4, addr_V
	mov r6, #800
	add  r6, r6, #0
	mov r6, #800
	mul  r7, r5, r6
	add  r5, r4, r7
	mov r4, r5
	ldr r5, [fp, #-12]
	ldr r6, [fp, #-32]
	ldr r7, [fp, #-16]
	mov r8, #4
	mul  r9, r7, r8
	add  r7, r6, r9
	ldr r6, [r7]
	sub  r7, r5, r6
	mov r6, #4
	mul  r5, r7, r6
	add  r6, r4, r5
	ldr r4, [r6]
	ldr r5, [fp, #-28]
	ldr r6, [fp, #-16]
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r5, r8
	ldr r5, [r6]
	add  r6, r5, r4
	str r6, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-8]
	cmp r4, r5
	blt .L148
	b .L149
.L131:
	ldr r4, [fp, #-12]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-12]
	b .L125
.L148:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-16]
	ldr r6, addr_V
	mov r7, #800
	add  r7, r7, #0
	mov r7, #800
	mul  r8, r5, r7
	add  r5, r6, r8
	mov r6, r5
	ldr r5, [fp, #-12]
	mov r7, #4
	mul  r8, r5, r7
	add  r5, r6, r8
	str r4, [r5]
	b .L150
.L149:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-16]
	ldr r6, addr_V
	mov r7, #800
	add  r7, r7, #0
	mov r7, #800
	mul  r8, r5, r7
	add  r5, r6, r8
	mov r6, r5
	ldr r5, [fp, #-12]
	mov r7, #4
	mul  r8, r5, r7
	add  r5, r6, r8
	str r4, [r5]
	b .L150
.L150:
	b .L131
.L154:
	ldr r4, [fp, #-16]
	ldr r5, =1
	cmp r5, r4
	ble .L155
	b .L156
.L155:
	ldr r4, [fp, #-16]
	sub  r5, r4, #1
	ldr r4, addr_V
	mov r6, #800
	add  r6, r6, #0
	mov r6, #800
	mul  r7, r5, r6
	add  r5, r4, r7
	mov r4, r5
	ldr r5, [fp, #-12]
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-16]
	ldr r6, addr_V
	mov r7, #800
	add  r7, r7, #0
	mov r7, #800
	mul  r8, r5, r7
	add  r5, r6, r8
	mov r6, r5
	ldr r5, [fp, #-12]
	mov r7, #4
	mul  r8, r5, r7
	add  r5, r6, r8
	ldr r6, [r5]
	cmp r4, r6
	blt .L158
	b .L159
.L156:
	ldr r4, [fp, #-36]
	ldr r5, addr_V
	mov r6, #800
	add  r6, r6, #0
	mov r6, #800
	mul  r7, r4, r6
	add  r4, r5, r7
	mov r5, r4
	ldr r4, [fp, #-20]
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	ldr r5, [r4]
	mov r0, r5
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, r9, fp, lr}
	bx lr
.L158:
	ldr r4, [fp, #-24]
	ldr r5, [fp, #-16]
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, =1
	str r4, [r5]
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-32]
	ldr r6, [fp, #-16]
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r5, r8
	ldr r5, [r6]
	sub  r6, r4, r5
	str r6, [fp, #-12]
	b .L160
.L159:
	ldr r4, [fp, #-24]
	ldr r5, [fp, #-16]
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, =0
	str r4, [r5]
	b .L160
.L160:
	ldr r4, [fp, #-16]
	sub  r5, r4, #1
	str r5, [fp, #-16]
	b .L154

	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov fp, sp
	sub  sp, sp, #88
.L172:
	mov r4, #0
	mov r5, #-80
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =0
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =2
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =2
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =6
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =5
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =4
	str r5, [r4]
	mov r4, #0
	mov r5, #-56
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =0
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =6
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =3
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =5
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =4
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =6
	str r5, [r4]
	ldr r4, =5
	str r4, [fp, #-8]
	ldr r4, =10
	str r4, [fp, #-4]
	ldr r4, [fp, #-8]
	mov r5, #0
	mov r6, #-80
	mov r7, #4
	mul  r8, r5, r7
	add  r5, r6, r8
	add  r6, fp, r5
	mov r5, #0
	mov r7, #-56
	mov r8, #4
	mul  r9, r5, r8
	add  r5, r7, r9
	add  r7, fp, r5
	mov r5, #0
	mov r8, #-32
	mov r9, #4
	mul  r10, r5, r9
	add  r5, r8, r10
	add  r8, fp, r5
	ldr r5, [fp, #-4]
	mov r0, r4
	mov r1, r6
	mov r2, r7
	mov r3, r8
	mov r4, r5
	str r4, [sp, #-4]
	sub  sp, sp, #4
	bl KnapSack
	add  sp, sp, #4
	mov r4, r0
	str r4, [fp, #-84]
	ldr r4, [fp, #-84]
	mov r0, r4
	bl putint
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr

addr_V:
	.word V
