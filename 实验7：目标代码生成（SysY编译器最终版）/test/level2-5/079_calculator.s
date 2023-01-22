	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.balign 4
	ints: .skip 40000
	.global intt
	.align 4
	.size intt, 4
intt:
	.word 0
	.balign 4
	chas: .skip 40000
	.global chat
	.align 4
	.size chat, 4
chat:
	.word 0
	.global i
	.align 4
	.size i, 4
i:
	.word 0
	.global ii
	.align 4
	.size ii, 4
ii:
	.word 1
	.global c
	.align 4
	.size c, 4
c:
	.word 0
	.balign 4
	get: .skip 40000
	.balign 4
	get2: .skip 40000
	.text
	.global isdigit
	.type isdigit , %function
isdigit:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub  sp, sp, #4
.L385:
	str r0, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, =48
	cmp r4, r5
	movge r4, #1
	movlt r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L393
	b .L389
.L388:
	mov r0, #1
	sub  sp, fp, #0
	pop {r4, r5, fp, lr}
	bx lr
	b .L389
.L389:
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, fp, lr}
	bx lr
.L393:
	ldr r4, [fp, #-4]
	ldr r5, =57
	cmp r4, r5
	movle r4, #1
	movgt r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L388
	b .L389

	.global power
	.type power , %function
power:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub  sp, sp, #12
.L397:
	str r0, [fp, #-12]
	str r1, [fp, #-8]
	ldr r4, =1
	str r4, [fp, #-4]
	b .L403
.L403:
	ldr r4, [fp, #-8]
	ldr r5, =0
	cmp r4, r5
	bne .L404
	b .L405
.L404:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-12]
	mul  r6, r5, r4
	str r6, [fp, #-4]
	ldr r4, [fp, #-8]
	sub  r5, r4, #1
	str r5, [fp, #-8]
	b .L403
.L405:
	ldr r4, [fp, #-4]
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, fp, lr}
	bx lr

	.global getstr
	.type getstr , %function
getstr:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub  sp, sp, #12
.L407:
	str r0, [fp, #-12]
	bl getch
	mov r4, r0
	str r4, [fp, #-8]
	ldr r4, =0
	str r4, [fp, #-4]
	b .L412
.L412:
	ldr r4, [fp, #-8]
	ldr r5, =13
	cmp r4, r5
	movne r4, #1
	moveq r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L418
	b .L414
.L413:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-12]
	ldr r6, [fp, #-4]
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r5, r8
	str r4, [r6]
	ldr r4, [fp, #-4]
	add  r5, r4, #1
	str r5, [fp, #-4]
	bl getch
	mov r4, r0
	str r4, [fp, #-8]
	b .L412
.L414:
	ldr r4, [fp, #-4]
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L418:
	ldr r4, [fp, #-8]
	ldr r5, =10
	cmp r4, r5
	movne r4, #1
	moveq r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L413
	b .L414

	.global intpush
	.type intpush , %function
intpush:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub  sp, sp, #4
.L423:
	str r0, [fp, #-4]
	ldr r4, addr_intt
	ldr r5, [r4]
	add  r4, r5, #1
	ldr r5, addr_intt
	str r4, [r5]
	ldr r4, [fp, #-4]
	ldr r5, addr_intt
	ldr r6, [r5]
	ldr r5, addr_ints
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r5, r8
	mov r5, r6
	str r4, [r5]
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

	.global chapush
	.type chapush , %function
chapush:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub  sp, sp, #4
.L426:
	str r0, [fp, #-4]
	ldr r4, addr_chat
	ldr r5, [r4]
	add  r4, r5, #1
	ldr r5, addr_chat
	str r4, [r5]
	ldr r4, [fp, #-4]
	ldr r5, addr_chat
	ldr r6, [r5]
	ldr r5, addr_chas
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r5, r8
	mov r5, r6
	str r4, [r5]
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

	.global intpop
	.type intpop , %function
intpop:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub  sp, sp, #0
.L429:
	ldr r4, addr_intt
	ldr r5, [r4]
	sub  r4, r5, #1
	ldr r5, addr_intt
	str r4, [r5]
	ldr r4, addr_intt
	ldr r5, [r4]
	add  r4, r5, #1
	ldr r5, addr_ints
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

	.global chapop
	.type chapop , %function
chapop:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub  sp, sp, #0
.L431:
	ldr r4, addr_chat
	ldr r5, [r4]
	sub  r4, r5, #1
	ldr r5, addr_chat
	str r4, [r5]
	ldr r4, addr_chat
	ldr r5, [r4]
	add  r4, r5, #1
	ldr r5, addr_chas
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

	.global intadd
	.type intadd , %function
intadd:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub  sp, sp, #4
.L433:
	str r0, [fp, #-4]
	ldr r4, addr_intt
	ldr r5, [r4]
	ldr r4, addr_ints
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	ldr r4, =10
	mul  r6, r4, r5
	ldr r4, addr_intt
	ldr r5, [r4]
	ldr r4, addr_ints
	mov r7, #4
	mul  r8, r5, r7
	add  r5, r4, r8
	mov r4, r5
	str r6, [r4]
	ldr r4, [fp, #-4]
	ldr r5, addr_intt
	ldr r6, [r5]
	ldr r5, addr_ints
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r5, r8
	mov r5, r6
	ldr r6, [r5]
	add  r5, r6, r4
	ldr r4, addr_intt
	ldr r6, [r4]
	ldr r4, addr_ints
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r4, r8
	mov r4, r6
	str r5, [r4]
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

	.global find
	.type find , %function
find:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub  sp, sp, #0
.L438:
	bl chapop
	mov r4, r0
	ldr r5, addr_c
	str r4, [r5]
	ldr r4, addr_ii
	ldr r5, [r4]
	ldr r4, addr_get2
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	mov r4, r5
	ldr r5, =32
	str r5, [r4]
	ldr r4, addr_c
	ldr r5, [r4]
	ldr r4, addr_ii
	ldr r6, [r4]
	add  r4, r6, #1
	ldr r6, addr_get2
	mov r7, #4
	mul  r8, r4, r7
	add  r4, r6, r8
	mov r6, r4
	str r5, [r6]
	ldr r4, addr_ii
	ldr r5, [r4]
	add  r4, r5, #2
	ldr r5, addr_ii
	str r4, [r5]
	ldr r4, addr_chat
	ldr r5, [r4]
	ldr r4, =0
	cmp r5, r4
	beq .L439
	b .L440
.L439:
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
	b .L440
.L440:
	mov r0, #1
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub  sp, sp, #20
.L442:
	ldr r4, =0
	ldr r5, addr_intt
	str r4, [r5]
	ldr r4, =0
	ldr r5, addr_chat
	str r4, [r5]
	mov r4, #0
	ldr r5, addr_get
	mov r7, #4
	mul  r6, r4, r7
	add  r4, r5, r6
	mov r5, r4
	mov r0, r5
	bl getstr
	mov r4, r0
	str r4, [fp, #-20]
	b .L444
.L444:
	ldr r4, addr_i
	ldr r5, [r4]
	ldr r4, [fp, #-20]
	cmp r5, r4
	blt .L445
	b .L446
.L445:
	ldr r4, addr_i
	ldr r5, [r4]
	ldr r4, addr_get
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	mov r0, r5
	bl isdigit
	mov r4, r0
	ldr r5, =1
	cmp r4, r5
	beq .L448
	b .L449
.L446:
	b .L640
.L448:
	ldr r4, addr_i
	ldr r5, [r4]
	ldr r4, addr_get
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	ldr r4, addr_ii
	ldr r6, [r4]
	ldr r4, addr_get2
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r4, r8
	mov r4, r6
	str r5, [r4]
	ldr r4, addr_ii
	ldr r5, [r4]
	add  r4, r5, #1
	ldr r5, addr_ii
	str r4, [r5]
	b .L450
.L449:
	ldr r4, addr_i
	ldr r5, [r4]
	ldr r4, addr_get
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	ldr r4, =40
	cmp r5, r4
	beq .L454
	b .L455
.L450:
	ldr r4, addr_i
	ldr r5, [r4]
	add  r4, r5, #1
	ldr r5, addr_i
	str r4, [r5]
	b .L444
.L454:
	mov r0, #40
	bl chapush
	b .L455
.L455:
	ldr r4, addr_i
	ldr r5, [r4]
	ldr r4, addr_get
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	ldr r4, =94
	cmp r5, r4
	beq .L458
	b .L459
.L458:
	mov r0, #94
	bl chapush
	b .L459
.L459:
	ldr r4, addr_i
	ldr r5, [r4]
	ldr r4, addr_get
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	ldr r4, =41
	cmp r5, r4
	beq .L462
	b .L463
.L462:
	bl chapop
	mov r4, r0
	ldr r5, addr_c
	str r4, [r5]
	b .L466
.L463:
	ldr r4, addr_i
	ldr r5, [r4]
	ldr r4, addr_get
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	ldr r4, =43
	cmp r5, r4
	beq .L470
	b .L471
.L466:
	ldr r4, addr_c
	ldr r5, [r4]
	ldr r4, =40
	cmp r5, r4
	bne .L467
	b .L468
.L467:
	ldr r4, addr_ii
	ldr r5, [r4]
	ldr r4, addr_get2
	mov r7, #4
	mul  r6, r5, r7
	add  r5, r4, r6
	mov r4, r5
	ldr r5, =32
	str r5, [r4]
	ldr r4, addr_c
	ldr r5, [r4]
	ldr r4, addr_ii
	ldr r6, [r4]
	add  r4, r6, #1
	ldr r6, addr_get2
	mov r8, #4
	mul  r7, r4, r8
	add  r4, r6, r7
	mov r6, r4
	str r5, [r6]
	ldr r4, addr_ii
	ldr r5, [r4]
	add  r4, r5, #2
	ldr r5, addr_ii
	str r4, [r5]
	bl chapop
	mov r4, r0
	ldr r5, addr_c
	str r4, [r5]
	b .L466
.L468:
	b .L463
.L470:
	b .L474
.L471:
	ldr r4, addr_i
	ldr r5, [r4]
	ldr r4, addr_get
	mov r7, #4
	mul  r6, r5, r7
	add  r5, r4, r6
	mov r4, r5
	ldr r5, [r4]
	ldr r4, =45
	cmp r5, r4
	beq .L510
	b .L511
.L474:
	ldr r4, addr_chat
	ldr r5, [r4]
	ldr r4, addr_chas
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	ldr r4, =43
	cmp r5, r4
	moveq r4, #1
	movne r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L475
	b .L481
.L475:
	bl find
	mov r4, r0
	ldr r5, =0
	cmp r4, r5
	beq .L506
	b .L507
.L476:
	mov r0, #43
	bl chapush
	b .L471
.L481:
	ldr r4, addr_chat
	ldr r5, [r4]
	ldr r4, addr_chas
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	ldr r4, =45
	cmp r5, r4
	moveq r4, #1
	movne r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L475
	b .L486
.L486:
	ldr r4, addr_chat
	ldr r5, [r4]
	ldr r4, addr_chas
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	ldr r4, =42
	cmp r5, r4
	moveq r4, #1
	movne r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L475
	b .L491
.L491:
	ldr r4, addr_chat
	ldr r5, [r4]
	ldr r4, addr_chas
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	ldr r4, =47
	cmp r5, r4
	moveq r4, #1
	movne r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L475
	b .L496
.L496:
	ldr r4, addr_chat
	ldr r5, [r4]
	ldr r4, addr_chas
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	ldr r4, =37
	cmp r5, r4
	moveq r4, #1
	movne r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L475
	b .L501
.L501:
	ldr r4, addr_chat
	ldr r5, [r4]
	ldr r4, addr_chas
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	ldr r4, =94
	cmp r5, r4
	moveq r4, #1
	movne r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L475
	b .L476
.L506:
	b .L476
.L507:
	b .L474
.L509:
	b .L507
.L510:
	b .L514
.L511:
	ldr r4, addr_i
	ldr r5, [r4]
	ldr r4, addr_get
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	ldr r4, =42
	cmp r5, r4
	beq .L550
	b .L551
.L514:
	ldr r4, addr_chat
	ldr r5, [r4]
	ldr r4, addr_chas
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	ldr r4, =43
	cmp r5, r4
	moveq r4, #1
	movne r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L515
	b .L521
.L515:
	bl find
	mov r4, r0
	ldr r5, =0
	cmp r4, r5
	beq .L546
	b .L547
.L516:
	mov r0, #45
	bl chapush
	b .L511
.L521:
	ldr r4, addr_chat
	ldr r5, [r4]
	ldr r4, addr_chas
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	ldr r4, =45
	cmp r5, r4
	moveq r4, #1
	movne r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L515
	b .L526
.L526:
	ldr r4, addr_chat
	ldr r5, [r4]
	ldr r4, addr_chas
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	ldr r4, =42
	cmp r5, r4
	moveq r4, #1
	movne r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L515
	b .L531
.L531:
	ldr r4, addr_chat
	ldr r5, [r4]
	ldr r4, addr_chas
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	ldr r4, =47
	cmp r5, r4
	moveq r4, #1
	movne r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L515
	b .L536
.L536:
	ldr r4, addr_chat
	ldr r5, [r4]
	ldr r4, addr_chas
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	ldr r4, =37
	cmp r5, r4
	moveq r4, #1
	movne r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L515
	b .L541
.L541:
	ldr r4, addr_chat
	ldr r5, [r4]
	ldr r4, addr_chas
	mov r7, #4
	mul  r6, r5, r7
	add  r5, r4, r6
	mov r4, r5
	ldr r5, [r4]
	ldr r4, =94
	cmp r5, r4
	moveq r4, #1
	movne r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L515
	b .L516
.L546:
	b .L516
.L547:
	b .L514
.L549:
	b .L547
.L550:
	b .L554
.L551:
	ldr r4, addr_i
	ldr r5, [r4]
	ldr r4, addr_get
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	ldr r4, =47
	cmp r5, r4
	beq .L580
	b .L581
.L554:
	ldr r4, addr_chat
	ldr r5, [r4]
	ldr r4, addr_chas
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	ldr r4, =42
	cmp r5, r4
	moveq r4, #1
	movne r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L555
	b .L561
.L555:
	bl find
	mov r4, r0
	ldr r5, =0
	cmp r4, r5
	beq .L576
	b .L577
.L556:
	mov r0, #42
	bl chapush
	b .L551
.L561:
	ldr r4, addr_chat
	ldr r5, [r4]
	ldr r4, addr_chas
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	ldr r4, =47
	cmp r5, r4
	moveq r4, #1
	movne r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L555
	b .L566
.L566:
	ldr r4, addr_chat
	ldr r5, [r4]
	ldr r4, addr_chas
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	ldr r4, =37
	cmp r5, r4
	moveq r4, #1
	movne r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L555
	b .L571
.L571:
	ldr r4, addr_chat
	ldr r5, [r4]
	ldr r4, addr_chas
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	ldr r4, =94
	cmp r5, r4
	moveq r4, #1
	movne r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L555
	b .L556
.L576:
	b .L556
.L577:
	b .L554
.L579:
	b .L577
.L580:
	b .L584
.L581:
	ldr r4, addr_i
	ldr r5, [r4]
	ldr r4, addr_get
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	ldr r4, =37
	cmp r5, r4
	beq .L610
	b .L611
.L584:
	ldr r4, addr_chat
	ldr r5, [r4]
	ldr r4, addr_chas
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	ldr r4, =42
	cmp r5, r4
	moveq r4, #1
	movne r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L585
	b .L591
.L585:
	bl find
	mov r4, r0
	ldr r5, =0
	cmp r4, r5
	beq .L606
	b .L607
.L586:
	mov r0, #47
	bl chapush
	b .L581
.L591:
	ldr r4, addr_chat
	ldr r5, [r4]
	ldr r4, addr_chas
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	ldr r4, =47
	cmp r5, r4
	moveq r4, #1
	movne r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L585
	b .L596
.L596:
	ldr r4, addr_chat
	ldr r5, [r4]
	ldr r4, addr_chas
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	ldr r4, =37
	cmp r5, r4
	moveq r4, #1
	movne r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L585
	b .L601
.L601:
	ldr r4, addr_chat
	ldr r5, [r4]
	ldr r4, addr_chas
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	ldr r4, =94
	cmp r5, r4
	moveq r4, #1
	movne r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L585
	b .L586
.L606:
	b .L586
.L607:
	b .L584
.L609:
	b .L607
.L610:
	b .L614
.L611:
	ldr r4, addr_ii
	ldr r5, [r4]
	ldr r4, addr_get2
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	mov r4, r5
	ldr r5, =32
	str r5, [r4]
	ldr r4, addr_ii
	ldr r5, [r4]
	add  r4, r5, #1
	ldr r5, addr_ii
	str r4, [r5]
	b .L450
.L614:
	ldr r4, addr_chat
	ldr r5, [r4]
	ldr r4, addr_chas
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	ldr r4, =42
	cmp r5, r4
	moveq r4, #1
	movne r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L615
	b .L621
.L615:
	bl find
	mov r4, r0
	ldr r5, =0
	cmp r4, r5
	beq .L636
	b .L637
.L616:
	mov r0, #37
	bl chapush
	b .L611
.L621:
	ldr r4, addr_chat
	ldr r5, [r4]
	ldr r4, addr_chas
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	ldr r4, =47
	cmp r5, r4
	moveq r4, #1
	movne r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L615
	b .L626
.L626:
	ldr r4, addr_chat
	ldr r5, [r4]
	ldr r4, addr_chas
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	ldr r4, =37
	cmp r5, r4
	moveq r4, #1
	movne r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L615
	b .L631
.L631:
	ldr r4, addr_chat
	ldr r5, [r4]
	ldr r4, addr_chas
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	ldr r4, =94
	cmp r5, r4
	moveq r4, #1
	movne r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L615
	b .L616
.L636:
	b .L616
.L637:
	b .L614
.L639:
	b .L637
.L640:
	ldr r4, addr_chat
	ldr r5, [r4]
	ldr r4, =0
	cmp r5, r4
	bgt .L641
	b .L642
.L641:
	bl chapop
	mov r4, r0
	str r4, [fp, #-16]
	ldr r4, addr_ii
	ldr r5, [r4]
	ldr r4, addr_get2
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	mov r4, r5
	ldr r5, =32
	str r5, [r4]
	ldr r4, [fp, #-16]
	ldr r5, addr_ii
	ldr r6, [r5]
	add  r5, r6, #1
	ldr r6, addr_get2
	mov r7, #4
	mul  r8, r5, r7
	add  r5, r6, r8
	mov r6, r5
	str r4, [r6]
	ldr r4, addr_ii
	ldr r5, [r4]
	add  r4, r5, #2
	ldr r5, addr_ii
	str r4, [r5]
	b .L640
.L642:
	ldr r4, addr_ii
	ldr r5, [r4]
	ldr r4, addr_get2
	mov r7, #4
	mul  r6, r5, r7
	add  r5, r4, r6
	mov r4, r5
	ldr r5, =64
	str r5, [r4]
	ldr r4, =1
	ldr r5, addr_i
	str r4, [r5]
	b .L645
.L645:
	ldr r4, addr_i
	ldr r5, [r4]
	ldr r4, addr_get2
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	ldr r4, =64
	cmp r5, r4
	bne .L646
	b .L647
.L646:
	ldr r4, addr_i
	ldr r5, [r4]
	ldr r4, addr_get2
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	ldr r4, =43
	cmp r5, r4
	moveq r4, #1
	movne r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L650
	b .L657
.L647:
	mov r4, #1
	ldr r5, addr_ints
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	mov r0, r4
	bl putint
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L650:
	bl intpop
	mov r4, r0
	str r4, [fp, #-12]
	bl intpop
	mov r4, r0
	str r4, [fp, #-8]
	ldr r4, addr_i
	ldr r5, [r4]
	ldr r4, addr_get2
	mov r7, #4
	mul  r6, r5, r7
	add  r5, r4, r6
	mov r4, r5
	ldr r5, [r4]
	ldr r4, =43
	cmp r5, r4
	beq .L685
	b .L686
.L651:
	ldr r4, addr_i
	ldr r5, [r4]
	ldr r4, addr_get2
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	ldr r4, =32
	cmp r5, r4
	bne .L709
	b .L710
.L652:
	ldr r4, addr_i
	ldr r5, [r4]
	add  r4, r5, #1
	ldr r5, addr_i
	str r4, [r5]
	b .L645
.L657:
	ldr r4, addr_i
	ldr r5, [r4]
	ldr r4, addr_get2
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	ldr r4, =45
	cmp r5, r4
	moveq r4, #1
	movne r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L650
	b .L662
.L662:
	ldr r4, addr_i
	ldr r5, [r4]
	ldr r4, addr_get2
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	ldr r4, =42
	cmp r5, r4
	moveq r4, #1
	movne r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L650
	b .L667
.L667:
	ldr r4, addr_i
	ldr r5, [r4]
	ldr r4, addr_get2
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	ldr r4, =47
	cmp r5, r4
	moveq r4, #1
	movne r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L650
	b .L672
.L672:
	ldr r4, addr_i
	ldr r5, [r4]
	ldr r4, addr_get2
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	ldr r4, =37
	cmp r5, r4
	moveq r4, #1
	movne r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L650
	b .L677
.L677:
	ldr r4, addr_i
	ldr r5, [r4]
	ldr r4, addr_get2
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	ldr r4, =94
	cmp r5, r4
	moveq r4, #1
	movne r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L650
	b .L651
.L685:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-12]
	add  r6, r5, r4
	str r6, [fp, #-4]
	b .L686
.L686:
	ldr r4, addr_i
	ldr r5, [r4]
	ldr r4, addr_get2
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	ldr r4, =45
	cmp r5, r4
	beq .L689
	b .L690
.L689:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-12]
	sub  r6, r4, r5
	str r6, [fp, #-4]
	b .L690
.L690:
	ldr r4, addr_i
	ldr r5, [r4]
	ldr r4, addr_get2
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	ldr r4, =42
	cmp r5, r4
	beq .L693
	b .L694
.L693:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-8]
	mul  r6, r5, r4
	str r6, [fp, #-4]
	b .L694
.L694:
	ldr r4, addr_i
	ldr r5, [r4]
	ldr r4, addr_get2
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	ldr r4, =47
	cmp r5, r4
	beq .L697
	b .L698
.L697:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-12]
	sdiv  r6, r4, r5
	str r6, [fp, #-4]
	b .L698
.L698:
	ldr r4, addr_i
	ldr r5, [r4]
	ldr r4, addr_get2
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	ldr r4, =37
	cmp r5, r4
	beq .L701
	b .L702
.L701:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-12]
	sdiv  r6, r4, r5
	mul  r6, r6, r5
	sub  r5, r4, r6
	str r5, [fp, #-4]
	b .L702
.L702:
	ldr r4, addr_i
	ldr r5, [r4]
	ldr r4, addr_get2
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	ldr r4, =94
	cmp r5, r4
	beq .L705
	b .L706
.L705:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-12]
	mov r0, r4
	mov r1, r5
	bl power
	mov r4, r0
	str r4, [fp, #-4]
	b .L706
.L706:
	ldr r4, [fp, #-4]
	mov r0, r4
	bl intpush
	b .L652
.L709:
	ldr r4, addr_i
	ldr r5, [r4]
	ldr r4, addr_get2
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	mov r4, r5
	ldr r5, [r4]
	sub  r4, r5, #48
	mov r0, r4
	bl intpush
	ldr r4, =1
	ldr r5, addr_ii
	str r4, [r5]
	b .L714
.L710:
	b .L652
.L714:
	ldr r4, addr_ii
	ldr r5, [r4]
	ldr r4, addr_i
	ldr r6, [r4]
	add  r4, r6, r5
	ldr r5, addr_get2
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	ldr r5, =32
	cmp r4, r5
	bne .L715
	b .L716
.L715:
	ldr r4, addr_ii
	ldr r5, [r4]
	ldr r4, addr_i
	ldr r6, [r4]
	add  r4, r6, r5
	ldr r5, addr_get2
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	sub  r5, r4, #48
	mov r0, r5
	bl intadd
	ldr r4, addr_ii
	ldr r5, [r4]
	add  r4, r5, #1
	ldr r5, addr_ii
	str r4, [r5]
	b .L714
.L716:
	ldr r4, addr_ii
	ldr r5, [r4]
	ldr r4, addr_i
	ldr r6, [r4]
	add  r4, r6, r5
	sub  r5, r4, #1
	ldr r4, addr_i
	str r5, [r4]
	b .L710

addr_ints:
	.word ints
addr_intt:
	.word intt
addr_chas:
	.word chas
addr_chat:
	.word chat
addr_i:
	.word i
addr_ii:
	.word ii
addr_c:
	.word c
addr_get:
	.word get
addr_get2:
	.word get2
