	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global n
	.align 4
	.size n, 4
n:
	.word 0
	.text
	.global bubblesort
	.type bubblesort , %function
bubblesort:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub  sp, sp, #16
.L528:
	str r0, [fp, #-16]
	ldr r4, =0
	str r4, [fp, #-12]
	b .L533
.L533:
	ldr r4, [fp, #-12]
	ldr r5, addr_n
	ldr r6, [r5]
	sub  r5, r6, #1
	cmp r4, r5
	blt .L534
	b .L535
.L534:
	ldr r4, =0
	str r4, [fp, #-8]
	b .L537
.L535:
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L537:
	ldr r4, [fp, #-8]
	ldr r5, addr_n
	ldr r6, [r5]
	ldr r5, [fp, #-12]
	sub  r7, r6, r5
	sub  r5, r7, #1
	cmp r4, r5
	blt .L538
	b .L539
.L538:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-8]
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-16]
	ldr r6, [fp, #-8]
	add  r7, r6, #1
	mov r6, #4
	mul  r8, r7, r6
	add  r6, r5, r8
	ldr r5, [r6]
	cmp r4, r5
	bgt .L541
	b .L542
.L539:
	ldr r4, [fp, #-12]
	add  r5, r4, #1
	str r5, [fp, #-12]
	b .L533
.L541:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-8]
	add  r6, r5, #1
	mov r5, #4
	mul  r7, r6, r5
	add  r5, r4, r7
	ldr r4, [r5]
	str r4, [fp, #-4]
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-8]
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-16]
	ldr r6, [fp, #-8]
	add  r7, r6, #1
	mov r6, #4
	mul  r8, r7, r6
	add  r6, r5, r8
	str r4, [r6]
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-16]
	ldr r6, [fp, #-8]
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r5, r8
	str r4, [r6]
	b .L542
.L542:
	ldr r4, [fp, #-8]
	add  r5, r4, #1
	str r5, [fp, #-8]
	b .L537

	.global insertsort
	.type insertsort , %function
insertsort:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub  sp, sp, #16
.L555:
	str r0, [fp, #-16]
	ldr r4, =1
	str r4, [fp, #-12]
	b .L559
.L559:
	ldr r4, [fp, #-12]
	ldr r5, addr_n
	ldr r6, [r5]
	cmp r4, r6
	blt .L560
	b .L561
.L560:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-12]
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	str r4, [fp, #-8]
	ldr r4, [fp, #-12]
	sub  r5, r4, #1
	str r5, [fp, #-4]
	b .L567
.L561:
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L567:
	ldr r4, [fp, #-4]
	ldr r5, =0
	sub  r6, r5, #1
	cmp r4, r6
	movgt r4, #1
	movle r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L573
	b .L569
.L568:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-4]
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-16]
	ldr r6, [fp, #-4]
	add  r7, r6, #1
	mov r6, #4
	mul  r8, r7, r6
	add  r6, r5, r8
	str r4, [r6]
	ldr r4, [fp, #-4]
	sub  r5, r4, #1
	str r5, [fp, #-4]
	b .L567
.L569:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-16]
	ldr r6, [fp, #-4]
	add  r7, r6, #1
	mov r6, #4
	mul  r8, r7, r6
	add  r6, r5, r8
	str r4, [r6]
	ldr r4, [fp, #-12]
	add  r5, r4, #1
	str r5, [fp, #-12]
	b .L559
.L573:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-16]
	ldr r6, [fp, #-4]
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r5, r8
	ldr r5, [r6]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L568
	b .L569

	.global QuickSort
	.type QuickSort , %function
QuickSort:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub  sp, sp, #28
.L583:
	str r0, [fp, #-28]
	str r1, [fp, #-24]
	str r2, [fp, #-20]
	ldr r4, [fp, #-24]
	ldr r5, [fp, #-20]
	cmp r4, r5
	blt .L590
	b .L591
.L590:
	ldr r4, [fp, #-24]
	str r4, [fp, #-16]
	ldr r4, [fp, #-20]
	str r4, [fp, #-12]
	ldr r4, [fp, #-28]
	ldr r5, [fp, #-24]
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	str r4, [fp, #-8]
	b .L598
.L591:
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L598:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-12]
	cmp r4, r5
	blt .L599
	b .L600
.L599:
	b .L602
.L600:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-28]
	ldr r6, [fp, #-16]
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r5, r8
	str r4, [r6]
	ldr r4, [fp, #-16]
	sub  r5, r4, #1
	str r5, [fp, #-4]
	ldr r4, [fp, #-28]
	ldr r5, [fp, #-24]
	ldr r6, [fp, #-4]
	mov r0, r4
	mov r1, r5
	mov r2, r6
	bl QuickSort
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-16]
	add  r5, r4, #1
	str r5, [fp, #-4]
	ldr r4, [fp, #-28]
	ldr r5, [fp, #-4]
	ldr r6, [fp, #-20]
	mov r0, r4
	mov r1, r5
	mov r2, r6
	bl QuickSort
	mov r4, r0
	str r4, [fp, #-4]
	b .L591
.L602:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-12]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L608
	b .L604
.L603:
	ldr r4, [fp, #-12]
	sub  r5, r4, #1
	str r5, [fp, #-12]
	b .L602
.L604:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-12]
	cmp r4, r5
	blt .L614
	b .L615
.L608:
	ldr r4, [fp, #-28]
	ldr r5, [fp, #-12]
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-8]
	sub  r6, r5, #1
	cmp r4, r6
	movgt r4, #1
	movle r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L603
	b .L604
.L614:
	ldr r4, [fp, #-28]
	ldr r5, [fp, #-12]
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-28]
	ldr r6, [fp, #-16]
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r5, r8
	str r4, [r6]
	ldr r4, [fp, #-16]
	add  r5, r4, #1
	str r5, [fp, #-16]
	b .L615
.L615:
	b .L620
.L620:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-12]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L626
	b .L622
.L621:
	ldr r4, [fp, #-16]
	add  r5, r4, #1
	str r5, [fp, #-16]
	b .L620
.L622:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-12]
	cmp r4, r5
	blt .L632
	b .L633
.L626:
	ldr r4, [fp, #-28]
	ldr r5, [fp, #-16]
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-8]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L621
	b .L622
.L632:
	ldr r4, [fp, #-28]
	ldr r5, [fp, #-16]
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-28]
	ldr r6, [fp, #-12]
	mov r8, #4
	mul  r7, r6, r8
	add  r6, r5, r7
	str r4, [r6]
	ldr r4, [fp, #-12]
	sub  r5, r4, #1
	str r5, [fp, #-12]
	b .L633
.L633:
	b .L598

	.global getMid
	.type getMid , %function
getMid:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub  sp, sp, #8
.L642:
	str r0, [fp, #-8]
	ldr r4, addr_n
	ldr r5, [r4]
	ldr r4, =2
	sdiv  r6, r5, r4
	mul  r4, r6, r4
	sub  r6, r5, r4
	ldr r4, =0
	cmp r6, r4
	beq .L646
	b .L647
.L646:
	ldr r4, addr_n
	ldr r5, [r4]
	ldr r4, =2
	sdiv  r6, r5, r4
	str r6, [fp, #-4]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	sub  r6, r5, #1
	mov r7, #4
	mul  r5, r6, r7
	add  r6, r4, r5
	ldr r4, [r6]
	ldr r5, [fp, #-8]
	ldr r6, [fp, #-4]
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r5, r8
	ldr r5, [r6]
	add  r6, r5, r4
	ldr r4, =2
	sdiv  r5, r6, r4
	mov r0, r5
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
	b .L648
.L647:
	ldr r4, addr_n
	ldr r5, [r4]
	ldr r4, =2
	sdiv  r6, r5, r4
	str r6, [fp, #-4]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
	b .L648
.L648:
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

	.global getMost
	.type getMost , %function
getMost:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	mov r4, #4020
	add  r4, r4, #0
	sub  sp, sp, r4
.L656:
	mov r4, #61516
	add  r4, r4, #16711680
	add  r4, r4, #-16777216
	str r0, [fp, r4]
	ldr r4, =0
	str r4, [fp, #-16]
	b .L661
.L661:
	ldr r4, [fp, #-16]
	ldr r5, =1000
	cmp r4, r5
	blt .L662
	b .L663
.L662:
	ldr r4, [fp, #-16]
	mov r5, #61520
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =0
	str r4, [r5]
	ldr r4, [fp, #-16]
	add  r5, r4, #1
	str r5, [fp, #-16]
	b .L661
.L663:
	ldr r4, =0
	str r4, [fp, #-16]
	ldr r4, =0
	str r4, [fp, #-12]
	b .L667
.L667:
	ldr r4, [fp, #-16]
	ldr r5, addr_n
	ldr r6, [r5]
	cmp r4, r6
	blt .L668
	b .L669
.L668:
	mov r5, #61516
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	ldr r4, [fp, r5]
	ldr r5, [fp, #-16]
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r5, #61520
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	mov r7, #4
	mul  r6, r4, r7
	add  r4, r5, r6
	add  r5, fp, r4
	ldr r4, [r5]
	add  r5, r4, #1
	ldr r4, [fp, #-4]
	mov r6, #61520
	add  r6, r6, #16711680
	add  r6, r6, #-16777216
	mov r7, #4
	mul  r8, r4, r7
	add  r4, r6, r8
	add  r6, fp, r4
	str r5, [r6]
	ldr r4, [fp, #-4]
	mov r5, #61520
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	mov r7, #4
	mul  r6, r4, r7
	add  r4, r5, r6
	add  r5, fp, r4
	ldr r4, [r5]
	ldr r5, [fp, #-12]
	cmp r4, r5
	bgt .L675
	b .L676
.L669:
	ldr r4, [fp, #-8]
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L675:
	ldr r4, [fp, #-4]
	mov r5, #61520
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, [r5]
	str r4, [fp, #-12]
	ldr r4, [fp, #-4]
	str r4, [fp, #-8]
	b .L676
.L676:
	ldr r4, [fp, #-16]
	add  r5, r4, #1
	str r5, [fp, #-16]
	b .L667

	.global revert
	.type revert , %function
revert:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub  sp, sp, #16
.L680:
	str r0, [fp, #-16]
	ldr r4, =0
	str r4, [fp, #-8]
	ldr r4, =0
	str r4, [fp, #-4]
	b .L686
.L686:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	cmp r4, r5
	blt .L687
	b .L688
.L687:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-8]
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	str r4, [fp, #-12]
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-4]
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-16]
	ldr r6, [fp, #-8]
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r5, r8
	str r4, [r6]
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-16]
	ldr r6, [fp, #-4]
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r5, r8
	str r4, [r6]
	ldr r4, [fp, #-8]
	add  r5, r4, #1
	str r5, [fp, #-8]
	ldr r4, [fp, #-4]
	sub  r5, r4, #1
	str r5, [fp, #-4]
	b .L686
.L688:
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

	.global arrCopy
	.type arrCopy , %function
arrCopy:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub  sp, sp, #12
.L696:
	str r0, [fp, #-12]
	str r1, [fp, #-8]
	ldr r4, =0
	str r4, [fp, #-4]
	b .L702
.L702:
	ldr r4, [fp, #-4]
	ldr r5, addr_n
	ldr r6, [r5]
	cmp r4, r6
	blt .L703
	b .L704
.L703:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-4]
	mov r7, #4
	mul  r6, r5, r7
	add  r5, r4, r6
	ldr r4, [r5]
	ldr r5, [fp, #-8]
	ldr r6, [fp, #-4]
	mov r8, #4
	mul  r7, r6, r8
	add  r6, r5, r7
	str r4, [r6]
	ldr r4, [fp, #-4]
	add  r5, r4, #1
	str r5, [fp, #-4]
	b .L702
.L704:
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

	.global calSum
	.type calSum , %function
calSum:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub  sp, sp, #16
.L709:
	str r0, [fp, #-16]
	str r1, [fp, #-12]
	ldr r4, =0
	str r4, [fp, #-8]
	ldr r4, =0
	str r4, [fp, #-4]
	b .L716
.L716:
	ldr r4, [fp, #-4]
	ldr r5, addr_n
	ldr r6, [r5]
	cmp r4, r6
	blt .L717
	b .L718
.L717:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-4]
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-8]
	add  r6, r5, r4
	str r6, [fp, #-8]
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-12]
	sdiv  r6, r4, r5
	mul  r5, r6, r5
	sub  r6, r4, r5
	ldr r4, [fp, #-12]
	sub  r5, r4, #1
	cmp r6, r5
	bne .L722
	b .L723
.L718:
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L722:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-4]
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, =0
	str r4, [r5]
	b .L724
.L723:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-16]
	ldr r6, [fp, #-4]
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r5, r8
	str r4, [r6]
	ldr r4, =0
	str r4, [fp, #-8]
	b .L724
.L724:
	ldr r4, [fp, #-4]
	add  r5, r4, #1
	str r5, [fp, #-4]
	b .L716

	.global avgPooling
	.type avgPooling , %function
avgPooling:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub  sp, sp, #20
.L728:
	str r0, [fp, #-20]
	str r1, [fp, #-16]
	ldr r4, =0
	str r4, [fp, #-8]
	ldr r4, =0
	str r4, [fp, #-12]
	b .L736
.L736:
	ldr r4, [fp, #-8]
	ldr r5, addr_n
	ldr r6, [r5]
	cmp r4, r6
	blt .L737
	b .L738
.L737:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-16]
	sub  r6, r5, #1
	cmp r4, r6
	blt .L740
	b .L741
.L738:
	ldr r4, addr_n
	ldr r5, [r4]
	ldr r4, [fp, #-16]
	sub  r6, r5, r4
	add  r4, r6, #1
	str r4, [fp, #-8]
	b .L758
.L740:
	ldr r4, [fp, #-20]
	ldr r5, [fp, #-8]
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-12]
	add  r6, r5, r4
	str r6, [fp, #-12]
	b .L742
.L741:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-16]
	sub  r6, r5, #1
	cmp r4, r6
	beq .L746
	b .L747
.L742:
	ldr r4, [fp, #-8]
	add  r5, r4, #1
	str r5, [fp, #-8]
	b .L736
.L746:
	ldr r4, [fp, #-20]
	mov r5, #0
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	str r4, [fp, #-4]
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-16]
	sdiv  r6, r4, r5
	ldr r4, [fp, #-20]
	mov r5, #0
	mov r7, #4
	mul  r8, r5, r7
	add  r5, r4, r8
	str r6, [r5]
	b .L748
.L747:
	ldr r4, [fp, #-20]
	ldr r5, [fp, #-8]
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-12]
	add  r6, r5, r4
	ldr r4, [fp, #-4]
	sub  r5, r6, r4
	str r5, [fp, #-12]
	ldr r4, [fp, #-20]
	ldr r5, [fp, #-8]
	ldr r6, [fp, #-16]
	sub  r7, r5, r6
	add  r5, r7, #1
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	str r4, [fp, #-4]
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-16]
	sdiv  r6, r4, r5
	ldr r4, [fp, #-20]
	ldr r5, [fp, #-8]
	ldr r7, [fp, #-16]
	sub  r8, r5, r7
	add  r5, r8, #1
	mov r7, #4
	mul  r8, r5, r7
	add  r5, r4, r8
	str r6, [r5]
	b .L748
.L748:
	b .L742
.L758:
	ldr r4, [fp, #-8]
	ldr r5, addr_n
	ldr r6, [r5]
	cmp r4, r6
	blt .L759
	b .L760
.L759:
	ldr r4, [fp, #-20]
	ldr r5, [fp, #-8]
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, =0
	str r4, [r5]
	ldr r4, [fp, #-8]
	add  r5, r4, #1
	str r5, [fp, #-8]
	b .L758
.L760:
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	ldr r4, =264
	sub  sp, sp, r4
.L763:
	ldr r4, =32
	ldr r5, addr_n
	str r4, [r5]
	mov r4, #0
	mov r5, #65272
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =7
	str r4, [r5]
	mov r4, #1
	mov r5, #65272
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	mov r7, #4
	mul  r6, r4, r7
	add  r4, r5, r6
	add  r5, fp, r4
	ldr r4, =23
	str r4, [r5]
	mov r4, #2
	mov r5, #65272
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =89
	str r4, [r5]
	mov r4, #3
	mov r5, #65272
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	mov r7, #4
	mul  r6, r4, r7
	add  r4, r5, r6
	add  r5, fp, r4
	ldr r4, =26
	str r4, [r5]
	mov r4, #4
	mov r5, #65272
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	mov r4, #282
	add  r4, r4, #0
	str r4, [r5]
	mov r4, #5
	mov r5, #65272
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =254
	str r4, [r5]
	mov r4, #6
	mov r5, #65272
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =27
	str r4, [r5]
	mov r4, #7
	mov r5, #65272
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	mov r7, #4
	mul  r6, r4, r7
	add  r4, r5, r6
	add  r5, fp, r4
	ldr r4, =5
	str r4, [r5]
	mov r4, #8
	mov r5, #65272
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =83
	str r4, [r5]
	mov r4, #9
	mov r5, #65272
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	mov r4, #273
	add  r4, r4, #0
	str r4, [r5]
	mov r4, #10
	mov r5, #65272
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	mov r4, #574
	add  r4, r4, #0
	str r4, [r5]
	mov r4, #11
	mov r5, #65272
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	mov r4, #905
	add  r4, r4, #0
	str r4, [r5]
	mov r4, #12
	mov r5, #65272
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	mov r4, #354
	add  r4, r4, #0
	str r4, [r5]
	mov r4, #13
	mov r5, #65272
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	mov r4, #657
	add  r4, r4, #0
	str r4, [r5]
	mov r4, #14
	mov r5, #65272
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	mov r4, #935
	add  r4, r4, #0
	str r4, [r5]
	mov r4, #15
	mov r5, #65272
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =264
	str r4, [r5]
	mov r4, #16
	mov r5, #65272
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	mov r4, #639
	add  r4, r4, #0
	str r4, [r5]
	mov r4, #17
	mov r5, #65272
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	mov r7, #4
	mul  r6, r4, r7
	add  r4, r5, r6
	add  r5, fp, r4
	mov r4, #459
	add  r4, r4, #0
	str r4, [r5]
	mov r4, #18
	mov r5, #65272
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =29
	str r4, [r5]
	mov r4, #19
	mov r5, #65272
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =68
	str r4, [r5]
	mov r4, #20
	mov r5, #65272
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	mov r4, #929
	add  r4, r4, #0
	str r4, [r5]
	mov r4, #21
	mov r5, #65272
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =756
	str r4, [r5]
	mov r4, #22
	mov r5, #65272
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =452
	str r4, [r5]
	mov r4, #23
	mov r5, #65272
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	mov r7, #4
	mul  r6, r4, r7
	add  r4, r5, r6
	add  r5, fp, r4
	mov r4, #279
	add  r4, r4, #0
	str r4, [r5]
	mov r4, #24
	mov r5, #65272
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	mov r7, #4
	mul  r6, r4, r7
	add  r4, r5, r6
	add  r5, fp, r4
	ldr r4, =58
	str r4, [r5]
	mov r4, #25
	mov r5, #65272
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =87
	str r4, [r5]
	mov r4, #26
	mov r5, #65272
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =96
	str r4, [r5]
	mov r4, #27
	mov r5, #65272
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =36
	str r4, [r5]
	mov r4, #28
	mov r5, #65272
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =39
	str r4, [r5]
	mov r4, #29
	mov r5, #65272
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =28
	str r4, [r5]
	mov r4, #30
	mov r5, #65272
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =1
	str r4, [r5]
	mov r4, #31
	mov r5, #65272
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	mov r4, #290
	add  r4, r4, #0
	str r4, [r5]
	mov r4, #0
	mov r5, #65272
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	mov r4, #0
	mov r6, #-136
	mov r7, #4
	mul  r8, r4, r7
	add  r4, r6, r8
	add  r6, fp, r4
	mov r0, r5
	mov r1, r6
	bl arrCopy
	mov r4, r0
	str r4, [fp, #-8]
	mov r4, #0
	mov r5, #-136
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	mov r0, r5
	bl revert
	mov r4, r0
	str r4, [fp, #-8]
	ldr r4, =0
	str r4, [fp, #-4]
	b .L768
.L768:
	ldr r4, [fp, #-4]
	ldr r5, =32
	cmp r4, r5
	blt .L769
	b .L770
.L769:
	ldr r4, [fp, #-4]
	mov r5, #-136
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, [r5]
	str r4, [fp, #-8]
	ldr r4, [fp, #-8]
	mov r0, r4
	bl putint
	ldr r4, [fp, #-4]
	add  r5, r4, #1
	str r5, [fp, #-4]
	b .L768
.L770:
	mov r4, #0
	mov r5, #-136
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	mov r0, r5
	bl bubblesort
	mov r4, r0
	str r4, [fp, #-8]
	ldr r4, =0
	str r4, [fp, #-4]
	b .L773
.L773:
	ldr r4, [fp, #-4]
	ldr r5, =32
	cmp r4, r5
	blt .L774
	b .L775
.L774:
	ldr r4, [fp, #-4]
	mov r5, #-136
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, [r5]
	str r4, [fp, #-8]
	ldr r4, [fp, #-8]
	mov r0, r4
	bl putint
	ldr r4, [fp, #-4]
	add  r5, r4, #1
	str r5, [fp, #-4]
	b .L773
.L775:
	mov r4, #0
	mov r5, #-136
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	mov r0, r5
	bl getMid
	mov r4, r0
	str r4, [fp, #-8]
	ldr r4, [fp, #-8]
	mov r0, r4
	bl putint
	mov r4, #0
	mov r5, #-136
	mov r7, #4
	mul  r6, r4, r7
	add  r4, r5, r6
	add  r5, fp, r4
	mov r0, r5
	bl getMost
	mov r4, r0
	str r4, [fp, #-8]
	ldr r4, [fp, #-8]
	mov r0, r4
	bl putint
	mov r4, #0
	mov r5, #65272
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	mov r4, #0
	mov r6, #-136
	mov r7, #4
	mul  r8, r4, r7
	add  r4, r6, r8
	add  r6, fp, r4
	mov r0, r5
	mov r1, r6
	bl arrCopy
	mov r4, r0
	str r4, [fp, #-8]
	mov r4, #0
	mov r5, #-136
	mov r7, #4
	mul  r6, r4, r7
	add  r4, r5, r6
	add  r5, fp, r4
	mov r0, r5
	bl bubblesort
	mov r4, r0
	str r4, [fp, #-8]
	ldr r4, =0
	str r4, [fp, #-4]
	b .L778
.L778:
	ldr r4, [fp, #-4]
	ldr r5, =32
	cmp r4, r5
	blt .L779
	b .L780
.L779:
	ldr r4, [fp, #-4]
	mov r5, #-136
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, [r5]
	str r4, [fp, #-8]
	ldr r4, [fp, #-8]
	mov r0, r4
	bl putint
	ldr r4, [fp, #-4]
	add  r5, r4, #1
	str r5, [fp, #-4]
	b .L778
.L780:
	mov r4, #0
	mov r5, #65272
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	mov r4, #0
	mov r6, #-136
	mov r7, #4
	mul  r8, r4, r7
	add  r4, r6, r8
	add  r6, fp, r4
	mov r0, r5
	mov r1, r6
	bl arrCopy
	mov r4, r0
	str r4, [fp, #-8]
	mov r4, #0
	mov r5, #-136
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	mov r0, r5
	bl insertsort
	mov r4, r0
	str r4, [fp, #-8]
	ldr r4, =0
	str r4, [fp, #-4]
	b .L783
.L783:
	ldr r4, [fp, #-4]
	ldr r5, =32
	cmp r4, r5
	blt .L784
	b .L785
.L784:
	ldr r4, [fp, #-4]
	mov r5, #-136
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, [r5]
	str r4, [fp, #-8]
	ldr r4, [fp, #-8]
	mov r0, r4
	bl putint
	ldr r4, [fp, #-4]
	add  r5, r4, #1
	str r5, [fp, #-4]
	b .L783
.L785:
	mov r4, #0
	mov r5, #65272
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	mov r7, #4
	mul  r6, r4, r7
	add  r4, r5, r6
	add  r5, fp, r4
	mov r4, #0
	mov r6, #-136
	mov r7, #4
	mul  r8, r4, r7
	add  r4, r6, r8
	add  r6, fp, r4
	mov r0, r5
	mov r1, r6
	bl arrCopy
	mov r4, r0
	str r4, [fp, #-8]
	ldr r4, =0
	str r4, [fp, #-4]
	ldr r4, =31
	str r4, [fp, #-8]
	mov r4, #0
	mov r5, #-136
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, [fp, #-4]
	ldr r6, [fp, #-8]
	mov r0, r5
	mov r1, r4
	mov r2, r6
	bl QuickSort
	mov r4, r0
	str r4, [fp, #-8]
	b .L788
.L788:
	ldr r4, [fp, #-4]
	ldr r5, =32
	cmp r4, r5
	blt .L789
	b .L790
.L789:
	ldr r4, [fp, #-4]
	mov r5, #-136
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, [r5]
	str r4, [fp, #-8]
	ldr r4, [fp, #-8]
	mov r0, r4
	bl putint
	ldr r4, [fp, #-4]
	add  r5, r4, #1
	str r5, [fp, #-4]
	b .L788
.L790:
	mov r4, #0
	mov r5, #65272
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	mov r4, #0
	mov r6, #-136
	mov r7, #4
	mul  r8, r4, r7
	add  r4, r6, r8
	add  r6, fp, r4
	mov r0, r5
	mov r1, r6
	bl arrCopy
	mov r4, r0
	str r4, [fp, #-8]
	mov r4, #0
	mov r5, #-136
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	mov r0, r5
	mov r1, #4
	bl calSum
	mov r4, r0
	str r4, [fp, #-8]
	ldr r4, =0
	str r4, [fp, #-4]
	b .L793
.L793:
	ldr r4, [fp, #-4]
	ldr r5, =32
	cmp r4, r5
	blt .L794
	b .L795
.L794:
	ldr r4, [fp, #-4]
	mov r5, #-136
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, [r5]
	str r4, [fp, #-8]
	ldr r4, [fp, #-8]
	mov r0, r4
	bl putint
	ldr r4, [fp, #-4]
	add  r5, r4, #1
	str r5, [fp, #-4]
	b .L793
.L795:
	mov r4, #0
	mov r5, #65272
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	mov r7, #4
	mul  r6, r4, r7
	add  r4, r5, r6
	add  r5, fp, r4
	mov r4, #0
	mov r6, #-136
	mov r7, #4
	mul  r8, r4, r7
	add  r4, r6, r8
	add  r6, fp, r4
	mov r0, r5
	mov r1, r6
	bl arrCopy
	mov r4, r0
	str r4, [fp, #-8]
	mov r4, #0
	mov r5, #-136
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	mov r0, r5
	mov r1, #3
	bl avgPooling
	mov r4, r0
	str r4, [fp, #-8]
	ldr r4, =0
	str r4, [fp, #-4]
	b .L798
.L798:
	ldr r4, [fp, #-4]
	ldr r5, =32
	cmp r4, r5
	blt .L799
	b .L800
.L799:
	ldr r4, [fp, #-4]
	mov r5, #-136
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, [r5]
	str r4, [fp, #-8]
	ldr r4, [fp, #-8]
	mov r0, r4
	bl putint
	ldr r4, [fp, #-4]
	add  r5, r4, #1
	str r5, [fp, #-4]
	b .L798
.L800:
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

addr_n:
	.word n
