	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.balign 4
	buf: .skip 800
	.text
	.global merge_sort
	.type merge_sort , %function
merge_sort:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub  sp, sp, #24
.L94:
	str r0, [fp, #-24]
	str r1, [fp, #-20]
	ldr r4, [fp, #-24]
	add  r5, r4, #1
	ldr r4, [fp, #-20]
	cmp r5, r4
	bge .L99
	b .L100
.L99:
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
	b .L100
.L100:
	ldr r4, [fp, #-20]
	ldr r5, [fp, #-24]
	add  r6, r5, r4
	ldr r4, =2
	sdiv  r5, r6, r4
	str r5, [fp, #-16]
	ldr r4, [fp, #-24]
	ldr r5, [fp, #-16]
	mov r0, r4
	mov r1, r5
	bl merge_sort
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-20]
	mov r0, r4
	mov r1, r5
	bl merge_sort
	ldr r4, [fp, #-24]
	str r4, [fp, #-12]
	ldr r4, [fp, #-16]
	str r4, [fp, #-8]
	ldr r4, [fp, #-24]
	str r4, [fp, #-4]
	b .L106
.L106:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-16]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L112
	b .L108
.L107:
	mov r4, #0
	ldr r5, addr_buf
	ldr r6, =400
	mul  r7, r4, r6
	add  r4, r5, r7
	mov r5, r4
	ldr r4, [fp, #-12]
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	ldr r5, [r4]
	mov r4, #0
	ldr r6, addr_buf
	ldr r7, =400
	mul  r8, r4, r7
	add  r4, r6, r8
	mov r6, r4
	ldr r4, [fp, #-8]
	mov r7, #4
	mul  r8, r4, r7
	add  r4, r6, r8
	ldr r6, [r4]
	cmp r5, r6
	blt .L116
	b .L117
.L108:
	b .L130
.L112:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-20]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L107
	b .L108
.L116:
	mov r4, #0
	ldr r5, addr_buf
	ldr r7, =400
	mul  r6, r4, r7
	add  r4, r5, r6
	mov r5, r4
	ldr r4, [fp, #-12]
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	ldr r5, [r4]
	mov r4, #1
	ldr r6, addr_buf
	ldr r8, =400
	mul  r7, r4, r8
	add  r4, r6, r7
	mov r6, r4
	ldr r4, [fp, #-4]
	mov r7, #4
	mul  r8, r4, r7
	add  r4, r6, r8
	str r5, [r4]
	ldr r4, [fp, #-12]
	add  r5, r4, #1
	str r5, [fp, #-12]
	b .L118
.L117:
	mov r4, #0
	ldr r5, addr_buf
	ldr r6, =400
	mul  r7, r4, r6
	add  r4, r5, r7
	mov r5, r4
	ldr r4, [fp, #-8]
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	ldr r5, [r4]
	mov r4, #1
	ldr r6, addr_buf
	ldr r7, =400
	mul  r8, r4, r7
	add  r4, r6, r8
	mov r6, r4
	ldr r4, [fp, #-4]
	mov r7, #4
	mul  r8, r4, r7
	add  r4, r6, r8
	str r5, [r4]
	ldr r4, [fp, #-8]
	add  r5, r4, #1
	str r5, [fp, #-8]
	b .L118
.L118:
	ldr r4, [fp, #-4]
	add  r5, r4, #1
	str r5, [fp, #-4]
	b .L106
.L130:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-16]
	cmp r4, r5
	blt .L131
	b .L132
.L131:
	mov r4, #0
	ldr r5, addr_buf
	ldr r6, =400
	mul  r7, r4, r6
	add  r4, r5, r7
	mov r5, r4
	ldr r4, [fp, #-12]
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	ldr r5, [r4]
	mov r4, #1
	ldr r6, addr_buf
	ldr r8, =400
	mul  r7, r4, r8
	add  r4, r6, r7
	mov r6, r4
	ldr r4, [fp, #-4]
	mov r7, #4
	mul  r8, r4, r7
	add  r4, r6, r8
	str r5, [r4]
	ldr r4, [fp, #-12]
	add  r5, r4, #1
	str r5, [fp, #-12]
	ldr r4, [fp, #-4]
	add  r5, r4, #1
	str r5, [fp, #-4]
	b .L130
.L132:
	b .L137
.L137:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-20]
	cmp r4, r5
	blt .L138
	b .L139
.L138:
	mov r4, #0
	ldr r5, addr_buf
	ldr r6, =400
	mul  r7, r4, r6
	add  r4, r5, r7
	mov r5, r4
	ldr r4, [fp, #-8]
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	ldr r5, [r4]
	mov r4, #1
	ldr r6, addr_buf
	ldr r7, =400
	mul  r8, r4, r7
	add  r4, r6, r8
	mov r6, r4
	ldr r4, [fp, #-4]
	mov r7, #4
	mul  r8, r4, r7
	add  r4, r6, r8
	str r5, [r4]
	ldr r4, [fp, #-8]
	add  r5, r4, #1
	str r5, [fp, #-8]
	ldr r4, [fp, #-4]
	add  r5, r4, #1
	str r5, [fp, #-4]
	b .L137
.L139:
	b .L144
.L144:
	ldr r4, [fp, #-24]
	ldr r5, [fp, #-20]
	cmp r4, r5
	blt .L145
	b .L146
.L145:
	mov r4, #1
	ldr r5, addr_buf
	ldr r6, =400
	mul  r7, r4, r6
	add  r4, r5, r7
	mov r5, r4
	ldr r4, [fp, #-24]
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	ldr r5, [r4]
	mov r4, #0
	ldr r6, addr_buf
	ldr r7, =400
	mul  r8, r4, r7
	add  r4, r6, r8
	mov r6, r4
	ldr r4, [fp, #-24]
	mov r7, #4
	mul  r8, r4, r7
	add  r4, r6, r8
	str r5, [r4]
	ldr r4, [fp, #-24]
	add  r5, r4, #1
	str r5, [fp, #-24]
	b .L144
.L146:
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub  sp, sp, #4
.L151:
	mov r4, #0
	ldr r5, addr_buf
	ldr r6, =400
	mul  r7, r4, r6
	add  r4, r5, r7
	mov r5, r4
	mov r4, #0
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	mov r0, r4
	bl getarray
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, #0
	mov r1, r4
	bl merge_sort
	ldr r4, [fp, #-4]
	mov r5, #0
	ldr r6, addr_buf
	ldr r7, =400
	mul  r8, r5, r7
	add  r5, r6, r8
	mov r6, r5
	mov r5, #0
	mov r7, #4
	mul  r8, r5, r7
	add  r5, r6, r8
	mov r0, r4
	mov r1, r5
	bl putarray
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

addr_buf:
	.word buf
