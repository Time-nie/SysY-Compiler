	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global TOKEN_NUM
	.align 4
	.size TOKEN_NUM, 4
TOKEN_NUM:
	.word 0
	.global TOKEN_OTHER
	.align 4
	.size TOKEN_OTHER, 4
TOKEN_OTHER:
	.word 1
	.global last_char
	.align 4
	.size last_char, 4
last_char:
	.word 32
	.global num
	.align 4
	.size num, 4
num:
	.word 0
	.global other
	.align 4
	.size other, 4
other:
	.word 0
	.global cur_token
	.align 4
	.size cur_token, 4
cur_token:
	.word 0
	.text
	.global next_char
	.type next_char , %function
next_char:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub  sp, sp, #0
.L192:
	bl getch
	mov r4, r0
	ldr r5, addr_last_char
	str r4, [r5]
	ldr r4, addr_last_char
	ldr r5, [r4]
	mov r0, r5
	sub  sp, fp, #0
	pop {r4, r5, fp, lr}
	bx lr

	.global is_space
	.type is_space , %function
is_space:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub  sp, sp, #4
.L193:
	str r0, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, =32
	cmp r5, r4
	moveq r4, #1
	movne r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L196
	b .L202
.L196:
	mov r0, #1
	sub  sp, fp, #0
	pop {r4, r5, fp, lr}
	bx lr
	b .L198
.L197:
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, fp, lr}
	bx lr
	b .L198
.L198:
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, fp, lr}
	bx lr
.L202:
	ldr r4, [fp, #-4]
	ldr r5, =10
	cmp r5, r4
	moveq r4, #1
	movne r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L196
	b .L197

	.global is_num
	.type is_num , %function
is_num:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub  sp, sp, #4
.L206:
	str r0, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, =48
	cmp r5, r4
	movle r4, #1
	movgt r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L215
	b .L210
.L209:
	mov r0, #1
	sub  sp, fp, #0
	pop {r4, r5, fp, lr}
	bx lr
	b .L211
.L210:
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, fp, lr}
	bx lr
	b .L211
.L211:
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, fp, lr}
	bx lr
.L215:
	ldr r4, [fp, #-4]
	ldr r5, =57
	cmp r5, r4
	movge r4, #1
	movlt r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L209
	b .L210

	.global next_token
	.type next_token , %function
next_token:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub  sp, sp, #0
.L219:
	b .L220
.L220:
	ldr r4, addr_last_char
	ldr r5, [r4]
	mov r0, r5
	bl is_space
	mov r4, r0
	ldr r5, =0
	cmp r4, r5
	bne .L221
	b .L222
.L221:
	bl next_char
	mov r4, r0
	b .L220
.L222:
	ldr r4, addr_last_char
	ldr r5, [r4]
	mov r0, r5
	bl is_num
	mov r4, r0
	ldr r5, =0
	cmp r4, r5
	bne .L224
	b .L225
.L224:
	ldr r4, addr_last_char
	ldr r5, [r4]
	sub  r4, r5, #48
	ldr r5, addr_num
	str r4, [r5]
	b .L228
.L225:
	ldr r4, addr_last_char
	ldr r5, [r4]
	ldr r4, addr_other
	str r5, [r4]
	bl next_char
	mov r4, r0
	ldr r4, addr_TOKEN_OTHER
	ldr r5, [r4]
	ldr r4, addr_cur_token
	str r5, [r4]
	b .L226
.L226:
	ldr r4, addr_cur_token
	ldr r5, [r4]
	mov r0, r5
	sub  sp, fp, #0
	pop {r4, r5, r6, fp, lr}
	bx lr
.L228:
	bl next_char
	mov r4, r0
	mov r0, r4
	bl is_num
	mov r4, r0
	ldr r5, =0
	cmp r4, r5
	bne .L229
	b .L230
.L229:
	ldr r4, addr_num
	ldr r5, [r4]
	ldr r4, =10
	mul  r6, r4, r5
	ldr r4, addr_last_char
	ldr r5, [r4]
	add  r4, r5, r6
	sub  r5, r4, #48
	ldr r4, addr_num
	str r5, [r4]
	b .L228
.L230:
	ldr r4, addr_TOKEN_NUM
	ldr r5, [r4]
	ldr r4, addr_cur_token
	str r5, [r4]
	b .L226

	.global panic
	.type panic , %function
panic:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub  sp, sp, #0
.L232:
	mov r0, #112
	bl putch
	mov r0, #97
	bl putch
	mov r0, #110
	bl putch
	mov r0, #105
	bl putch
	mov r0, #99
	bl putch
	mov r0, #33
	bl putch
	mov r0, #10
	bl putch
	ldr r4, =0
	sub  r5, r4, #1
	mov r0, r5
	sub  sp, fp, #0
	pop {r4, r5, fp, lr}
	bx lr

	.global get_op_prec
	.type get_op_prec , %function
get_op_prec:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub  sp, sp, #4
.L233:
	str r0, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, =43
	cmp r5, r4
	moveq r4, #1
	movne r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L236
	b .L241
.L236:
	mov r0, #10
	sub  sp, fp, #0
	pop {r4, r5, fp, lr}
	bx lr
	b .L237
.L237:
	ldr r4, [fp, #-4]
	ldr r5, =42
	cmp r5, r4
	moveq r4, #1
	movne r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L245
	b .L250
.L241:
	ldr r4, [fp, #-4]
	ldr r5, =45
	cmp r5, r4
	moveq r4, #1
	movne r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L236
	b .L237
.L245:
	mov r0, #20
	sub  sp, fp, #0
	pop {r4, r5, fp, lr}
	bx lr
	b .L246
.L246:
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, fp, lr}
	bx lr
.L250:
	ldr r4, [fp, #-4]
	ldr r5, =47
	cmp r5, r4
	moveq r4, #1
	movne r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L245
	b .L254
.L254:
	ldr r4, [fp, #-4]
	ldr r5, =37
	cmp r5, r4
	moveq r4, #1
	movne r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L245
	b .L246

	.global stack_push
	.type stack_push , %function
stack_push:
	push {r4, r5, r6, r7, r8, r9, fp, lr}
	mov fp, sp
	sub  sp, sp, #8
.L258:
	str r0, [fp, #-8]
	str r1, [fp, #-4]
	ldr r4, [fp, #-8]
	mov r5, #0
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	ldr r5, =1
	add  r6, r5, r4
	ldr r4, [fp, #-8]
	mov r5, #0
	mov r8, #4
	mul  r7, r5, r8
	add  r5, r4, r7
	str r6, [r5]
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-8]
	ldr r6, [fp, #-8]
	mov r7, #0
	mov r8, #4
	mul  r9, r7, r8
	add  r7, r6, r9
	ldr r6, [r7]
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r5, r8
	str r4, [r6]
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, r9, fp, lr}
	bx lr

	.global stack_pop
	.type stack_pop , %function
stack_pop:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub  sp, sp, #8
.L269:
	str r0, [fp, #-8]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-8]
	mov r6, #0
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r5, r8
	ldr r5, [r6]
	mov r7, #4
	mul  r6, r5, r7
	add  r5, r4, r6
	ldr r4, [r5]
	str r4, [fp, #-4]
	ldr r4, [fp, #-8]
	mov r5, #0
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	sub  r5, r4, #1
	ldr r4, [fp, #-8]
	mov r6, #0
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r4, r8
	str r5, [r6]
	ldr r4, [fp, #-4]
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

	.global stack_peek
	.type stack_peek , %function
stack_peek:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub  sp, sp, #4
.L280:
	str r0, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-4]
	mov r6, #0
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r5, r8
	ldr r5, [r6]
	mov r7, #4
	mul  r6, r5, r7
	add  r5, r4, r6
	ldr r4, [r5]
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

	.global stack_size
	.type stack_size , %function
stack_size:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub  sp, sp, #4
.L287:
	str r0, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r5, #0
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

	.global eval_op
	.type eval_op , %function
eval_op:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub  sp, sp, #12
.L292:
	str r0, [fp, #-12]
	str r1, [fp, #-8]
	str r2, [fp, #-4]
	ldr r4, [fp, #-12]
	ldr r5, =43
	cmp r5, r4
	beq .L299
	b .L300
.L299:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	add  r6, r5, r4
	mov r0, r6
	sub  sp, fp, #0
	pop {r4, r5, r6, fp, lr}
	bx lr
	b .L300
.L300:
	ldr r4, [fp, #-12]
	ldr r5, =45
	cmp r5, r4
	beq .L302
	b .L303
.L302:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	sub  r6, r4, r5
	mov r0, r6
	sub  sp, fp, #0
	pop {r4, r5, r6, fp, lr}
	bx lr
	b .L303
.L303:
	ldr r4, [fp, #-12]
	ldr r5, =42
	cmp r5, r4
	beq .L305
	b .L306
.L305:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	mul  r6, r5, r4
	mov r0, r6
	sub  sp, fp, #0
	pop {r4, r5, r6, fp, lr}
	bx lr
	b .L306
.L306:
	ldr r4, [fp, #-12]
	ldr r5, =47
	cmp r5, r4
	beq .L308
	b .L309
.L308:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	sdiv  r6, r4, r5
	mov r0, r6
	sub  sp, fp, #0
	pop {r4, r5, r6, fp, lr}
	bx lr
	b .L309
.L309:
	ldr r4, [fp, #-12]
	ldr r5, =37
	cmp r5, r4
	beq .L311
	b .L312
.L311:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	sdiv  r6, r4, r5
	mul  r6, r6, r5
	sub  r5, r4, r6
	mov r0, r5
	sub  sp, fp, #0
	pop {r4, r5, r6, fp, lr}
	bx lr
	b .L312
.L312:
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, r6, fp, lr}
	bx lr

	.global eval
	.type eval , %function
eval:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	mov r4, #2076
	add  r4, r4, #0
	sub  sp, sp, r4
.L314:
	mov r4, #0
	mov r5, #63460
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
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
	mov r4, #0
	mov r5, #64484
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
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
	ldr r4, addr_TOKEN_NUM
	ldr r5, [r4]
	ldr r4, addr_cur_token
	ldr r6, [r4]
	cmp r5, r6
	bne .L829
	b .L830
.L829:
	bl panic
	mov r4, r0
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
	b .L830
.L830:
	mov r4, #0
	mov r5, #63460
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, addr_num
	ldr r6, [r4]
	mov r0, r5
	mov r1, r6
	bl stack_push
	bl next_token
	mov r4, r0
	b .L832
.L832:
	ldr r4, addr_TOKEN_OTHER
	ldr r5, [r4]
	ldr r4, addr_cur_token
	ldr r6, [r4]
	cmp r5, r6
	beq .L833
	b .L834
.L833:
	ldr r4, addr_other
	ldr r5, [r4]
	str r5, [fp, #-28]
	ldr r4, [fp, #-28]
	mov r0, r4
	bl get_op_prec
	mov r4, r0
	ldr r5, =0
	cmp r4, r5
	beq .L837
	b .L838
.L834:
	bl next_token
	mov r4, r0
	b .L855
.L837:
	b .L834
.L838:
	bl next_token
	mov r4, r0
	b .L841
.L840:
	b .L838
.L841:
	mov r4, #0
	mov r5, #64484
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	mov r0, r5
	bl stack_size
	mov r4, r0
	ldr r5, =0
	cmp r4, r5
	bne .L845
	b .L843
.L842:
	mov r4, #0
	mov r5, #64484
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	mov r0, r5
	bl stack_pop
	mov r4, r0
	str r4, [fp, #-24]
	mov r4, #0
	mov r5, #63460
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	mov r0, r5
	bl stack_pop
	mov r4, r0
	str r4, [fp, #-20]
	mov r4, #0
	mov r5, #63460
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	mov r7, #4
	mul  r6, r4, r7
	add  r4, r5, r6
	add  r5, fp, r4
	mov r0, r5
	bl stack_pop
	mov r4, r0
	str r4, [fp, #-16]
	mov r4, #0
	mov r5, #63460
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, [fp, #-24]
	ldr r6, [fp, #-16]
	ldr r7, [fp, #-20]
	mov r0, r4
	mov r1, r6
	mov r2, r7
	bl eval_op
	mov r4, r0
	mov r0, r5
	mov r1, r4
	bl stack_push
	b .L841
.L843:
	mov r4, #0
	mov r5, #64484
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, [fp, #-28]
	mov r0, r5
	mov r1, r4
	bl stack_push
	ldr r4, addr_TOKEN_NUM
	ldr r5, [r4]
	ldr r4, addr_cur_token
	ldr r6, [r4]
	cmp r5, r6
	bne .L852
	b .L853
.L845:
	ldr r4, [fp, #-28]
	mov r0, r4
	bl get_op_prec
	mov r4, r0
	mov r5, #0
	mov r6, #64484
	add  r6, r6, #16711680
	add  r6, r6, #-16777216
	mov r8, #4
	mul  r7, r5, r8
	add  r5, r6, r7
	add  r6, fp, r5
	mov r0, r6
	bl stack_peek
	mov r5, r0
	mov r0, r5
	bl get_op_prec
	mov r5, r0
	cmp r4, r5
	movle r4, #1
	movgt r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L842
	b .L843
.L852:
	bl panic
	mov r4, r0
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
	b .L853
.L853:
	mov r4, #0
	mov r5, #63460
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, addr_num
	ldr r6, [r4]
	mov r0, r5
	mov r1, r6
	bl stack_push
	bl next_token
	mov r4, r0
	b .L832
.L855:
	mov r4, #0
	mov r5, #64484
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	mov r0, r5
	bl stack_size
	mov r4, r0
	ldr r5, =0
	cmp r4, r5
	bne .L856
	b .L857
.L856:
	mov r4, #0
	mov r5, #64484
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	mov r0, r5
	bl stack_pop
	mov r4, r0
	str r4, [fp, #-12]
	mov r4, #0
	mov r5, #63460
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	mov r0, r5
	bl stack_pop
	mov r4, r0
	str r4, [fp, #-8]
	mov r4, #0
	mov r5, #63460
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	mov r0, r5
	bl stack_pop
	mov r4, r0
	str r4, [fp, #-4]
	mov r4, #0
	mov r5, #63460
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, [fp, #-12]
	ldr r6, [fp, #-4]
	ldr r7, [fp, #-8]
	mov r0, r4
	mov r1, r6
	mov r2, r7
	bl eval_op
	mov r4, r0
	mov r0, r5
	mov r1, r4
	bl stack_push
	b .L855
.L857:
	mov r4, #0
	mov r5, #63460
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	mov r0, r5
	bl stack_peek
	mov r4, r0
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

	.global main
	.type main , %function
main:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub  sp, sp, #4
.L862:
	bl getint
	mov r4, r0
	str r4, [fp, #-4]
	bl getch
	mov r4, r0
	bl next_token
	mov r4, r0
	b .L864
.L864:
	ldr r4, [fp, #-4]
	ldr r5, =0
	cmp r4, r5
	bne .L865
	b .L866
.L865:
	bl eval
	mov r4, r0
	mov r0, r4
	bl putint
	mov r0, #10
	bl putch
	ldr r4, [fp, #-4]
	sub  r5, r4, #1
	str r5, [fp, #-4]
	b .L864
.L866:
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, fp, lr}
	bx lr

addr_TOKEN_NUM:
	.word TOKEN_NUM
addr_TOKEN_OTHER:
	.word TOKEN_OTHER
addr_last_char:
	.word last_char
addr_num:
	.word num
addr_other:
	.word other
addr_cur_token:
	.word cur_token
