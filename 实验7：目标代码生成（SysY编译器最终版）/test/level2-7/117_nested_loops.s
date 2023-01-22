	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.balign 4
	arr1: .skip 57600
	.balign 4
	arr2: .skip 107520
	.text
	.global loop1
	.type loop1 , %function
loop1:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub  sp, sp, #36
.L276:
	str r0, [fp, #-36]
	str r1, [fp, #-32]
	ldr r4, =0
	str r4, [fp, #-28]
	b .L288
.L288:
	ldr r4, [fp, #-36]
	ldr r5, [fp, #-28]
	cmp r4, r5
	movgt r4, #1
	movle r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L294
	b .L290
.L289:
	ldr r4, =0
	str r4, [fp, #-24]
	b .L298
.L290:
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L294:
	ldr r4, [fp, #-32]
	ldr r5, [fp, #-28]
	cmp r4, r5
	movgt r4, #1
	movle r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L289
	b .L290
.L298:
	ldr r4, [fp, #-24]
	ldr r5, =2
	cmp r5, r4
	bgt .L299
	b .L300
.L299:
	ldr r4, =0
	str r4, [fp, #-20]
	b .L302
.L300:
	ldr r4, [fp, #-28]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-28]
	b .L288
.L302:
	ldr r4, [fp, #-20]
	ldr r5, =3
	cmp r5, r4
	bgt .L303
	b .L304
.L303:
	ldr r4, =0
	str r4, [fp, #-16]
	b .L306
.L304:
	ldr r4, [fp, #-24]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-24]
	b .L298
.L306:
	ldr r4, [fp, #-16]
	ldr r5, =4
	cmp r5, r4
	bgt .L307
	b .L308
.L307:
	ldr r4, =0
	str r4, [fp, #-12]
	b .L310
.L308:
	ldr r4, [fp, #-20]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-20]
	b .L302
.L310:
	ldr r4, [fp, #-12]
	ldr r5, =5
	cmp r5, r4
	bgt .L311
	b .L312
.L311:
	ldr r4, =0
	str r4, [fp, #-8]
	b .L314
.L312:
	ldr r4, [fp, #-16]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-16]
	b .L306
.L314:
	ldr r4, [fp, #-8]
	ldr r5, =6
	cmp r5, r4
	bgt .L315
	b .L316
.L315:
	ldr r4, =0
	str r4, [fp, #-4]
	b .L318
.L316:
	ldr r4, [fp, #-12]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-12]
	b .L310
.L318:
	ldr r4, [fp, #-4]
	ldr r5, =2
	cmp r5, r4
	bgt .L319
	b .L320
.L319:
	ldr r4, [fp, #-28]
	ldr r5, [fp, #-24]
	add  r6, r5, r4
	ldr r4, [fp, #-20]
	add  r5, r4, r6
	ldr r4, [fp, #-16]
	add  r6, r4, r5
	ldr r4, [fp, #-12]
	add  r5, r4, r6
	ldr r4, [fp, #-8]
	add  r6, r4, r5
	ldr r4, [fp, #-4]
	add  r5, r4, r6
	ldr r4, [fp, #-36]
	add  r6, r4, r5
	ldr r4, [fp, #-32]
	add  r5, r4, r6
	ldr r4, [fp, #-28]
	ldr r6, addr_arr1
	mov r7, #5760
	add  r7, r7, #0
	mov r7, #5760
	mul  r8, r4, r7
	add  r4, r6, r8
	mov r6, r4
	ldr r4, [fp, #-24]
	mov r7, #2880
	add  r7, r7, #0
	mov r7, #2880
	mul  r8, r4, r7
	add  r4, r6, r8
	ldr r6, [fp, #-20]
	mov r8, #960
	add  r8, r8, #0
	mov r8, #960
	mul  r7, r6, r8
	add  r6, r4, r7
	ldr r4, [fp, #-16]
	mov r7, #240
	mul  r8, r4, r7
	add  r4, r6, r8
	ldr r6, [fp, #-12]
	mov r7, #48
	mul  r8, r6, r7
	add  r6, r4, r8
	ldr r4, [fp, #-8]
	mov r7, #8
	mul  r8, r4, r7
	add  r4, r6, r8
	ldr r6, [fp, #-4]
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r4, r8
	str r5, [r6]
	ldr r4, [fp, #-4]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-4]
	b .L318
.L320:
	ldr r4, [fp, #-8]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-8]
	b .L314

	.global loop2
	.type loop2 , %function
loop2:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub  sp, sp, #28
.L328:
	ldr r4, =0
	str r4, [fp, #-28]
	b .L336
.L336:
	ldr r4, [fp, #-28]
	ldr r5, =10
	cmp r5, r4
	bgt .L337
	b .L338
.L337:
	ldr r4, =0
	str r4, [fp, #-24]
	b .L340
.L338:
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L340:
	ldr r4, [fp, #-24]
	ldr r5, =2
	cmp r5, r4
	bgt .L341
	b .L342
.L341:
	ldr r4, =0
	str r4, [fp, #-20]
	b .L344
.L342:
	ldr r4, [fp, #-28]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-28]
	b .L336
.L344:
	ldr r4, [fp, #-20]
	ldr r5, =3
	cmp r5, r4
	bgt .L345
	b .L346
.L345:
	ldr r4, =0
	str r4, [fp, #-16]
	b .L348
.L346:
	ldr r4, [fp, #-24]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-24]
	b .L340
.L348:
	ldr r4, [fp, #-16]
	ldr r5, =2
	cmp r5, r4
	bgt .L349
	b .L350
.L349:
	ldr r4, =0
	str r4, [fp, #-12]
	b .L352
.L350:
	ldr r4, [fp, #-20]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-20]
	b .L344
.L352:
	ldr r4, [fp, #-12]
	ldr r5, =4
	cmp r5, r4
	bgt .L353
	b .L354
.L353:
	ldr r4, =0
	str r4, [fp, #-8]
	b .L356
.L354:
	ldr r4, [fp, #-16]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-16]
	b .L348
.L356:
	ldr r4, [fp, #-8]
	ldr r5, =8
	cmp r5, r4
	bgt .L357
	b .L358
.L357:
	ldr r4, =0
	str r4, [fp, #-4]
	b .L360
.L358:
	ldr r4, [fp, #-12]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-12]
	b .L352
.L360:
	ldr r4, [fp, #-4]
	ldr r5, =7
	cmp r5, r4
	bgt .L361
	b .L362
.L361:
	ldr r4, [fp, #-28]
	ldr r5, [fp, #-24]
	add  r6, r5, r4
	ldr r4, [fp, #-16]
	add  r5, r4, r6
	ldr r4, [fp, #-4]
	add  r6, r4, r5
	ldr r4, [fp, #-28]
	ldr r5, addr_arr2
	mov r7, #10752
	add  r7, r7, #0
	mov r7, #10752
	mul  r8, r4, r7
	add  r4, r5, r8
	mov r5, r4
	ldr r4, [fp, #-24]
	mov r7, #5376
	add  r7, r7, #0
	mov r7, #5376
	mul  r8, r4, r7
	add  r4, r5, r8
	ldr r5, [fp, #-20]
	mov r7, #1792
	add  r7, r7, #0
	mov r7, #1792
	mul  r8, r5, r7
	add  r5, r4, r8
	ldr r4, [fp, #-16]
	mov r8, #896
	add  r8, r8, #0
	mov r8, #896
	mul  r7, r4, r8
	add  r4, r5, r7
	ldr r5, [fp, #-12]
	mov r7, #224
	mul  r8, r5, r7
	add  r5, r4, r8
	ldr r4, [fp, #-8]
	mov r7, #28
	mul  r8, r4, r7
	add  r4, r5, r8
	ldr r5, [fp, #-4]
	mov r7, #4
	mul  r8, r5, r7
	add  r5, r4, r8
	str r6, [r5]
	ldr r4, [fp, #-4]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-4]
	b .L360
.L362:
	ldr r4, [fp, #-8]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-8]
	b .L356

	.global loop3
	.type loop3 , %function
loop3:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub  sp, sp, #60
.L370:
	str r0, [fp, #-60]
	str r1, [fp, #-56]
	str r2, [fp, #-52]
	str r3, [fp, #-48]
	ldr r4, [fp, #28]
	str r4, [fp, #-44]
	ldr r4, [fp, #32]
	str r4, [fp, #-40]
	ldr r4, [fp, #36]
	str r4, [fp, #-36]
	ldr r4, =0
	str r4, [fp, #-4]
	ldr r4, =0
	str r4, [fp, #-32]
	b .L393
.L393:
	ldr r4, [fp, #-32]
	ldr r5, =10
	cmp r5, r4
	bgt .L394
	b .L395
.L394:
	ldr r4, =0
	str r4, [fp, #-28]
	b .L397
.L395:
	ldr r4, [fp, #-4]
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L397:
	ldr r4, [fp, #-28]
	ldr r5, =100
	cmp r5, r4
	bgt .L398
	b .L399
.L398:
	ldr r4, =0
	str r4, [fp, #-24]
	b .L401
.L399:
	ldr r4, [fp, #-32]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-32]
	ldr r4, [fp, #-60]
	ldr r5, [fp, #-32]
	cmp r4, r5
	ble .L459
	b .L460
.L401:
	ldr r4, [fp, #-24]
	ldr r5, =1000
	cmp r5, r4
	bgt .L402
	b .L403
.L402:
	ldr r4, =0
	str r4, [fp, #-20]
	b .L405
.L403:
	ldr r4, [fp, #-28]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-28]
	ldr r4, [fp, #-56]
	ldr r5, [fp, #-28]
	cmp r4, r5
	ble .L455
	b .L456
.L405:
	ldr r4, [fp, #-20]
	ldr r5, =10000
	cmp r5, r4
	bgt .L406
	b .L407
.L406:
	ldr r4, =0
	str r4, [fp, #-16]
	b .L409
.L407:
	ldr r4, [fp, #-24]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-24]
	ldr r4, [fp, #-52]
	ldr r5, [fp, #-24]
	cmp r4, r5
	ble .L451
	b .L452
.L409:
	ldr r4, [fp, #-16]
	ldr r5, =100000
	cmp r5, r4
	bgt .L410
	b .L411
.L410:
	ldr r4, =0
	str r4, [fp, #-12]
	b .L413
.L411:
	ldr r4, [fp, #-20]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-20]
	ldr r4, [fp, #-48]
	ldr r5, [fp, #-20]
	cmp r4, r5
	ble .L447
	b .L448
.L413:
	ldr r4, [fp, #-12]
	ldr r5, =1000000
	cmp r5, r4
	bgt .L414
	b .L415
.L414:
	ldr r4, =0
	str r4, [fp, #-8]
	b .L417
.L415:
	ldr r4, [fp, #-16]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-16]
	ldr r4, [fp, #-44]
	ldr r5, [fp, #-16]
	cmp r4, r5
	ble .L443
	b .L444
.L417:
	ldr r4, [fp, #-8]
	ldr r5, =10000000
	cmp r5, r4
	bgt .L418
	b .L419
.L418:
	ldr r4, [fp, #-4]
	ldr r5, =817
	sdiv  r6, r4, r5
	mul  r6, r6, r5
	sub  r5, r4, r6
	ldr r4, [fp, #-32]
	ldr r6, addr_arr1
	mov r8, #5760
	add  r8, r8, #0
	mov r8, #5760
	mul  r7, r4, r8
	add  r4, r6, r7
	mov r6, r4
	ldr r4, [fp, #-28]
	mov r8, #2880
	add  r8, r8, #0
	mov r8, #2880
	mul  r7, r4, r8
	add  r4, r6, r7
	ldr r6, [fp, #-24]
	mov r7, #960
	add  r7, r7, #0
	mov r7, #960
	mul  r8, r6, r7
	add  r6, r4, r8
	ldr r4, [fp, #-20]
	mov r7, #240
	mul  r8, r4, r7
	add  r4, r6, r8
	ldr r6, [fp, #-16]
	mov r7, #48
	mul  r8, r6, r7
	add  r6, r4, r8
	ldr r4, [fp, #-12]
	mov r8, #8
	mul  r7, r4, r8
	add  r4, r6, r7
	ldr r6, [fp, #-8]
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r4, r8
	ldr r4, [r6]
	add  r6, r4, r5
	ldr r4, [fp, #-32]
	ldr r5, addr_arr2
	mov r7, #10752
	add  r7, r7, #0
	mov r7, #10752
	mul  r8, r4, r7
	add  r4, r5, r8
	mov r5, r4
	ldr r4, [fp, #-28]
	mov r8, #5376
	add  r8, r8, #0
	mov r8, #5376
	mul  r7, r4, r8
	add  r4, r5, r7
	ldr r5, [fp, #-24]
	mov r7, #1792
	add  r7, r7, #0
	mov r7, #1792
	mul  r8, r5, r7
	add  r5, r4, r8
	ldr r4, [fp, #-20]
	mov r7, #896
	add  r7, r7, #0
	mov r7, #896
	mul  r8, r4, r7
	add  r4, r5, r8
	ldr r5, [fp, #-16]
	mov r7, #224
	mul  r8, r5, r7
	add  r5, r4, r8
	ldr r4, [fp, #-12]
	mov r8, #28
	mul  r7, r4, r8
	add  r4, r5, r7
	ldr r5, [fp, #-8]
	mov r7, #4
	mul  r8, r5, r7
	add  r5, r4, r8
	ldr r4, [r5]
	add  r5, r4, r6
	str r5, [fp, #-4]
	ldr r4, [fp, #-8]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-8]
	ldr r4, [fp, #-36]
	ldr r5, [fp, #-8]
	cmp r4, r5
	ble .L435
	b .L436
.L419:
	ldr r4, [fp, #-12]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-12]
	ldr r4, [fp, #-40]
	ldr r5, [fp, #-12]
	cmp r4, r5
	ble .L439
	b .L440
.L435:
	b .L419
.L436:
	b .L417
.L438:
	b .L436
.L439:
	b .L415
.L440:
	b .L413
.L442:
	b .L440
.L443:
	b .L411
.L444:
	b .L409
.L446:
	b .L444
.L447:
	b .L407
.L448:
	b .L405
.L450:
	b .L448
.L451:
	b .L403
.L452:
	b .L401
.L454:
	b .L452
.L455:
	b .L399
.L456:
	b .L397
.L458:
	b .L456
.L459:
	b .L395
.L460:
	b .L393
.L462:
	b .L460

	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov fp, sp
	sub  sp, sp, #48
.L463:
	bl getint
	mov r4, r0
	str r4, [fp, #-36]
	bl getint
	mov r4, r0
	str r4, [fp, #-32]
	bl getint
	mov r4, r0
	str r4, [fp, #-28]
	bl getint
	mov r4, r0
	str r4, [fp, #-24]
	bl getint
	mov r4, r0
	str r4, [fp, #-20]
	bl getint
	mov r4, r0
	str r4, [fp, #-16]
	bl getint
	mov r4, r0
	str r4, [fp, #-12]
	bl getint
	mov r4, r0
	str r4, [fp, #-8]
	bl getint
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-36]
	ldr r5, [fp, #-32]
	mov r0, r4
	mov r1, r5
	bl loop1
	bl loop2
	ldr r4, [fp, #-28]
	ldr r5, [fp, #-24]
	ldr r6, [fp, #-20]
	ldr r7, [fp, #-16]
	ldr r8, [fp, #-12]
	ldr r9, [fp, #-8]
	ldr r10, [fp, #-4]
	mov r0, r4
	mov r1, r5
	mov r2, r6
	mov r3, r7
	mov r4, r8
	str r4, [sp, #-12]
	mov r4, r9
	str r4, [sp, #-8]
	mov r4, r10
	str r4, [sp, #-4]
	sub  sp, sp, #12
	bl loop3
	add  sp, sp, #12
	mov r4, r0
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr

addr_arr1:
	.word arr1
addr_arr2:
	.word arr2
