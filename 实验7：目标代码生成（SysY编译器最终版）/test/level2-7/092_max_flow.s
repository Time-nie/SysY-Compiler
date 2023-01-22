	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global INF
	.align 4
	.size INF, 4
INF:
	.word 1879048192
	.balign 4
	size: .skip 40
	.balign 4
	to: .skip 400
	.balign 4
	cap: .skip 400
	.balign 4
	rev: .skip 400
	.balign 4
	used: .skip 40
	.text
	.global my_memset
	.type my_memset , %function
my_memset:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub  sp, sp, #16
.L183:
	str r0, [fp, #-16]
	str r1, [fp, #-12]
	str r2, [fp, #-8]
	ldr r4, =0
	str r4, [fp, #-4]
	b .L191
.L191:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	cmp r4, r5
	bgt .L192
	b .L193
.L192:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-16]
	ldr r6, [fp, #-4]
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r5, r8
	str r4, [r6]
	ldr r4, [fp, #-4]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-4]
	b .L191
.L193:
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

	.global add_node
	.type add_node , %function
add_node:
	push {r4, r5, r6, r7, r8, r9, fp, lr}
	mov fp, sp
	sub  sp, sp, #12
.L196:
	str r0, [fp, #-12]
	str r1, [fp, #-8]
	str r2, [fp, #-4]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-12]
	ldr r6, addr_to
	mov r7, #40
	mul  r8, r5, r7
	add  r5, r6, r8
	mov r6, r5
	ldr r5, [fp, #-12]
	ldr r7, addr_size
	mov r8, #4
	mul  r9, r5, r8
	add  r5, r7, r9
	mov r7, r5
	ldr r5, [r7]
	mov r7, #4
	mul  r8, r5, r7
	add  r5, r6, r8
	str r4, [r5]
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-12]
	ldr r6, addr_cap
	mov r8, #40
	mul  r7, r5, r8
	add  r5, r6, r7
	mov r6, r5
	ldr r5, [fp, #-12]
	ldr r7, addr_size
	mov r8, #4
	mul  r9, r5, r8
	add  r5, r7, r9
	mov r7, r5
	ldr r5, [r7]
	mov r7, #4
	mul  r8, r5, r7
	add  r5, r6, r8
	str r4, [r5]
	ldr r4, [fp, #-8]
	ldr r5, addr_size
	mov r7, #4
	mul  r6, r4, r7
	add  r4, r5, r6
	mov r5, r4
	ldr r4, [r5]
	ldr r5, [fp, #-12]
	ldr r6, addr_rev
	mov r7, #40
	mul  r8, r5, r7
	add  r5, r6, r8
	mov r6, r5
	ldr r5, [fp, #-12]
	ldr r7, addr_size
	mov r8, #4
	mul  r9, r5, r8
	add  r5, r7, r9
	mov r7, r5
	ldr r5, [r7]
	mov r8, #4
	mul  r7, r5, r8
	add  r5, r6, r7
	str r4, [r5]
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-8]
	ldr r6, addr_to
	mov r7, #40
	mul  r8, r5, r7
	add  r5, r6, r8
	mov r6, r5
	ldr r5, [fp, #-8]
	ldr r7, addr_size
	mov r8, #4
	mul  r9, r5, r8
	add  r5, r7, r9
	mov r7, r5
	ldr r5, [r7]
	mov r8, #4
	mul  r7, r5, r8
	add  r5, r6, r7
	str r4, [r5]
	ldr r4, [fp, #-8]
	ldr r5, addr_cap
	mov r6, #40
	mul  r7, r4, r6
	add  r4, r5, r7
	mov r5, r4
	ldr r4, [fp, #-8]
	ldr r6, addr_size
	mov r7, #4
	mul  r8, r4, r7
	add  r4, r6, r8
	mov r6, r4
	ldr r4, [r6]
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	ldr r5, =0
	str r5, [r4]
	ldr r4, [fp, #-12]
	ldr r5, addr_size
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	ldr r5, [fp, #-8]
	ldr r6, addr_rev
	mov r7, #40
	mul  r8, r5, r7
	add  r5, r6, r8
	mov r6, r5
	ldr r5, [fp, #-8]
	ldr r7, addr_size
	mov r9, #4
	mul  r8, r5, r9
	add  r5, r7, r8
	mov r7, r5
	ldr r5, [r7]
	mov r7, #4
	mul  r8, r5, r7
	add  r5, r6, r8
	str r4, [r5]
	ldr r4, [fp, #-12]
	ldr r5, addr_size
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	ldr r5, =1
	add  r6, r5, r4
	ldr r4, [fp, #-12]
	ldr r5, addr_size
	mov r7, #4
	mul  r8, r4, r7
	add  r4, r5, r8
	mov r5, r4
	str r6, [r5]
	ldr r4, [fp, #-8]
	ldr r5, addr_size
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	ldr r5, =1
	add  r6, r5, r4
	ldr r4, [fp, #-8]
	ldr r5, addr_size
	mov r7, #4
	mul  r8, r4, r7
	add  r4, r5, r8
	mov r5, r4
	str r6, [r5]
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, r9, fp, lr}
	bx lr

	.global dfs
	.type dfs , %function
dfs:
	push {r4, r5, r6, r7, r8, r9, fp, lr}
	mov fp, sp
	sub  sp, sp, #24
.L219:
	str r0, [fp, #-24]
	str r1, [fp, #-20]
	str r2, [fp, #-16]
	ldr r4, [fp, #-20]
	ldr r5, [fp, #-24]
	cmp r4, r5
	beq .L226
	b .L227
.L226:
	ldr r4, [fp, #-16]
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, r9, fp, lr}
	bx lr
	b .L227
.L227:
	ldr r4, [fp, #-24]
	ldr r5, addr_used
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	mov r5, r4
	ldr r4, =1
	str r4, [r5]
	ldr r4, =0
	str r4, [fp, #-12]
	b .L230
.L230:
	ldr r4, [fp, #-24]
	ldr r5, addr_size
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	ldr r5, [fp, #-12]
	cmp r4, r5
	bgt .L231
	b .L232
.L231:
	ldr r4, [fp, #-24]
	ldr r5, addr_to
	mov r6, #40
	mul  r7, r4, r6
	add  r4, r5, r7
	mov r5, r4
	ldr r4, [fp, #-12]
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	ldr r5, [r4]
	ldr r4, addr_used
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	ldr r4, =0
	cmp r5, r4
	bne .L235
	b .L236
.L232:
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, r9, fp, lr}
	bx lr
.L235:
	ldr r4, [fp, #-12]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-12]
	b .L230
.L236:
	ldr r4, [fp, #-24]
	ldr r5, addr_cap
	mov r6, #40
	mul  r7, r4, r6
	add  r4, r5, r7
	mov r5, r4
	ldr r4, [fp, #-12]
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	ldr r5, [r4]
	ldr r4, =0
	cmp r4, r5
	bge .L242
	b .L243
.L241:
	b .L236
.L242:
	ldr r4, [fp, #-12]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-12]
	b .L230
.L243:
	ldr r4, [fp, #-24]
	ldr r5, addr_cap
	mov r6, #40
	mul  r7, r4, r6
	add  r4, r5, r7
	mov r5, r4
	ldr r4, [fp, #-12]
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	ldr r5, [r4]
	ldr r4, [fp, #-16]
	cmp r5, r4
	bgt .L249
	b .L250
.L247:
	b .L243
.L249:
	ldr r4, [fp, #-16]
	str r4, [fp, #-8]
	b .L251
.L250:
	ldr r4, [fp, #-24]
	ldr r5, addr_cap
	mov r6, #40
	mul  r7, r4, r6
	add  r4, r5, r7
	mov r5, r4
	ldr r4, [fp, #-12]
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	ldr r5, [r4]
	str r5, [fp, #-8]
	b .L251
.L251:
	ldr r4, [fp, #-24]
	ldr r5, addr_to
	mov r6, #40
	mul  r7, r4, r6
	add  r4, r5, r7
	mov r5, r4
	ldr r4, [fp, #-12]
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	ldr r5, [r4]
	ldr r4, [fp, #-20]
	ldr r6, [fp, #-8]
	mov r0, r5
	mov r1, r4
	mov r2, r6
	bl dfs
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, =0
	cmp r5, r4
	blt .L260
	b .L261
.L260:
	ldr r4, [fp, #-24]
	ldr r5, addr_cap
	mov r6, #40
	mul  r7, r4, r6
	add  r4, r5, r7
	mov r5, r4
	ldr r4, [fp, #-12]
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	ldr r5, [r4]
	ldr r4, [fp, #-4]
	sub  r6, r5, r4
	ldr r4, [fp, #-24]
	ldr r5, addr_cap
	mov r7, #40
	mul  r8, r4, r7
	add  r4, r5, r8
	mov r5, r4
	ldr r4, [fp, #-12]
	mov r7, #4
	mul  r8, r4, r7
	add  r4, r5, r8
	str r6, [r4]
	ldr r4, [fp, #-24]
	ldr r5, addr_to
	mov r6, #40
	mul  r7, r4, r6
	add  r4, r5, r7
	mov r5, r4
	ldr r4, [fp, #-12]
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	ldr r5, [r4]
	ldr r4, addr_cap
	mov r6, #40
	mul  r7, r5, r6
	add  r5, r4, r7
	mov r4, r5
	ldr r5, [fp, #-24]
	ldr r6, addr_rev
	mov r7, #40
	mul  r8, r5, r7
	add  r5, r6, r8
	mov r6, r5
	ldr r5, [fp, #-12]
	mov r7, #4
	mul  r8, r5, r7
	add  r5, r6, r8
	ldr r6, [r5]
	mov r5, #4
	mul  r7, r6, r5
	add  r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-4]
	add  r6, r5, r4
	ldr r4, [fp, #-24]
	ldr r5, addr_to
	mov r7, #40
	mul  r8, r4, r7
	add  r4, r5, r8
	mov r5, r4
	ldr r4, [fp, #-12]
	mov r7, #4
	mul  r8, r4, r7
	add  r4, r5, r8
	ldr r5, [r4]
	ldr r4, addr_cap
	mov r7, #40
	mul  r8, r5, r7
	add  r5, r4, r8
	mov r4, r5
	ldr r5, [fp, #-24]
	ldr r7, addr_rev
	mov r8, #40
	mul  r9, r5, r8
	add  r5, r7, r9
	mov r7, r5
	ldr r5, [fp, #-12]
	mov r9, #4
	mul  r8, r5, r9
	add  r5, r7, r8
	ldr r7, [r5]
	mov r5, #4
	mul  r8, r7, r5
	add  r5, r4, r8
	str r6, [r5]
	ldr r4, [fp, #-4]
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, r9, fp, lr}
	bx lr
	b .L261
.L261:
	ldr r4, [fp, #-12]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-12]
	b .L230

	.global max_flow
	.type max_flow , %function
max_flow:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub  sp, sp, #16
.L277:
	str r0, [fp, #-16]
	str r1, [fp, #-12]
	ldr r4, =0
	str r4, [fp, #-8]
	b .L283
.L283:
	ldr r4, =1
	ldr r5, =0
	cmp r4, r5
	bne .L284
	b .L285
.L284:
	mov r4, #0
	ldr r5, addr_used
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	mov r5, r4
	mov r0, r5
	mov r1, #0
	mov r2, #10
	bl my_memset
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-12]
	ldr r6, addr_INF
	ldr r7, [r6]
	mov r0, r4
	mov r1, r5
	mov r2, r7
	bl dfs
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, =0
	cmp r5, r4
	beq .L288
	b .L289
.L285:
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L288:
	ldr r4, [fp, #-8]
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
	b .L289
.L289:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	add  r6, r5, r4
	str r6, [fp, #-8]
	b .L283

	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub  sp, sp, #20
.L291:
	bl getint
	mov r4, r0
	str r4, [fp, #-20]
	bl getint
	mov r4, r0
	str r4, [fp, #-16]
	mov r4, #0
	ldr r5, addr_size
	mov r7, #4
	mul  r6, r4, r7
	add  r4, r5, r6
	mov r5, r4
	mov r0, r5
	mov r1, #0
	mov r2, #10
	bl my_memset
	b .L294
.L294:
	ldr r4, [fp, #-16]
	ldr r5, =0
	cmp r5, r4
	blt .L295
	b .L296
.L295:
	bl getint
	mov r4, r0
	str r4, [fp, #-12]
	bl getint
	mov r4, r0
	str r4, [fp, #-8]
	bl getint
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-8]
	ldr r6, [fp, #-4]
	mov r0, r4
	mov r1, r5
	mov r2, r6
	bl add_node
	ldr r4, [fp, #-16]
	sub  r5, r4, #1
	str r5, [fp, #-16]
	b .L294
.L296:
	ldr r4, [fp, #-20]
	mov r0, #1
	mov r1, r4
	bl max_flow
	mov r4, r0
	mov r0, r4
	bl putint
	mov r0, #10
	bl putch
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

addr_INF:
	.word INF
addr_size:
	.word size
addr_to:
	.word to
addr_cap:
	.word cap
addr_rev:
	.word rev
addr_used:
	.word used
