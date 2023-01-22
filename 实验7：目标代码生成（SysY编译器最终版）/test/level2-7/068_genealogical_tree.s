	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.balign 4
	map: .skip 400
	.balign 4
	indegree: .skip 40
	.balign 4
	queue: .skip 40
	.text
	.global topo
	.type topo , %function
topo:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub  sp, sp, #20
.L87:
	str r0, [fp, #-20]
	ldr r4, =0
	str r4, [fp, #-16]
	ldr r4, =0
	str r4, [fp, #-12]
	ldr r4, =1
	str r4, [fp, #-8]
	ldr r4, =1
	str r4, [fp, #-4]
	b .L94
.L94:
	ldr r4, [fp, #-20]
	ldr r5, [fp, #-8]
	cmp r4, r5
	bge .L95
	b .L96
.L95:
	ldr r4, =1
	str r4, [fp, #-4]
	b .L98
.L96:
	ldr r4, =0
	str r4, [fp, #-8]
	b .L117
.L98:
	ldr r4, [fp, #-20]
	ldr r5, [fp, #-4]
	cmp r4, r5
	bge .L99
	b .L100
.L99:
	ldr r4, [fp, #-4]
	ldr r5, addr_indegree
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	ldr r5, =0
	cmp r5, r4
	beq .L102
	b .L103
.L100:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-12]
	ldr r6, addr_queue
	mov r8, #4
	mul  r7, r5, r8
	add  r5, r6, r7
	mov r6, r5
	str r4, [r6]
	ldr r4, [fp, #-12]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-12]
	ldr r4, =0
	sub  r5, r4, #1
	ldr r4, [fp, #-16]
	ldr r6, addr_indegree
	mov r7, #4
	mul  r8, r4, r7
	add  r4, r6, r8
	mov r6, r4
	str r5, [r6]
	ldr r4, =1
	str r4, [fp, #-4]
	b .L107
.L102:
	ldr r4, [fp, #-4]
	str r4, [fp, #-16]
	b .L100
.L103:
	ldr r4, [fp, #-4]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-4]
	b .L98
.L106:
	b .L103
.L107:
	ldr r4, [fp, #-20]
	ldr r5, [fp, #-4]
	cmp r4, r5
	bge .L108
	b .L109
.L108:
	ldr r4, [fp, #-16]
	ldr r5, addr_map
	mov r6, #40
	mul  r7, r4, r6
	add  r4, r5, r7
	mov r5, r4
	ldr r4, [fp, #-4]
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	ldr r5, [r4]
	ldr r4, =0
	cmp r5, r4
	bne .L111
	b .L112
.L109:
	ldr r4, [fp, #-8]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-8]
	b .L94
.L111:
	ldr r4, [fp, #-4]
	ldr r5, addr_indegree
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	sub  r5, r4, #1
	ldr r4, [fp, #-4]
	ldr r6, addr_indegree
	mov r7, #4
	mul  r8, r4, r7
	add  r4, r6, r8
	mov r6, r4
	str r5, [r6]
	b .L112
.L112:
	ldr r4, [fp, #-4]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-4]
	b .L107
.L117:
	ldr r4, [fp, #-20]
	ldr r5, [fp, #-8]
	cmp r4, r5
	bgt .L118
	b .L119
.L118:
	ldr r4, [fp, #-8]
	ldr r5, addr_queue
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	mov r0, r4
	bl putint
	mov r0, #10
	bl putch
	ldr r4, [fp, #-8]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-8]
	b .L117
.L119:
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub  sp, sp, #12
.L122:
	ldr r4, =1
	str r4, [fp, #-4]
	ldr r4, =5
	str r4, [fp, #-12]
	b .L126
.L126:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-4]
	cmp r4, r5
	bge .L127
	b .L128
.L127:
	bl getint
	mov r4, r0
	str r4, [fp, #-8]
	b .L130
.L128:
	ldr r4, [fp, #-12]
	mov r0, r4
	bl topo
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L130:
	ldr r4, [fp, #-8]
	ldr r5, =0
	cmp r5, r4
	bne .L131
	b .L132
.L131:
	ldr r4, [fp, #-4]
	ldr r5, addr_map
	mov r6, #40
	mul  r7, r4, r6
	add  r4, r5, r7
	mov r5, r4
	ldr r4, [fp, #-8]
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	ldr r5, =1
	str r5, [r4]
	ldr r4, [fp, #-8]
	ldr r5, addr_indegree
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	ldr r5, =1
	add  r6, r5, r4
	ldr r4, [fp, #-8]
	ldr r5, addr_indegree
	mov r7, #4
	mul  r8, r4, r7
	add  r4, r5, r8
	mov r5, r4
	str r6, [r5]
	bl getint
	mov r4, r0
	str r4, [fp, #-8]
	b .L130
.L132:
	ldr r4, [fp, #-4]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-4]
	b .L126

addr_map:
	.word map
addr_indegree:
	.word indegree
addr_queue:
	.word queue
