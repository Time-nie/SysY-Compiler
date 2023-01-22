	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.text
	.global get_next
	.type get_next , %function
get_next:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub  sp, sp, #16
.L96:
	str r0, [fp, #-16]
	str r1, [fp, #-12]
	ldr r4, =0
	sub  r5, r4, #1
	ldr r4, [fp, #-12]
	mov r6, #0
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r4, r8
	str r5, [r6]
	ldr r4, =0
	str r4, [fp, #-8]
	ldr r4, =0
	sub  r5, r4, #1
	str r5, [fp, #-4]
	b .L104
.L104:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-8]
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	ldr r5, =0
	cmp r4, r5
	bne .L105
	b .L106
.L105:
	ldr r4, =0
	sub  r5, r4, #1
	ldr r4, [fp, #-4]
	cmp r5, r4
	moveq r4, #1
	movne r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L110
	b .L116
.L106:
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L110:
	ldr r4, [fp, #-4]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-4]
	ldr r4, [fp, #-8]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-8]
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-12]
	ldr r6, [fp, #-8]
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r5, r8
	str r4, [r6]
	b .L112
.L111:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-4]
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	str r4, [fp, #-4]
	b .L112
.L112:
	b .L104
.L116:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-4]
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-16]
	ldr r6, [fp, #-8]
	mov r8, #4
	mul  r7, r6, r8
	add  r6, r5, r7
	ldr r5, [r6]
	cmp r4, r5
	moveq r4, #1
	movne r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L110
	b .L111

	.global KMP
	.type KMP , %function
KMP:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	mov r4, #16400
	add  r4, r4, #0
	sub  sp, sp, r4
.L127:
	mov r4, #49136
	add  r4, r4, #16711680
	add  r4, r4, #-16777216
	str r0, [fp, r4]
	mov r4, #49140
	add  r4, r4, #16711680
	add  r4, r4, #-16777216
	str r1, [fp, r4]
	mov r4, #49136
	add  r4, r4, #16711680
	add  r4, r4, #-16777216
	ldr r5, [fp, r4]
	mov r4, #0
	mov r6, #49144
	add  r6, r6, #16711680
	add  r6, r6, #-16777216
	mov r7, #4
	mul  r8, r4, r7
	add  r4, r6, r8
	add  r6, fp, r4
	mov r0, r5
	mov r1, r6
	bl get_next
	ldr r4, =0
	str r4, [fp, #-8]
	ldr r4, =0
	str r4, [fp, #-4]
	b .L136
.L136:
	mov r5, #49140
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	ldr r4, [fp, r5]
	ldr r5, [fp, #-4]
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	ldr r5, =0
	cmp r4, r5
	bne .L137
	b .L138
.L137:
	mov r5, #49140
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	ldr r4, [fp, r5]
	ldr r5, [fp, #-4]
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	mov r6, #49136
	add  r6, r6, #16711680
	add  r6, r6, #-16777216
	ldr r5, [fp, r6]
	ldr r6, [fp, #-8]
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r5, r8
	ldr r5, [r6]
	cmp r4, r5
	beq .L142
	b .L143
.L138:
	ldr r4, =0
	sub  r5, r4, #1
	mov r0, r5
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L142:
	ldr r4, [fp, #-8]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-8]
	ldr r4, [fp, #-4]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-4]
	mov r5, #49136
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	ldr r4, [fp, r5]
	ldr r5, [fp, #-8]
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	ldr r5, =0
	cmp r4, r5
	beq .L150
	b .L151
.L143:
	ldr r4, [fp, #-8]
	mov r5, #49144
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, [r5]
	str r4, [fp, #-8]
	ldr r4, =0
	sub  r5, r4, #1
	ldr r4, [fp, #-8]
	cmp r5, r4
	beq .L156
	b .L157
.L144:
	b .L136
.L150:
	ldr r4, [fp, #-4]
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
	b .L151
.L151:
	b .L144
.L156:
	ldr r4, [fp, #-8]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-8]
	ldr r4, [fp, #-4]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-4]
	b .L157
.L157:
	b .L144

	.global read_str
	.type read_str , %function
read_str:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub  sp, sp, #8
.L159:
	str r0, [fp, #-8]
	ldr r4, =0
	str r4, [fp, #-4]
	b .L163
.L163:
	ldr r4, =1
	ldr r5, =0
	cmp r4, r5
	bne .L164
	b .L165
.L164:
	bl getch
	mov r4, r0
	ldr r5, [fp, #-8]
	ldr r6, [fp, #-4]
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r5, r8
	str r4, [r6]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	mov r7, #4
	mul  r6, r5, r7
	add  r5, r4, r6
	ldr r4, [r5]
	ldr r5, =10
	cmp r5, r4
	beq .L168
	b .L169
.L165:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, =0
	str r4, [r5]
	ldr r4, [fp, #-4]
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L168:
	b .L165
.L169:
	ldr r4, [fp, #-4]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-4]
	b .L163
.L173:
	b .L169

	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	mov r4, #32768
	add  r4, r4, #0
	sub  sp, sp, r4
.L175:
	mov r4, #0
	mov r5, #32768
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	mov r0, r5
	bl read_str
	mov r4, r0
	mov r4, #0
	mov r5, #49152
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	mov r0, r5
	bl read_str
	mov r4, r0
	mov r4, #0
	mov r5, #32768
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	mov r4, #0
	mov r6, #49152
	add  r6, r6, #16711680
	add  r6, r6, #-16777216
	mov r7, #4
	mul  r8, r4, r7
	add  r4, r6, r8
	add  r6, fp, r4
	mov r0, r5
	mov r1, r6
	bl KMP
	mov r4, r0
	mov r0, r4
	bl putint
	mov r0, #10
	bl putch
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

