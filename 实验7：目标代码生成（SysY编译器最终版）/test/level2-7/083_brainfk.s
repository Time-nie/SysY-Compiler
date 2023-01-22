	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global TAPE_LEN
	.align 4
	.size TAPE_LEN, 4
TAPE_LEN:
	.word 65536
	.global BUFFER_LEN
	.align 4
	.size BUFFER_LEN, 4
BUFFER_LEN:
	.word 32768
	.balign 4
	tape: .skip 262144
	.balign 4
	program: .skip 131072
	.global ptr
	.align 4
	.size ptr, 4
ptr:
	.word 0
	.text
	.global read_program
	.type read_program , %function
read_program:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub  sp, sp, #8
.L93:
	ldr r4, =0
	str r4, [fp, #-8]
	bl getint
	mov r4, r0
	str r4, [fp, #-4]
	b .L96
.L96:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-8]
	cmp r4, r5
	bgt .L97
	b .L98
.L97:
	bl getch
	mov r4, r0
	ldr r5, [fp, #-8]
	ldr r6, addr_program
	mov r8, #4
	mul  r7, r5, r8
	add  r5, r6, r7
	mov r6, r5
	str r4, [r6]
	ldr r4, [fp, #-8]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-8]
	b .L96
.L98:
	ldr r4, [fp, #-8]
	ldr r5, addr_program
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	mov r5, r4
	ldr r4, =0
	str r4, [r5]
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

	.global interpret
	.type interpret , %function
interpret:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub  sp, sp, #16
.L100:
	str r0, [fp, #-16]
	ldr r4, =0
	str r4, [fp, #-4]
	b .L106
.L106:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-4]
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	ldr r5, =0
	cmp r4, r5
	bne .L107
	b .L108
.L107:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-4]
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	str r4, [fp, #-12]
	ldr r4, [fp, #-12]
	ldr r5, =62
	cmp r5, r4
	beq .L114
	b .L115
.L108:
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L114:
	ldr r4, addr_ptr
	ldr r5, [r4]
	ldr r4, =1
	add  r6, r4, r5
	ldr r4, addr_ptr
	str r6, [r4]
	b .L116
.L115:
	ldr r4, [fp, #-12]
	ldr r5, =60
	cmp r5, r4
	beq .L118
	b .L119
.L116:
	ldr r4, [fp, #-4]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-4]
	b .L106
.L118:
	ldr r4, addr_ptr
	ldr r5, [r4]
	sub  r4, r5, #1
	ldr r5, addr_ptr
	str r4, [r5]
	b .L120
.L119:
	ldr r4, [fp, #-12]
	ldr r5, =43
	cmp r5, r4
	beq .L122
	b .L123
.L120:
	b .L116
.L122:
	ldr r4, addr_ptr
	ldr r5, [r4]
	ldr r4, addr_tape
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	ldr r4, =1
	add  r6, r4, r5
	ldr r4, addr_ptr
	ldr r5, [r4]
	ldr r4, addr_tape
	mov r7, #4
	mul  r8, r5, r7
	add  r5, r4, r8
	mov r4, r5
	str r6, [r4]
	b .L124
.L123:
	ldr r4, [fp, #-12]
	ldr r5, =45
	cmp r5, r4
	beq .L127
	b .L128
.L124:
	b .L120
.L127:
	ldr r4, addr_ptr
	ldr r5, [r4]
	ldr r4, addr_tape
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	sub  r4, r5, #1
	ldr r5, addr_ptr
	ldr r6, [r5]
	ldr r5, addr_tape
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r5, r8
	mov r5, r6
	str r4, [r5]
	b .L129
.L128:
	ldr r4, [fp, #-12]
	ldr r5, =46
	cmp r5, r4
	beq .L132
	b .L133
.L129:
	b .L124
.L132:
	ldr r4, addr_ptr
	ldr r5, [r4]
	ldr r4, addr_tape
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	mov r0, r5
	bl putch
	b .L134
.L133:
	ldr r4, [fp, #-12]
	ldr r5, =44
	cmp r5, r4
	beq .L137
	b .L138
.L134:
	b .L129
.L137:
	bl getch
	mov r4, r0
	ldr r5, addr_ptr
	ldr r6, [r5]
	ldr r5, addr_tape
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r5, r8
	mov r5, r6
	str r4, [r5]
	b .L139
.L138:
	ldr r4, [fp, #-12]
	ldr r5, =93
	cmp r5, r4
	moveq r4, #1
	movne r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L146
	b .L142
.L139:
	b .L134
.L141:
	ldr r4, =1
	str r4, [fp, #-8]
	b .L149
.L142:
	b .L139
.L146:
	ldr r4, addr_ptr
	ldr r5, [r4]
	ldr r4, addr_tape
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	ldr r4, =0
	cmp r5, r4
	bne .L141
	b .L142
.L149:
	ldr r4, [fp, #-8]
	ldr r5, =0
	cmp r5, r4
	blt .L150
	b .L151
.L150:
	ldr r4, [fp, #-4]
	sub  r5, r4, #1
	str r5, [fp, #-4]
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-4]
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	str r4, [fp, #-12]
	ldr r4, [fp, #-12]
	ldr r5, =91
	cmp r5, r4
	beq .L155
	b .L156
.L151:
	b .L142
.L155:
	ldr r4, [fp, #-8]
	sub  r5, r4, #1
	str r5, [fp, #-8]
	b .L157
.L156:
	ldr r4, [fp, #-12]
	ldr r5, =93
	cmp r5, r4
	beq .L159
	b .L160
.L157:
	b .L149
.L159:
	ldr r4, [fp, #-8]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-8]
	b .L160
.L160:
	b .L157

	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub  sp, sp, #0
.L162:
	bl read_program
	mov r4, #0
	ldr r5, addr_program
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	mov r5, r4
	mov r0, r5
	bl interpret
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

addr_TAPE_LEN:
	.word TAPE_LEN
addr_BUFFER_LEN:
	.word BUFFER_LEN
addr_tape:
	.word tape
addr_program:
	.word program
addr_ptr:
	.word ptr
