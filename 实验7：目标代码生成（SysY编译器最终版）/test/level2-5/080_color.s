	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global maxn
	.align 4
	.size maxn, 4
maxn:
	.word 18
	.global mod
	.align 4
	.size mod, 4
mod:
	.word 1000000007
	.balign 4
	dp: .skip 52907904
	.balign 4
	list: .skip 800
	.balign 4
	cns: .skip 80
	.text
	.global equal
	.type equal , %function
equal:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub  sp, sp, #8
.L234:
	str r0, [fp, #-8]
	str r1, [fp, #-4]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	cmp r4, r5
	beq .L239
	b .L240
.L239:
	mov r0, #1
	sub  sp, fp, #0
	pop {r4, r5, fp, lr}
	bx lr
	b .L240
.L240:
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, fp, lr}
	bx lr

	.global dfs
	.type dfs , %function
dfs:
	push {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov fp, sp
	sub  sp, sp, #68
.L242:
	str r0, [fp, #-28]
	str r1, [fp, #-24]
	str r2, [fp, #-20]
	str r3, [fp, #-16]
	ldr r4, [fp, #36]
	str r4, [fp, #-12]
	ldr r4, [fp, #40]
	str r4, [fp, #-8]
	ldr r4, [fp, #-28]
	ldr r5, addr_dp
	mov r6, #55744
	add  r6, r6, #2883584
	mov r6, #55744
	mul  r7, r4, r6
	add  r4, r5, r7
	mov r5, r4
	ldr r4, [fp, #-24]
	mov r6, #32224
	add  r6, r6, #131072
	mov r6, #32224
	mul  r7, r4, r6
	add  r4, r5, r7
	ldr r5, [fp, #-20]
	mov r6, #9072
	add  r6, r6, #0
	mov r6, #9072
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [fp, #-16]
	ldr r6, =504
	mul  r7, r4, r6
	add  r4, r5, r7
	ldr r5, [fp, #-12]
	mov r6, #28
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [fp, #-8]
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	ldr r5, [r4]
	ldr r4, =0
	sub  r6, r4, #1
	cmp r5, r6
	bne .L255
	b .L256
.L255:
	ldr r4, [fp, #-28]
	ldr r5, addr_dp
	mov r6, #55744
	add  r6, r6, #2883584
	mov r6, #55744
	mul  r7, r4, r6
	add  r4, r5, r7
	mov r5, r4
	ldr r4, [fp, #-24]
	mov r6, #32224
	add  r6, r6, #131072
	mov r6, #32224
	mul  r7, r4, r6
	add  r4, r5, r7
	ldr r5, [fp, #-20]
	mov r6, #9072
	add  r6, r6, #0
	mov r6, #9072
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [fp, #-16]
	ldr r6, =504
	mul  r7, r4, r6
	add  r4, r5, r7
	ldr r5, [fp, #-12]
	mov r6, #28
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [fp, #-8]
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	ldr r5, [r4]
	mov r0, r5
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr
	b .L256
.L256:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-16]
	ldr r6, [fp, #-20]
	ldr r7, [fp, #-24]
	ldr r8, [fp, #-28]
	add  r9, r8, r7
	add  r7, r9, r6
	add  r6, r7, r5
	add  r5, r6, r4
	ldr r4, =0
	cmp r5, r4
	beq .L270
	b .L271
.L270:
	mov r0, #1
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr
	b .L271
.L271:
	ldr r4, =0
	str r4, [fp, #-4]
	ldr r4, [fp, #-28]
	ldr r5, =0
	cmp r4, r5
	bne .L274
	b .L275
.L274:
	ldr r4, [fp, #-28]
	ldr r5, [fp, #-8]
	mov r0, r5
	mov r1, #2
	bl equal
	mov r5, r0
	sub  r6, r4, r5
	ldr r4, [fp, #-28]
	sub  r5, r4, #1
	ldr r4, [fp, #-24]
	ldr r7, [fp, #-20]
	ldr r8, [fp, #-16]
	ldr r9, [fp, #-12]
	mov r0, r5
	mov r1, r4
	mov r2, r7
	mov r3, r8
	mov r4, r9
	str r4, [sp, #-8]
	mov r4, #1
	str r4, [sp, #-4]
	sub  sp, sp, #8
	bl dfs
	add  sp, sp, #8
	mov r4, r0
	mul  r5, r4, r6
	ldr r4, [fp, #-4]
	add  r6, r4, r5
	ldr r4, addr_mod
	ldr r5, [r4]
	sdiv  r4, r6, r5
	mul  r4, r4, r5
	sub  r5, r6, r4
	str r5, [fp, #-4]
	b .L275
.L275:
	ldr r4, [fp, #-24]
	ldr r5, =0
	cmp r4, r5
	bne .L277
	b .L278
.L277:
	ldr r4, [fp, #-24]
	ldr r5, [fp, #-8]
	mov r0, r5
	mov r1, #3
	bl equal
	mov r5, r0
	sub  r6, r4, r5
	ldr r4, [fp, #-28]
	add  r5, r4, #1
	ldr r4, [fp, #-24]
	sub  r7, r4, #1
	ldr r4, [fp, #-20]
	ldr r8, [fp, #-16]
	ldr r9, [fp, #-12]
	mov r0, r5
	mov r1, r7
	mov r2, r4
	mov r3, r8
	mov r4, r9
	str r4, [sp, #-8]
	mov r4, #2
	str r4, [sp, #-4]
	sub  sp, sp, #8
	bl dfs
	add  sp, sp, #8
	mov r4, r0
	mul  r5, r4, r6
	ldr r4, [fp, #-4]
	add  r6, r4, r5
	ldr r4, addr_mod
	ldr r5, [r4]
	sdiv  r4, r6, r5
	mul  r5, r4, r5
	sub  r4, r6, r5
	str r4, [fp, #-4]
	b .L278
.L278:
	ldr r4, [fp, #-20]
	ldr r5, =0
	cmp r4, r5
	bne .L280
	b .L281
.L280:
	ldr r4, [fp, #-20]
	ldr r5, [fp, #-8]
	mov r0, r5
	mov r1, #4
	bl equal
	mov r5, r0
	sub  r6, r4, r5
	ldr r4, [fp, #-28]
	ldr r5, [fp, #-24]
	add  r7, r5, #1
	ldr r5, [fp, #-20]
	sub  r8, r5, #1
	ldr r5, [fp, #-16]
	ldr r9, [fp, #-12]
	mov r0, r4
	mov r1, r7
	mov r2, r8
	mov r3, r5
	mov r4, r9
	str r4, [sp, #-8]
	mov r4, #3
	str r4, [sp, #-4]
	sub  sp, sp, #8
	bl dfs
	add  sp, sp, #8
	mov r4, r0
	mul  r5, r4, r6
	ldr r4, [fp, #-4]
	add  r6, r4, r5
	ldr r4, addr_mod
	ldr r5, [r4]
	sdiv  r4, r6, r5
	mul  r5, r4, r5
	sub  r4, r6, r5
	str r4, [fp, #-4]
	b .L281
.L281:
	ldr r4, [fp, #-16]
	ldr r5, =0
	cmp r4, r5
	bne .L283
	b .L284
.L283:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-8]
	mov r0, r5
	mov r1, #5
	bl equal
	mov r5, r0
	sub  r6, r4, r5
	ldr r4, [fp, #-28]
	ldr r5, [fp, #-24]
	ldr r7, [fp, #-20]
	add  r8, r7, #1
	ldr r7, [fp, #-16]
	sub  r9, r7, #1
	ldr r7, [fp, #-12]
	mov r0, r4
	mov r1, r5
	mov r2, r8
	mov r3, r9
	mov r4, r7
	str r4, [sp, #-8]
	mov r4, #4
	str r4, [sp, #-4]
	sub  sp, sp, #8
	bl dfs
	add  sp, sp, #8
	mov r4, r0
	mul  r5, r4, r6
	ldr r4, [fp, #-4]
	add  r6, r4, r5
	ldr r4, addr_mod
	ldr r5, [r4]
	sdiv  r4, r6, r5
	mul  r5, r4, r5
	sub  r4, r6, r5
	str r4, [fp, #-4]
	b .L284
.L284:
	ldr r4, [fp, #-12]
	ldr r5, =0
	cmp r4, r5
	bne .L286
	b .L287
.L286:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-28]
	ldr r6, [fp, #-24]
	ldr r7, [fp, #-20]
	ldr r8, [fp, #-16]
	add  r9, r8, #1
	ldr r8, [fp, #-12]
	sub  r10, r8, #1
	mov r0, r5
	mov r1, r6
	mov r2, r7
	mov r3, r9
	mov r5, r10
	str r5, [sp, #-8]
	mov r5, #5
	str r5, [sp, #-4]
	sub  sp, sp, #8
	bl dfs
	add  sp, sp, #8
	mov r5, r0
	mul  r6, r5, r4
	ldr r4, [fp, #-4]
	add  r5, r4, r6
	ldr r4, addr_mod
	ldr r6, [r4]
	sdiv  r4, r5, r6
	mul  r4, r4, r6
	sub  r6, r5, r4
	str r6, [fp, #-4]
	b .L287
.L287:
	ldr r4, [fp, #-4]
	ldr r5, addr_mod
	ldr r6, [r5]
	sdiv  r5, r4, r6
	mul  r6, r5, r6
	sub  r5, r4, r6
	ldr r4, [fp, #-28]
	ldr r6, addr_dp
	mov r7, #55744
	add  r7, r7, #2883584
	mov r7, #55744
	mul  r8, r4, r7
	add  r4, r6, r8
	mov r6, r4
	ldr r4, [fp, #-24]
	mov r7, #32224
	add  r7, r7, #131072
	mov r7, #32224
	mul  r8, r4, r7
	add  r4, r6, r8
	ldr r6, [fp, #-20]
	mov r7, #9072
	add  r7, r7, #0
	mov r7, #9072
	mul  r8, r6, r7
	add  r6, r4, r8
	ldr r4, [fp, #-16]
	ldr r7, =504
	mul  r8, r4, r7
	add  r4, r6, r8
	ldr r6, [fp, #-12]
	mov r7, #28
	mul  r8, r6, r7
	add  r6, r4, r8
	ldr r4, [fp, #-8]
	mov r7, #4
	mul  r8, r4, r7
	add  r4, r6, r8
	str r5, [r4]
	ldr r4, [fp, #-28]
	ldr r5, addr_dp
	mov r6, #55744
	add  r6, r6, #2883584
	mov r6, #55744
	mul  r7, r4, r6
	add  r4, r5, r7
	mov r5, r4
	ldr r4, [fp, #-24]
	mov r6, #32224
	add  r6, r6, #131072
	mov r6, #32224
	mul  r7, r4, r6
	add  r4, r5, r7
	ldr r5, [fp, #-20]
	mov r6, #9072
	add  r6, r6, #0
	mov r6, #9072
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [fp, #-16]
	ldr r6, =504
	mul  r7, r4, r6
	add  r4, r5, r7
	ldr r5, [fp, #-12]
	mov r6, #28
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [fp, #-8]
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	ldr r5, [r4]
	mov r0, r5
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr

	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov fp, sp
	sub  sp, sp, #44
.L300:
	bl getint
	mov r4, r0
	str r4, [fp, #-32]
	ldr r4, =0
	str r4, [fp, #-28]
	b .L303
.L303:
	ldr r4, [fp, #-28]
	ldr r5, addr_maxn
	ldr r6, [r5]
	cmp r4, r6
	blt .L304
	b .L305
.L304:
	ldr r4, =0
	str r4, [fp, #-24]
	b .L308
.L305:
	ldr r4, =0
	str r4, [fp, #-28]
	b .L337
.L308:
	ldr r4, [fp, #-24]
	ldr r5, addr_maxn
	ldr r6, [r5]
	cmp r4, r6
	blt .L309
	b .L310
.L309:
	ldr r4, =0
	str r4, [fp, #-20]
	b .L313
.L310:
	ldr r4, [fp, #-28]
	add  r5, r4, #1
	str r5, [fp, #-28]
	b .L303
.L313:
	ldr r4, [fp, #-20]
	ldr r5, addr_maxn
	ldr r6, [r5]
	cmp r4, r6
	blt .L314
	b .L315
.L314:
	ldr r4, =0
	str r4, [fp, #-16]
	b .L318
.L315:
	ldr r4, [fp, #-24]
	add  r5, r4, #1
	str r5, [fp, #-24]
	b .L308
.L318:
	ldr r4, [fp, #-16]
	ldr r5, addr_maxn
	ldr r6, [r5]
	cmp r4, r6
	blt .L319
	b .L320
.L319:
	ldr r4, =0
	str r4, [fp, #-12]
	b .L323
.L320:
	ldr r4, [fp, #-20]
	add  r5, r4, #1
	str r5, [fp, #-20]
	b .L313
.L323:
	ldr r4, [fp, #-12]
	ldr r5, addr_maxn
	ldr r6, [r5]
	cmp r4, r6
	blt .L324
	b .L325
.L324:
	ldr r4, =0
	str r4, [fp, #-8]
	b .L328
.L325:
	ldr r4, [fp, #-16]
	add  r5, r4, #1
	str r5, [fp, #-16]
	b .L318
.L328:
	ldr r4, [fp, #-8]
	ldr r5, =7
	cmp r4, r5
	blt .L329
	b .L330
.L329:
	ldr r4, =0
	sub  r5, r4, #1
	ldr r4, [fp, #-28]
	ldr r6, addr_dp
	mov r7, #55744
	add  r7, r7, #2883584
	mov r7, #55744
	mul  r8, r4, r7
	add  r4, r6, r8
	mov r6, r4
	ldr r4, [fp, #-24]
	mov r7, #32224
	add  r7, r7, #131072
	mov r7, #32224
	mul  r8, r4, r7
	add  r4, r6, r8
	ldr r6, [fp, #-20]
	mov r7, #9072
	add  r7, r7, #0
	mov r7, #9072
	mul  r8, r6, r7
	add  r6, r4, r8
	ldr r4, [fp, #-16]
	ldr r7, =504
	mul  r8, r4, r7
	add  r4, r6, r8
	ldr r6, [fp, #-12]
	mov r7, #28
	mul  r8, r6, r7
	add  r6, r4, r8
	ldr r4, [fp, #-8]
	mov r7, #4
	mul  r8, r4, r7
	add  r4, r6, r8
	str r5, [r4]
	ldr r4, [fp, #-8]
	add  r5, r4, #1
	str r5, [fp, #-8]
	b .L328
.L330:
	ldr r4, [fp, #-12]
	add  r5, r4, #1
	str r5, [fp, #-12]
	b .L323
.L337:
	ldr r4, [fp, #-28]
	ldr r5, [fp, #-32]
	cmp r4, r5
	blt .L338
	b .L339
.L338:
	bl getint
	mov r4, r0
	ldr r5, [fp, #-28]
	ldr r6, addr_list
	mov r8, #4
	mul  r7, r5, r8
	add  r5, r6, r7
	mov r6, r5
	str r4, [r6]
	ldr r4, [fp, #-28]
	ldr r5, addr_list
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	ldr r5, addr_cns
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	add  r5, r4, #1
	ldr r4, [fp, #-28]
	ldr r6, addr_list
	mov r7, #4
	mul  r8, r4, r7
	add  r4, r6, r8
	mov r6, r4
	ldr r4, [r6]
	ldr r6, addr_cns
	mov r7, #4
	mul  r8, r4, r7
	add  r4, r6, r8
	mov r6, r4
	str r5, [r6]
	ldr r4, [fp, #-28]
	add  r5, r4, #1
	str r5, [fp, #-28]
	b .L337
.L339:
	mov r4, #1
	ldr r5, addr_cns
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	mov r5, #2
	ldr r6, addr_cns
	mov r7, #4
	mul  r8, r5, r7
	add  r5, r6, r8
	mov r6, r5
	ldr r5, [r6]
	mov r6, #3
	ldr r7, addr_cns
	mov r8, #4
	mul  r9, r6, r8
	add  r6, r7, r9
	mov r7, r6
	ldr r6, [r7]
	mov r7, #4
	ldr r8, addr_cns
	mov r9, #4
	mul  r10, r7, r9
	add  r7, r8, r10
	mov r8, r7
	ldr r7, [r8]
	str r7, [fp, #-44]
	mov r7, #5
	ldr r8, addr_cns
	mov r10, #4
	mul  r9, r7, r10
	add  r7, r8, r9
	mov r8, r7
	ldr r7, [r8]
	mov r0, r4
	mov r1, r5
	mov r2, r6
	ldr r4, [fp, #-44]
	mov r3, r4
	mov r4, r7
	str r4, [sp, #-8]
	mov r4, #0
	str r4, [sp, #-4]
	sub  sp, sp, #8
	bl dfs
	add  sp, sp, #8
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putint
	ldr r4, [fp, #-4]
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr

addr_maxn:
	.word maxn
addr_mod:
	.word mod
addr_dp:
	.word dp
addr_list:
	.word list
addr_cns:
	.word cns
