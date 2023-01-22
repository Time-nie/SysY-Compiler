	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.balign 4
	array: .skip 440
	.global n
	.align 4
	.size n, 4
n:
	.word 0
	.text
	.global init
	.type init , %function
init:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub  sp, sp, #8
.L168:
	str r0, [fp, #-8]
	ldr r4, =1
	str r4, [fp, #-4]
	b .L172
.L172:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-8]
	mul  r6, r5, r4
	ldr r4, =1
	add  r5, r4, r6
	ldr r4, [fp, #-4]
	cmp r5, r4
	bge .L173
	b .L174
.L173:
	ldr r4, =0
	sub  r5, r4, #1
	ldr r4, [fp, #-4]
	ldr r6, addr_array
	mov r7, #4
	mul  r8, r4, r7
	add  r4, r6, r8
	mov r6, r4
	str r5, [r6]
	ldr r4, [fp, #-4]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-4]
	b .L172
.L174:
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

	.global findfa
	.type findfa , %function
findfa:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub  sp, sp, #4
.L176:
	str r0, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-4]
	ldr r6, addr_array
	mov r7, #4
	mul  r8, r5, r7
	add  r5, r6, r8
	mov r6, r5
	ldr r5, [r6]
	cmp r4, r5
	beq .L179
	b .L180
.L179:
	ldr r4, [fp, #-4]
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
	b .L181
.L180:
	ldr r4, [fp, #-4]
	ldr r5, addr_array
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	mov r0, r4
	bl findfa
	mov r4, r0
	ldr r5, [fp, #-4]
	ldr r6, addr_array
	mov r7, #4
	mul  r8, r5, r7
	add  r5, r6, r8
	mov r6, r5
	str r4, [r6]
	ldr r4, [fp, #-4]
	ldr r5, addr_array
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
	b .L181
.L181:
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

	.global mmerge
	.type mmerge , %function
mmerge:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub  sp, sp, #16
.L186:
	str r0, [fp, #-16]
	str r1, [fp, #-12]
	ldr r4, [fp, #-16]
	mov r0, r4
	bl findfa
	mov r4, r0
	str r4, [fp, #-8]
	ldr r4, [fp, #-12]
	mov r0, r4
	bl findfa
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-8]
	cmp r4, r5
	bne .L193
	b .L194
.L193:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-8]
	ldr r6, addr_array
	mov r7, #4
	mul  r8, r5, r7
	add  r5, r6, r8
	mov r6, r5
	str r4, [r6]
	b .L194
.L194:
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub  sp, sp, #36
.L196:
	ldr r4, =1
	str r4, [fp, #-36]
	b .L201
.L201:
	ldr r4, [fp, #-36]
	ldr r5, =0
	cmp r4, r5
	bne .L202
	b .L203
.L202:
	ldr r4, [fp, #-36]
	sub  r5, r4, #1
	str r5, [fp, #-36]
	ldr r4, =4
	ldr r5, addr_n
	str r4, [r5]
	ldr r4, =10
	str r4, [fp, #-32]
	ldr r4, =0
	str r4, [fp, #-20]
	ldr r4, =0
	str r4, [fp, #-16]
	ldr r4, addr_n
	ldr r5, [r4]
	mov r0, r5
	bl init
	ldr r4, addr_n
	ldr r5, [r4]
	ldr r4, addr_n
	ldr r6, [r4]
	mul  r4, r6, r5
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-12]
	b .L208
.L203:
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L208:
	ldr r4, [fp, #-32]
	ldr r5, [fp, #-20]
	cmp r4, r5
	bgt .L209
	b .L210
.L209:
	bl getint
	mov r4, r0
	str r4, [fp, #-28]
	bl getint
	mov r4, r0
	str r4, [fp, #-24]
	ldr r4, [fp, #-16]
	ldr r5, =0
	cmp r4, r5
	beq .L212
	b .L213
.L210:
	ldr r4, [fp, #-16]
	ldr r5, =0
	cmp r4, r5
	beq .L278
	b .L279
.L212:
	ldr r4, addr_n
	ldr r5, [r4]
	ldr r4, [fp, #-28]
	sub  r6, r4, #1
	mul  r4, r6, r5
	ldr r5, [fp, #-24]
	add  r6, r5, r4
	str r6, [fp, #-8]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-8]
	ldr r6, addr_array
	mov r7, #4
	mul  r8, r5, r7
	add  r5, r6, r8
	mov r6, r5
	str r4, [r6]
	ldr r4, [fp, #-28]
	ldr r5, =1
	cmp r5, r4
	beq .L216
	b .L217
.L213:
	ldr r4, [fp, #-20]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-20]
	b .L208
.L216:
	mov r4, #0
	ldr r5, addr_array
	mov r7, #4
	mul  r6, r4, r7
	add  r4, r5, r6
	mov r5, r4
	ldr r4, =0
	str r4, [r5]
	ldr r4, [fp, #-8]
	mov r0, r4
	mov r1, #0
	bl mmerge
	b .L217
.L217:
	ldr r4, addr_n
	ldr r5, [r4]
	ldr r4, [fp, #-28]
	cmp r5, r4
	beq .L219
	b .L220
.L219:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-12]
	ldr r6, addr_array
	mov r8, #4
	mul  r7, r5, r8
	add  r5, r6, r7
	mov r6, r5
	str r4, [r6]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-12]
	mov r0, r4
	mov r1, r5
	bl mmerge
	b .L220
.L220:
	ldr r4, addr_n
	ldr r5, [r4]
	ldr r4, [fp, #-24]
	cmp r5, r4
	movgt r4, #1
	movle r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L227
	b .L223
.L222:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-8]
	ldr r6, =1
	add  r7, r6, r5
	mov r0, r4
	mov r1, r7
	bl mmerge
	b .L223
.L223:
	ldr r4, [fp, #-24]
	ldr r5, =1
	cmp r5, r4
	movlt r4, #1
	movge r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L237
	b .L233
.L227:
	ldr r4, =0
	sub  r5, r4, #1
	ldr r4, [fp, #-8]
	ldr r6, =1
	add  r7, r6, r4
	ldr r4, addr_array
	mov r6, #4
	mul  r8, r7, r6
	add  r6, r4, r8
	mov r4, r6
	ldr r6, [r4]
	cmp r5, r6
	movne r4, #1
	moveq r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L222
	b .L223
.L232:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-8]
	sub  r6, r5, #1
	mov r0, r4
	mov r1, r6
	bl mmerge
	b .L233
.L233:
	ldr r4, addr_n
	ldr r5, [r4]
	ldr r4, [fp, #-28]
	cmp r5, r4
	movgt r4, #1
	movle r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L247
	b .L243
.L237:
	ldr r4, =0
	sub  r5, r4, #1
	ldr r4, [fp, #-8]
	sub  r6, r4, #1
	ldr r4, addr_array
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r4, r8
	mov r4, r6
	ldr r6, [r4]
	cmp r5, r6
	movne r4, #1
	moveq r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L232
	b .L233
.L242:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-8]
	ldr r6, addr_n
	ldr r7, [r6]
	add  r6, r7, r5
	mov r0, r4
	mov r1, r6
	bl mmerge
	b .L243
.L243:
	ldr r4, [fp, #-28]
	ldr r5, =1
	cmp r5, r4
	movlt r4, #1
	movge r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L257
	b .L253
.L247:
	ldr r4, =0
	sub  r5, r4, #1
	ldr r4, [fp, #-8]
	ldr r6, addr_n
	ldr r7, [r6]
	add  r6, r7, r4
	ldr r4, addr_array
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r4, r8
	mov r4, r6
	ldr r6, [r4]
	cmp r5, r6
	movne r4, #1
	moveq r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L242
	b .L243
.L252:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-8]
	ldr r6, addr_n
	ldr r7, [r6]
	sub  r6, r5, r7
	mov r0, r4
	mov r1, r6
	bl mmerge
	b .L253
.L253:
	ldr r4, =0
	sub  r5, r4, #1
	mov r4, #0
	ldr r6, addr_array
	mov r7, #4
	mul  r8, r4, r7
	add  r4, r6, r8
	mov r6, r4
	ldr r4, [r6]
	cmp r5, r4
	movne r4, #1
	moveq r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L268
	b .L263
.L257:
	ldr r4, =0
	sub  r5, r4, #1
	ldr r4, [fp, #-8]
	ldr r6, addr_n
	ldr r7, [r6]
	sub  r6, r4, r7
	ldr r4, addr_array
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r4, r8
	mov r4, r6
	ldr r6, [r4]
	cmp r5, r6
	movne r4, #1
	moveq r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L252
	b .L253
.L262:
	ldr r4, =1
	str r4, [fp, #-16]
	ldr r4, [fp, #-20]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putint
	mov r0, #10
	bl putch
	b .L263
.L263:
	b .L213
.L268:
	ldr r4, =0
	sub  r5, r4, #1
	ldr r4, [fp, #-12]
	ldr r6, addr_array
	mov r7, #4
	mul  r8, r4, r7
	add  r4, r6, r8
	mov r6, r4
	ldr r4, [r6]
	cmp r5, r4
	movne r4, #1
	moveq r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L273
	b .L263
.L273:
	ldr r4, [fp, #-12]
	mov r0, r4
	bl findfa
	mov r4, r0
	mov r0, #0
	bl findfa
	mov r5, r0
	cmp r4, r5
	moveq r4, #1
	movne r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L262
	b .L263
.L278:
	ldr r4, =0
	sub  r5, r4, #1
	mov r0, r5
	bl putint
	mov r0, #10
	bl putch
	b .L279
.L279:
	b .L201

addr_array:
	.word array
addr_n:
	.word n
