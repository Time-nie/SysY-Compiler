	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.text
	.global sort
	.type sort , %function
sort:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub  sp, sp, #20
.L498:
	str r0, [fp, #-20]
	str r1, [fp, #-16]
	ldr r4, =0
	str r4, [fp, #-12]
	b .L504
.L504:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-16]
	sub  r6, r5, #1
	cmp r4, r6
	blt .L505
	b .L506
.L505:
	ldr r4, [fp, #-12]
	add  r5, r4, #1
	str r5, [fp, #-8]
	b .L509
.L506:
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L509:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-16]
	cmp r4, r5
	blt .L510
	b .L511
.L510:
	ldr r4, [fp, #-20]
	ldr r5, [fp, #-12]
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-20]
	ldr r6, [fp, #-8]
	mov r8, #4
	mul  r7, r6, r8
	add  r6, r5, r7
	ldr r5, [r6]
	cmp r4, r5
	blt .L513
	b .L514
.L511:
	ldr r4, [fp, #-12]
	add  r5, r4, #1
	str r5, [fp, #-12]
	b .L504
.L513:
	ldr r4, [fp, #-20]
	ldr r5, [fp, #-12]
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	str r4, [fp, #-4]
	ldr r4, [fp, #-20]
	ldr r5, [fp, #-8]
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-20]
	ldr r6, [fp, #-12]
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r5, r8
	str r4, [r6]
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-20]
	ldr r6, [fp, #-8]
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r5, r8
	str r4, [r6]
	b .L514
.L514:
	ldr r4, [fp, #-8]
	add  r5, r4, #1
	str r5, [fp, #-8]
	b .L509

	.global param32_rec
	.type param32_rec , %function
param32_rec:
	push {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov fp, sp
	ldr r4, =340
	sub  sp, sp, r4
.L527:
	str r0, [fp, #-128]
	str r1, [fp, #-124]
	str r2, [fp, #-120]
	str r3, [fp, #-116]
	ldr r4, [fp, #36]
	str r4, [fp, #-112]
	ldr r4, [fp, #40]
	str r4, [fp, #-108]
	ldr r4, [fp, #44]
	str r4, [fp, #-104]
	ldr r4, [fp, #48]
	str r4, [fp, #-100]
	ldr r4, [fp, #52]
	str r4, [fp, #-96]
	ldr r4, [fp, #56]
	str r4, [fp, #-92]
	ldr r4, [fp, #60]
	str r4, [fp, #-88]
	ldr r4, [fp, #64]
	str r4, [fp, #-84]
	ldr r4, [fp, #68]
	str r4, [fp, #-80]
	ldr r4, [fp, #72]
	str r4, [fp, #-76]
	ldr r4, [fp, #76]
	str r4, [fp, #-72]
	ldr r4, [fp, #80]
	str r4, [fp, #-68]
	ldr r4, [fp, #84]
	str r4, [fp, #-64]
	ldr r4, [fp, #88]
	str r4, [fp, #-60]
	ldr r4, [fp, #92]
	str r4, [fp, #-56]
	ldr r4, [fp, #96]
	str r4, [fp, #-52]
	ldr r4, [fp, #100]
	str r4, [fp, #-48]
	ldr r4, [fp, #104]
	str r4, [fp, #-44]
	ldr r4, [fp, #108]
	str r4, [fp, #-40]
	ldr r4, [fp, #112]
	str r4, [fp, #-36]
	ldr r4, [fp, #116]
	str r4, [fp, #-32]
	ldr r4, [fp, #120]
	str r4, [fp, #-28]
	ldr r4, [fp, #124]
	str r4, [fp, #-24]
	ldr r4, [fp, #128]
	str r4, [fp, #-20]
	ldr r4, [fp, #132]
	str r4, [fp, #-16]
	ldr r4, [fp, #136]
	str r4, [fp, #-12]
	ldr r4, [fp, #140]
	str r4, [fp, #-8]
	ldr r4, [fp, #144]
	str r4, [fp, #-4]
	ldr r4, [fp, #-128]
	ldr r5, =0
	cmp r4, r5
	beq .L592
	b .L593
.L592:
	ldr r4, [fp, #-124]
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr
	b .L594
.L593:
	ldr r4, [fp, #-128]
	sub  r5, r4, #1
	ldr r4, [fp, #-120]
	ldr r6, [fp, #-124]
	add  r7, r6, r4
	ldr r4, =998244353
	sdiv  r6, r7, r4
	mul  r6, r6, r4
	sub  r4, r7, r6
	ldr r6, [fp, #-116]
	ldr r7, [fp, #-112]
	ldr r8, [fp, #-108]
	ldr r9, [fp, #-104]
	ldr r10, [fp, #-100]
	str r10, [fp, #-340]
	ldr r10, [fp, #-96]
	str r10, [fp, #-244]
	ldr r10, [fp, #-92]
	str r10, [fp, #-248]
	ldr r10, [fp, #-88]
	str r10, [fp, #-252]
	ldr r10, [fp, #-84]
	str r10, [fp, #-256]
	ldr r10, [fp, #-80]
	str r10, [fp, #-260]
	ldr r10, [fp, #-76]
	str r10, [fp, #-264]
	ldr r10, [fp, #-72]
	str r10, [fp, #-268]
	ldr r10, [fp, #-68]
	str r10, [fp, #-272]
	ldr r10, [fp, #-64]
	str r10, [fp, #-276]
	ldr r10, [fp, #-60]
	str r10, [fp, #-280]
	ldr r10, [fp, #-56]
	str r10, [fp, #-284]
	ldr r10, [fp, #-52]
	str r10, [fp, #-288]
	ldr r10, [fp, #-48]
	str r10, [fp, #-292]
	ldr r10, [fp, #-44]
	str r10, [fp, #-296]
	ldr r10, [fp, #-40]
	str r10, [fp, #-300]
	ldr r10, [fp, #-36]
	str r10, [fp, #-304]
	ldr r10, [fp, #-32]
	str r10, [fp, #-308]
	ldr r10, [fp, #-28]
	str r10, [fp, #-312]
	ldr r10, [fp, #-24]
	str r10, [fp, #-316]
	ldr r10, [fp, #-20]
	str r10, [fp, #-320]
	ldr r10, [fp, #-16]
	str r10, [fp, #-324]
	ldr r10, [fp, #-12]
	str r10, [fp, #-328]
	ldr r10, [fp, #-8]
	str r10, [fp, #-332]
	ldr r10, [fp, #-4]
	str r10, [fp, #-336]
	mov r0, r5
	mov r1, r4
	mov r2, r6
	mov r3, r7
	mov r4, r8
	str r4, [sp, #-112]
	mov r4, r9
	str r4, [sp, #-108]
	ldr r4, [fp, #-340]
	mov r4, r4
	str r4, [sp, #-104]
	ldr r4, [fp, #-244]
	mov r4, r4
	str r4, [sp, #-100]
	ldr r4, [fp, #-248]
	mov r4, r4
	str r4, [sp, #-96]
	ldr r4, [fp, #-252]
	mov r4, r4
	str r4, [sp, #-92]
	ldr r4, [fp, #-256]
	mov r4, r4
	str r4, [sp, #-88]
	ldr r4, [fp, #-260]
	mov r4, r4
	str r4, [sp, #-84]
	ldr r4, [fp, #-264]
	mov r4, r4
	str r4, [sp, #-80]
	ldr r4, [fp, #-268]
	mov r4, r4
	str r4, [sp, #-76]
	ldr r4, [fp, #-272]
	mov r4, r4
	str r4, [sp, #-72]
	ldr r4, [fp, #-276]
	mov r4, r4
	str r4, [sp, #-68]
	ldr r4, [fp, #-280]
	mov r4, r4
	str r4, [sp, #-64]
	ldr r4, [fp, #-284]
	mov r4, r4
	str r4, [sp, #-60]
	ldr r4, [fp, #-288]
	mov r4, r4
	str r4, [sp, #-56]
	ldr r4, [fp, #-292]
	mov r4, r4
	str r4, [sp, #-52]
	ldr r4, [fp, #-296]
	mov r4, r4
	str r4, [sp, #-48]
	ldr r4, [fp, #-300]
	mov r4, r4
	str r4, [sp, #-44]
	ldr r4, [fp, #-304]
	mov r4, r4
	str r4, [sp, #-40]
	ldr r4, [fp, #-308]
	mov r4, r4
	str r4, [sp, #-36]
	ldr r4, [fp, #-312]
	mov r4, r4
	str r4, [sp, #-32]
	ldr r4, [fp, #-316]
	mov r4, r4
	str r4, [sp, #-28]
	ldr r4, [fp, #-320]
	mov r4, r4
	str r4, [sp, #-24]
	ldr r4, [fp, #-324]
	mov r4, r4
	str r4, [sp, #-20]
	ldr r4, [fp, #-328]
	mov r4, r4
	str r4, [sp, #-16]
	ldr r4, [fp, #-332]
	mov r4, r4
	str r4, [sp, #-12]
	ldr r4, [fp, #-336]
	mov r4, r4
	str r4, [sp, #-8]
	mov r4, #0
	str r4, [sp, #-4]
	sub  sp, sp, #112
	bl param32_rec
	add  sp, sp, #112
	mov r4, r0
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr
	b .L594
.L594:
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr

	.global param32_arr
	.type param32_arr , %function
param32_arr:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub  sp, sp, #132
.L596:
	str r0, [fp, #-132]
	str r1, [fp, #-128]
	str r2, [fp, #-124]
	str r3, [fp, #-120]
	ldr r4, [fp, #28]
	str r4, [fp, #-116]
	ldr r4, [fp, #32]
	str r4, [fp, #-112]
	ldr r4, [fp, #36]
	str r4, [fp, #-108]
	ldr r4, [fp, #40]
	str r4, [fp, #-104]
	ldr r4, [fp, #44]
	str r4, [fp, #-100]
	ldr r4, [fp, #48]
	str r4, [fp, #-96]
	ldr r4, [fp, #52]
	str r4, [fp, #-92]
	ldr r4, [fp, #56]
	str r4, [fp, #-88]
	ldr r4, [fp, #60]
	str r4, [fp, #-84]
	ldr r4, [fp, #64]
	str r4, [fp, #-80]
	ldr r4, [fp, #68]
	str r4, [fp, #-76]
	ldr r4, [fp, #72]
	str r4, [fp, #-72]
	ldr r4, [fp, #76]
	str r4, [fp, #-68]
	ldr r4, [fp, #80]
	str r4, [fp, #-64]
	ldr r4, [fp, #84]
	str r4, [fp, #-60]
	ldr r4, [fp, #88]
	str r4, [fp, #-56]
	ldr r4, [fp, #92]
	str r4, [fp, #-52]
	ldr r4, [fp, #96]
	str r4, [fp, #-48]
	ldr r4, [fp, #100]
	str r4, [fp, #-44]
	ldr r4, [fp, #104]
	str r4, [fp, #-40]
	ldr r4, [fp, #108]
	str r4, [fp, #-36]
	ldr r4, [fp, #112]
	str r4, [fp, #-32]
	ldr r4, [fp, #116]
	str r4, [fp, #-28]
	ldr r4, [fp, #120]
	str r4, [fp, #-24]
	ldr r4, [fp, #124]
	str r4, [fp, #-20]
	ldr r4, [fp, #128]
	str r4, [fp, #-16]
	ldr r4, [fp, #132]
	str r4, [fp, #-12]
	ldr r4, [fp, #136]
	str r4, [fp, #-8]
	ldr r4, [fp, #-132]
	mov r5, #1
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-132]
	mov r6, #0
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r5, r8
	ldr r5, [r6]
	add  r6, r5, r4
	str r6, [fp, #-4]
	ldr r4, [fp, #-128]
	mov r5, #1
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-128]
	mov r6, #0
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r5, r8
	ldr r5, [r6]
	ldr r6, [fp, #-4]
	add  r7, r6, r5
	add  r5, r7, r4
	str r5, [fp, #-4]
	ldr r4, [fp, #-124]
	mov r5, #1
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-124]
	mov r6, #0
	mov r8, #4
	mul  r7, r6, r8
	add  r6, r5, r7
	ldr r5, [r6]
	ldr r6, [fp, #-4]
	add  r7, r6, r5
	add  r5, r7, r4
	str r5, [fp, #-4]
	ldr r4, [fp, #-120]
	mov r5, #1
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-120]
	mov r6, #0
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r5, r8
	ldr r5, [r6]
	ldr r6, [fp, #-4]
	add  r7, r6, r5
	add  r5, r7, r4
	str r5, [fp, #-4]
	ldr r4, [fp, #-116]
	mov r5, #1
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-116]
	mov r6, #0
	mov r8, #4
	mul  r7, r6, r8
	add  r6, r5, r7
	ldr r5, [r6]
	ldr r6, [fp, #-4]
	add  r7, r6, r5
	add  r5, r7, r4
	str r5, [fp, #-4]
	ldr r4, [fp, #-112]
	mov r5, #1
	mov r7, #4
	mul  r6, r5, r7
	add  r5, r4, r6
	ldr r4, [r5]
	ldr r5, [fp, #-112]
	mov r6, #0
	mov r8, #4
	mul  r7, r6, r8
	add  r6, r5, r7
	ldr r5, [r6]
	ldr r6, [fp, #-4]
	add  r7, r6, r5
	add  r5, r7, r4
	str r5, [fp, #-4]
	ldr r4, [fp, #-108]
	mov r5, #1
	mov r7, #4
	mul  r6, r5, r7
	add  r5, r4, r6
	ldr r4, [r5]
	ldr r5, [fp, #-108]
	mov r6, #0
	mov r8, #4
	mul  r7, r6, r8
	add  r6, r5, r7
	ldr r5, [r6]
	ldr r6, [fp, #-4]
	add  r7, r6, r5
	add  r5, r7, r4
	str r5, [fp, #-4]
	ldr r4, [fp, #-104]
	mov r5, #1
	mov r7, #4
	mul  r6, r5, r7
	add  r5, r4, r6
	ldr r4, [r5]
	ldr r5, [fp, #-104]
	mov r6, #0
	mov r8, #4
	mul  r7, r6, r8
	add  r6, r5, r7
	ldr r5, [r6]
	ldr r6, [fp, #-4]
	add  r7, r6, r5
	add  r5, r7, r4
	str r5, [fp, #-4]
	ldr r4, [fp, #-100]
	mov r5, #1
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-100]
	mov r6, #0
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r5, r8
	ldr r5, [r6]
	ldr r6, [fp, #-4]
	add  r7, r6, r5
	add  r5, r7, r4
	str r5, [fp, #-4]
	ldr r4, [fp, #-96]
	mov r5, #1
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-96]
	mov r6, #0
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r5, r8
	ldr r5, [r6]
	ldr r6, [fp, #-4]
	add  r7, r6, r5
	add  r5, r7, r4
	str r5, [fp, #-4]
	ldr r4, [fp, #-92]
	mov r5, #1
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-92]
	mov r6, #0
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r5, r8
	ldr r5, [r6]
	ldr r6, [fp, #-4]
	add  r7, r6, r5
	add  r5, r7, r4
	str r5, [fp, #-4]
	ldr r4, [fp, #-88]
	mov r5, #1
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-88]
	mov r6, #0
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r5, r8
	ldr r5, [r6]
	ldr r6, [fp, #-4]
	add  r7, r6, r5
	add  r5, r7, r4
	str r5, [fp, #-4]
	ldr r4, [fp, #-84]
	mov r5, #1
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-84]
	mov r6, #0
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r5, r8
	ldr r5, [r6]
	ldr r6, [fp, #-4]
	add  r7, r6, r5
	add  r5, r7, r4
	str r5, [fp, #-4]
	ldr r4, [fp, #-80]
	mov r5, #1
	mov r7, #4
	mul  r6, r5, r7
	add  r5, r4, r6
	ldr r4, [r5]
	ldr r5, [fp, #-80]
	mov r6, #0
	mov r8, #4
	mul  r7, r6, r8
	add  r6, r5, r7
	ldr r5, [r6]
	ldr r6, [fp, #-4]
	add  r7, r6, r5
	add  r5, r7, r4
	str r5, [fp, #-4]
	ldr r4, [fp, #-76]
	mov r5, #1
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-76]
	mov r6, #0
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r5, r8
	ldr r5, [r6]
	ldr r6, [fp, #-4]
	add  r7, r6, r5
	add  r5, r7, r4
	str r5, [fp, #-4]
	ldr r4, [fp, #-72]
	mov r5, #1
	mov r7, #4
	mul  r6, r5, r7
	add  r5, r4, r6
	ldr r4, [r5]
	ldr r5, [fp, #-72]
	mov r6, #0
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r5, r8
	ldr r5, [r6]
	ldr r6, [fp, #-4]
	add  r7, r6, r5
	add  r5, r7, r4
	str r5, [fp, #-4]
	ldr r4, [fp, #-68]
	mov r5, #1
	mov r7, #4
	mul  r6, r5, r7
	add  r5, r4, r6
	ldr r4, [r5]
	ldr r5, [fp, #-68]
	mov r6, #0
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r5, r8
	ldr r5, [r6]
	ldr r6, [fp, #-4]
	add  r7, r6, r5
	add  r5, r7, r4
	str r5, [fp, #-4]
	ldr r4, [fp, #-64]
	mov r5, #1
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-64]
	mov r6, #0
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r5, r8
	ldr r5, [r6]
	ldr r6, [fp, #-4]
	add  r7, r6, r5
	add  r5, r7, r4
	str r5, [fp, #-4]
	ldr r4, [fp, #-60]
	mov r5, #1
	mov r7, #4
	mul  r6, r5, r7
	add  r5, r4, r6
	ldr r4, [r5]
	ldr r5, [fp, #-60]
	mov r6, #0
	mov r8, #4
	mul  r7, r6, r8
	add  r6, r5, r7
	ldr r5, [r6]
	ldr r6, [fp, #-4]
	add  r7, r6, r5
	add  r5, r7, r4
	str r5, [fp, #-4]
	ldr r4, [fp, #-56]
	mov r5, #1
	mov r7, #4
	mul  r6, r5, r7
	add  r5, r4, r6
	ldr r4, [r5]
	ldr r5, [fp, #-56]
	mov r6, #0
	mov r8, #4
	mul  r7, r6, r8
	add  r6, r5, r7
	ldr r5, [r6]
	ldr r6, [fp, #-4]
	add  r7, r6, r5
	add  r5, r7, r4
	str r5, [fp, #-4]
	ldr r4, [fp, #-52]
	mov r5, #1
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-52]
	mov r6, #0
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r5, r8
	ldr r5, [r6]
	ldr r6, [fp, #-4]
	add  r7, r6, r5
	add  r5, r7, r4
	str r5, [fp, #-4]
	ldr r4, [fp, #-48]
	mov r5, #1
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-48]
	mov r6, #0
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r5, r8
	ldr r5, [r6]
	ldr r6, [fp, #-4]
	add  r7, r6, r5
	add  r5, r7, r4
	str r5, [fp, #-4]
	ldr r4, [fp, #-44]
	mov r5, #1
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-44]
	mov r6, #0
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r5, r8
	ldr r5, [r6]
	ldr r6, [fp, #-4]
	add  r7, r6, r5
	add  r5, r7, r4
	str r5, [fp, #-4]
	ldr r4, [fp, #-40]
	mov r5, #1
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-40]
	mov r6, #0
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r5, r8
	ldr r5, [r6]
	ldr r6, [fp, #-4]
	add  r7, r6, r5
	add  r5, r7, r4
	str r5, [fp, #-4]
	ldr r4, [fp, #-36]
	mov r5, #1
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-36]
	mov r6, #0
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r5, r8
	ldr r5, [r6]
	ldr r6, [fp, #-4]
	add  r7, r6, r5
	add  r5, r7, r4
	str r5, [fp, #-4]
	ldr r4, [fp, #-32]
	mov r5, #1
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-32]
	mov r6, #0
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r5, r8
	ldr r5, [r6]
	ldr r6, [fp, #-4]
	add  r7, r6, r5
	add  r5, r7, r4
	str r5, [fp, #-4]
	ldr r4, [fp, #-28]
	mov r5, #1
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-28]
	mov r6, #0
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r5, r8
	ldr r5, [r6]
	ldr r6, [fp, #-4]
	add  r7, r6, r5
	add  r5, r7, r4
	str r5, [fp, #-4]
	ldr r4, [fp, #-24]
	mov r5, #1
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-24]
	mov r6, #0
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r5, r8
	ldr r5, [r6]
	ldr r6, [fp, #-4]
	add  r7, r6, r5
	add  r5, r7, r4
	str r5, [fp, #-4]
	ldr r4, [fp, #-20]
	mov r5, #1
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-20]
	mov r6, #0
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r5, r8
	ldr r5, [r6]
	ldr r6, [fp, #-4]
	add  r7, r6, r5
	add  r5, r7, r4
	str r5, [fp, #-4]
	ldr r4, [fp, #-16]
	mov r5, #1
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-16]
	mov r6, #0
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r5, r8
	ldr r5, [r6]
	ldr r6, [fp, #-4]
	add  r7, r6, r5
	add  r5, r7, r4
	str r5, [fp, #-4]
	ldr r4, [fp, #-12]
	mov r5, #1
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-12]
	mov r6, #0
	mov r8, #4
	mul  r7, r6, r8
	add  r6, r5, r7
	ldr r5, [r6]
	ldr r6, [fp, #-4]
	add  r7, r6, r5
	add  r5, r7, r4
	str r5, [fp, #-4]
	ldr r4, [fp, #-8]
	mov r5, #1
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	ldr r5, [fp, #-8]
	mov r6, #0
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r5, r8
	ldr r5, [r6]
	ldr r6, [fp, #-4]
	add  r7, r6, r5
	add  r5, r7, r4
	str r5, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

	.global param16
	.type param16 , %function
param16:
	push {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov fp, sp
	ldr r4, =344
	sub  sp, sp, r4
.L790:
	str r0, [fp, #-128]
	str r1, [fp, #-124]
	str r2, [fp, #-120]
	str r3, [fp, #-116]
	ldr r4, [fp, #36]
	str r4, [fp, #-112]
	ldr r4, [fp, #40]
	str r4, [fp, #-108]
	ldr r4, [fp, #44]
	str r4, [fp, #-104]
	ldr r4, [fp, #48]
	str r4, [fp, #-100]
	ldr r4, [fp, #52]
	str r4, [fp, #-96]
	ldr r4, [fp, #56]
	str r4, [fp, #-92]
	ldr r4, [fp, #60]
	str r4, [fp, #-88]
	ldr r4, [fp, #64]
	str r4, [fp, #-84]
	ldr r4, [fp, #68]
	str r4, [fp, #-80]
	ldr r4, [fp, #72]
	str r4, [fp, #-76]
	ldr r4, [fp, #76]
	str r4, [fp, #-72]
	ldr r4, [fp, #80]
	str r4, [fp, #-68]
	ldr r4, [fp, #-128]
	mov r5, #0
	mov r6, #-64
	mov r7, #4
	mul  r8, r5, r7
	add  r5, r6, r8
	add  r6, fp, r5
	str r4, [r6]
	ldr r4, [fp, #-124]
	add  r5, r6, #4
	str r4, [r5]
	ldr r4, [fp, #-120]
	add  r6, r5, #4
	str r4, [r6]
	ldr r4, [fp, #-116]
	add  r5, r6, #4
	str r4, [r5]
	ldr r4, [fp, #-112]
	add  r6, r5, #4
	str r4, [r6]
	ldr r4, [fp, #-108]
	add  r5, r6, #4
	str r4, [r5]
	ldr r4, [fp, #-104]
	add  r6, r5, #4
	str r4, [r6]
	ldr r4, [fp, #-100]
	add  r5, r6, #4
	str r4, [r5]
	ldr r4, [fp, #-96]
	add  r6, r5, #4
	str r4, [r6]
	ldr r4, [fp, #-92]
	add  r5, r6, #4
	str r4, [r5]
	ldr r4, [fp, #-88]
	add  r6, r5, #4
	str r4, [r6]
	ldr r4, [fp, #-84]
	add  r5, r6, #4
	str r4, [r5]
	ldr r4, [fp, #-80]
	add  r6, r5, #4
	str r4, [r6]
	ldr r4, [fp, #-76]
	add  r5, r6, #4
	str r4, [r5]
	ldr r4, [fp, #-72]
	add  r6, r5, #4
	str r4, [r6]
	ldr r4, [fp, #-68]
	add  r5, r6, #4
	str r4, [r5]
	mov r4, #0
	mov r5, #-64
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	mov r0, r5
	mov r1, #16
	bl sort
	mov r4, #0
	mov r5, #-64
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, [r5]
	mov r5, #1
	mov r6, #-64
	mov r7, #4
	mul  r8, r5, r7
	add  r5, r6, r8
	add  r6, fp, r5
	ldr r5, [r6]
	mov r6, #2
	mov r7, #-64
	mov r8, #4
	mul  r9, r6, r8
	add  r6, r7, r9
	add  r7, fp, r6
	ldr r6, [r7]
	mov r7, #3
	mov r8, #-64
	mov r9, #4
	mul  r10, r7, r9
	add  r7, r8, r10
	add  r8, fp, r7
	ldr r7, [r8]
	str r7, [fp, #-244]
	mov r7, #4
	mov r8, #-64
	mov r10, #4
	mul  r9, r7, r10
	add  r7, r8, r9
	add  r8, fp, r7
	ldr r7, [r8]
	str r7, [fp, #-248]
	mov r7, #5
	mov r8, #-64
	mov r9, #4
	mul  r10, r7, r9
	add  r7, r8, r10
	add  r8, fp, r7
	ldr r7, [r8]
	str r7, [fp, #-252]
	mov r7, #6
	mov r8, #-64
	mov r9, #4
	mul  r10, r7, r9
	add  r7, r8, r10
	add  r8, fp, r7
	ldr r7, [r8]
	str r7, [fp, #-256]
	mov r7, #7
	mov r8, #-64
	mov r9, #4
	mul  r10, r7, r9
	add  r7, r8, r10
	add  r8, fp, r7
	ldr r7, [r8]
	str r7, [fp, #-260]
	mov r7, #8
	mov r8, #-64
	mov r9, #4
	mul  r10, r7, r9
	add  r7, r8, r10
	add  r8, fp, r7
	ldr r7, [r8]
	str r7, [fp, #-264]
	mov r7, #9
	mov r8, #-64
	mov r10, #4
	mul  r9, r7, r10
	add  r7, r8, r9
	add  r8, fp, r7
	ldr r7, [r8]
	str r7, [fp, #-268]
	mov r7, #10
	mov r8, #-64
	mov r9, #4
	mul  r10, r7, r9
	add  r7, r8, r10
	add  r8, fp, r7
	ldr r7, [r8]
	str r7, [fp, #-272]
	mov r7, #11
	mov r8, #-64
	mov r10, #4
	mul  r9, r7, r10
	add  r7, r8, r9
	add  r8, fp, r7
	ldr r7, [r8]
	str r7, [fp, #-276]
	mov r7, #12
	mov r8, #-64
	mov r10, #4
	mul  r9, r7, r10
	add  r7, r8, r9
	add  r8, fp, r7
	ldr r7, [r8]
	str r7, [fp, #-280]
	mov r7, #13
	mov r8, #-64
	mov r9, #4
	mul  r10, r7, r9
	add  r7, r8, r10
	add  r8, fp, r7
	ldr r7, [r8]
	str r7, [fp, #-284]
	mov r7, #14
	mov r8, #-64
	mov r9, #4
	mul  r10, r7, r9
	add  r7, r8, r10
	add  r8, fp, r7
	ldr r7, [r8]
	str r7, [fp, #-288]
	mov r7, #15
	mov r8, #-64
	mov r9, #4
	mul  r10, r7, r9
	add  r7, r8, r10
	add  r8, fp, r7
	ldr r7, [r8]
	ldr r8, [fp, #-128]
	ldr r9, [fp, #-124]
	ldr r10, [fp, #-120]
	str r10, [fp, #-344]
	ldr r10, [fp, #-116]
	str r10, [fp, #-292]
	ldr r10, [fp, #-112]
	str r10, [fp, #-296]
	ldr r10, [fp, #-108]
	str r10, [fp, #-300]
	ldr r10, [fp, #-104]
	str r10, [fp, #-304]
	ldr r10, [fp, #-100]
	str r10, [fp, #-308]
	ldr r10, [fp, #-96]
	str r10, [fp, #-312]
	ldr r10, [fp, #-92]
	str r10, [fp, #-316]
	ldr r10, [fp, #-88]
	str r10, [fp, #-320]
	ldr r10, [fp, #-84]
	str r10, [fp, #-324]
	ldr r10, [fp, #-80]
	str r10, [fp, #-328]
	ldr r10, [fp, #-76]
	str r10, [fp, #-332]
	ldr r10, [fp, #-72]
	str r10, [fp, #-336]
	ldr r10, [fp, #-68]
	str r10, [fp, #-340]
	mov r0, r4
	mov r1, r5
	mov r2, r6
	ldr r4, [fp, #-244]
	mov r3, r4
	ldr r4, [fp, #-248]
	mov r4, r4
	str r4, [sp, #-112]
	ldr r4, [fp, #-252]
	mov r4, r4
	str r4, [sp, #-108]
	ldr r4, [fp, #-256]
	mov r4, r4
	str r4, [sp, #-104]
	ldr r4, [fp, #-260]
	mov r4, r4
	str r4, [sp, #-100]
	ldr r4, [fp, #-264]
	mov r4, r4
	str r4, [sp, #-96]
	ldr r4, [fp, #-268]
	mov r4, r4
	str r4, [sp, #-92]
	ldr r4, [fp, #-272]
	mov r4, r4
	str r4, [sp, #-88]
	ldr r4, [fp, #-276]
	mov r4, r4
	str r4, [sp, #-84]
	ldr r4, [fp, #-280]
	mov r4, r4
	str r4, [sp, #-80]
	ldr r4, [fp, #-284]
	mov r4, r4
	str r4, [sp, #-76]
	ldr r4, [fp, #-288]
	mov r4, r4
	str r4, [sp, #-72]
	mov r4, r7
	str r4, [sp, #-68]
	mov r4, r8
	str r4, [sp, #-64]
	mov r4, r9
	str r4, [sp, #-60]
	ldr r4, [fp, #-344]
	mov r4, r4
	str r4, [sp, #-56]
	ldr r4, [fp, #-292]
	mov r4, r4
	str r4, [sp, #-52]
	ldr r4, [fp, #-296]
	mov r4, r4
	str r4, [sp, #-48]
	ldr r4, [fp, #-300]
	mov r4, r4
	str r4, [sp, #-44]
	ldr r4, [fp, #-304]
	mov r4, r4
	str r4, [sp, #-40]
	ldr r4, [fp, #-308]
	mov r4, r4
	str r4, [sp, #-36]
	ldr r4, [fp, #-312]
	mov r4, r4
	str r4, [sp, #-32]
	ldr r4, [fp, #-316]
	mov r4, r4
	str r4, [sp, #-28]
	ldr r4, [fp, #-320]
	mov r4, r4
	str r4, [sp, #-24]
	ldr r4, [fp, #-324]
	mov r4, r4
	str r4, [sp, #-20]
	ldr r4, [fp, #-328]
	mov r4, r4
	str r4, [sp, #-16]
	ldr r4, [fp, #-332]
	mov r4, r4
	str r4, [sp, #-12]
	ldr r4, [fp, #-336]
	mov r4, r4
	str r4, [sp, #-8]
	ldr r4, [fp, #-340]
	mov r4, r4
	str r4, [sp, #-4]
	sub  sp, sp, #112
	bl param32_rec
	add  sp, sp, #112
	mov r4, r0
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr

	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov fp, sp
	ldr r4, =572
	sub  sp, sp, r4
.L856:
	bl getint
	mov r4, r0
	bl getint
	mov r5, r0
	bl getint
	mov r6, r0
	bl getint
	mov r7, r0
	bl getint
	mov r8, r0
	bl getint
	mov r9, r0
	bl getint
	mov r10, r0
	str r10, [fp, #-572]
	bl getint
	mov r10, r0
	str r10, [fp, #-424]
	bl getint
	mov r10, r0
	str r10, [fp, #-428]
	bl getint
	mov r10, r0
	str r10, [fp, #-432]
	bl getint
	mov r10, r0
	str r10, [fp, #-436]
	bl getint
	mov r10, r0
	str r10, [fp, #-440]
	bl getint
	mov r10, r0
	str r10, [fp, #-444]
	bl getint
	mov r10, r0
	str r10, [fp, #-448]
	bl getint
	mov r10, r0
	str r10, [fp, #-452]
	bl getint
	mov r10, r0
	str r10, [fp, #-456]
	mov r0, r4
	mov r1, r5
	mov r2, r6
	mov r3, r7
	mov r4, r8
	str r4, [sp, #-48]
	mov r4, r9
	str r4, [sp, #-44]
	ldr r4, [fp, #-572]
	mov r4, r4
	str r4, [sp, #-40]
	ldr r4, [fp, #-424]
	mov r4, r4
	str r4, [sp, #-36]
	ldr r4, [fp, #-428]
	mov r4, r4
	str r4, [sp, #-32]
	ldr r4, [fp, #-432]
	mov r4, r4
	str r4, [sp, #-28]
	ldr r4, [fp, #-436]
	mov r4, r4
	str r4, [sp, #-24]
	ldr r4, [fp, #-440]
	mov r4, r4
	str r4, [sp, #-20]
	ldr r4, [fp, #-444]
	mov r4, r4
	str r4, [sp, #-16]
	ldr r4, [fp, #-448]
	mov r4, r4
	str r4, [sp, #-12]
	ldr r4, [fp, #-452]
	mov r4, r4
	str r4, [sp, #-8]
	ldr r4, [fp, #-456]
	mov r4, r4
	str r4, [sp, #-4]
	sub  sp, sp, #48
	bl param16
	add  sp, sp, #48
	mov r4, r0
	mov r5, #0
	mov r6, #65276
	add  r6, r6, #16711680
	add  r6, r6, #-16777216
	mov r7, #8
	mul  r8, r5, r7
	add  r5, r6, r8
	add  r6, fp, r5
	mov r5, #0
	mov r7, #4
	mul  r8, r5, r7
	add  r5, r6, r8
	str r4, [r5]
	add  r4, r5, #4
	mov r5, #8848
	add  r5, r5, #0
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
	ldr r4, =1
	str r4, [fp, #-4]
	b .L987
.L987:
	ldr r4, [fp, #-4]
	ldr r5, =32
	cmp r4, r5
	blt .L988
	b .L989
.L988:
	ldr r4, [fp, #-4]
	sub  r5, r4, #1
	mov r4, #65276
	add  r4, r4, #16711680
	add  r4, r4, #-16777216
	mov r7, #8
	mul  r6, r5, r7
	add  r5, r4, r6
	add  r4, fp, r5
	mov r5, #1
	mov r7, #4
	mul  r6, r5, r7
	add  r5, r4, r6
	ldr r4, [r5]
	sub  r5, r4, #1
	ldr r4, [fp, #-4]
	mov r6, #65276
	add  r6, r6, #16711680
	add  r6, r6, #-16777216
	mov r7, #8
	mul  r8, r4, r7
	add  r4, r6, r8
	add  r6, fp, r4
	mov r4, #0
	mov r8, #4
	mul  r7, r4, r8
	add  r4, r6, r7
	str r5, [r4]
	ldr r4, [fp, #-4]
	sub  r5, r4, #1
	mov r4, #65276
	add  r4, r4, #16711680
	add  r4, r4, #-16777216
	mov r6, #8
	mul  r7, r5, r6
	add  r5, r4, r7
	add  r4, fp, r5
	mov r5, #0
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	ldr r4, [r5]
	sub  r5, r4, #2
	ldr r4, [fp, #-4]
	mov r6, #65276
	add  r6, r6, #16711680
	add  r6, r6, #-16777216
	mov r7, #8
	mul  r8, r4, r7
	add  r4, r6, r8
	add  r6, fp, r4
	mov r4, #1
	mov r7, #4
	mul  r8, r4, r7
	add  r4, r6, r8
	str r5, [r4]
	ldr r4, [fp, #-4]
	add  r5, r4, #1
	str r5, [fp, #-4]
	b .L987
.L989:
	mov r4, #0
	mov r5, #65276
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	mov r6, #8
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	mov r4, #0
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	mov r5, #1
	mov r6, #65276
	add  r6, r6, #16711680
	add  r6, r6, #-16777216
	mov r7, #8
	mul  r8, r5, r7
	add  r5, r6, r8
	add  r6, fp, r5
	mov r5, #0
	mov r7, #4
	mul  r8, r5, r7
	add  r5, r6, r8
	mov r6, #2
	mov r7, #65276
	add  r7, r7, #16711680
	add  r7, r7, #-16777216
	mov r8, #8
	mul  r9, r6, r8
	add  r6, r7, r9
	add  r7, fp, r6
	mov r6, #0
	mov r8, #4
	mul  r9, r6, r8
	add  r6, r7, r9
	mov r7, #3
	mov r8, #65276
	add  r8, r8, #16711680
	add  r8, r8, #-16777216
	mov r9, #8
	mul  r10, r7, r9
	add  r7, r8, r10
	add  r8, fp, r7
	mov r7, #0
	mov r9, #4
	mul  r10, r7, r9
	add  r7, r8, r10
	str r7, [fp, #-460]
	mov r7, #4
	mov r8, #65276
	add  r8, r8, #16711680
	add  r8, r8, #-16777216
	mov r9, #8
	mul  r10, r7, r9
	add  r7, r8, r10
	add  r8, fp, r7
	mov r7, #0
	mov r9, #4
	mul  r10, r7, r9
	add  r7, r8, r10
	str r7, [fp, #-464]
	mov r7, #5
	mov r8, #65276
	add  r8, r8, #16711680
	add  r8, r8, #-16777216
	mov r10, #8
	mul  r9, r7, r10
	add  r7, r8, r9
	add  r8, fp, r7
	mov r7, #0
	mov r9, #4
	mul  r10, r7, r9
	add  r7, r8, r10
	str r7, [fp, #-468]
	mov r7, #6
	mov r8, #65276
	add  r8, r8, #16711680
	add  r8, r8, #-16777216
	mov r10, #8
	mul  r9, r7, r10
	add  r7, r8, r9
	add  r8, fp, r7
	mov r7, #0
	mov r9, #4
	mul  r10, r7, r9
	add  r7, r8, r10
	str r7, [fp, #-472]
	mov r7, #7
	mov r8, #65276
	add  r8, r8, #16711680
	add  r8, r8, #-16777216
	mov r10, #8
	mul  r9, r7, r10
	add  r7, r8, r9
	add  r8, fp, r7
	mov r7, #0
	mov r9, #4
	mul  r10, r7, r9
	add  r7, r8, r10
	str r7, [fp, #-476]
	mov r7, #8
	mov r8, #65276
	add  r8, r8, #16711680
	add  r8, r8, #-16777216
	mov r9, #8
	mul  r10, r7, r9
	add  r7, r8, r10
	add  r8, fp, r7
	mov r7, #0
	mov r10, #4
	mul  r9, r7, r10
	add  r7, r8, r9
	str r7, [fp, #-480]
	mov r7, #9
	mov r8, #65276
	add  r8, r8, #16711680
	add  r8, r8, #-16777216
	mov r9, #8
	mul  r10, r7, r9
	add  r7, r8, r10
	add  r8, fp, r7
	mov r7, #0
	mov r9, #4
	mul  r10, r7, r9
	add  r7, r8, r10
	str r7, [fp, #-484]
	mov r7, #10
	mov r8, #65276
	add  r8, r8, #16711680
	add  r8, r8, #-16777216
	mov r10, #8
	mul  r9, r7, r10
	add  r7, r8, r9
	add  r8, fp, r7
	mov r7, #0
	mov r10, #4
	mul  r9, r7, r10
	add  r7, r8, r9
	str r7, [fp, #-488]
	mov r7, #11
	mov r8, #65276
	add  r8, r8, #16711680
	add  r8, r8, #-16777216
	mov r9, #8
	mul  r10, r7, r9
	add  r7, r8, r10
	add  r8, fp, r7
	mov r7, #0
	mov r9, #4
	mul  r10, r7, r9
	add  r7, r8, r10
	str r7, [fp, #-492]
	mov r7, #12
	mov r8, #65276
	add  r8, r8, #16711680
	add  r8, r8, #-16777216
	mov r9, #8
	mul  r10, r7, r9
	add  r7, r8, r10
	add  r8, fp, r7
	mov r7, #0
	mov r10, #4
	mul  r9, r7, r10
	add  r7, r8, r9
	str r7, [fp, #-496]
	mov r7, #13
	mov r8, #65276
	add  r8, r8, #16711680
	add  r8, r8, #-16777216
	mov r9, #8
	mul  r10, r7, r9
	add  r7, r8, r10
	add  r8, fp, r7
	mov r7, #0
	mov r9, #4
	mul  r10, r7, r9
	add  r7, r8, r10
	str r7, [fp, #-500]
	mov r7, #14
	mov r8, #65276
	add  r8, r8, #16711680
	add  r8, r8, #-16777216
	mov r10, #8
	mul  r9, r7, r10
	add  r7, r8, r9
	add  r8, fp, r7
	mov r7, #0
	mov r10, #4
	mul  r9, r7, r10
	add  r7, r8, r9
	str r7, [fp, #-504]
	mov r7, #15
	mov r8, #65276
	add  r8, r8, #16711680
	add  r8, r8, #-16777216
	mov r9, #8
	mul  r10, r7, r9
	add  r7, r8, r10
	add  r8, fp, r7
	mov r7, #0
	mov r9, #4
	mul  r10, r7, r9
	add  r7, r8, r10
	str r7, [fp, #-508]
	mov r7, #16
	mov r8, #65276
	add  r8, r8, #16711680
	add  r8, r8, #-16777216
	mov r9, #8
	mul  r10, r7, r9
	add  r7, r8, r10
	add  r8, fp, r7
	mov r7, #0
	mov r9, #4
	mul  r10, r7, r9
	add  r7, r8, r10
	str r7, [fp, #-512]
	mov r7, #17
	mov r8, #65276
	add  r8, r8, #16711680
	add  r8, r8, #-16777216
	mov r9, #8
	mul  r10, r7, r9
	add  r7, r8, r10
	add  r8, fp, r7
	mov r7, #0
	mov r9, #4
	mul  r10, r7, r9
	add  r7, r8, r10
	str r7, [fp, #-516]
	mov r7, #18
	mov r8, #65276
	add  r8, r8, #16711680
	add  r8, r8, #-16777216
	mov r9, #8
	mul  r10, r7, r9
	add  r7, r8, r10
	add  r8, fp, r7
	mov r7, #0
	mov r9, #4
	mul  r10, r7, r9
	add  r7, r8, r10
	str r7, [fp, #-520]
	mov r7, #19
	mov r8, #65276
	add  r8, r8, #16711680
	add  r8, r8, #-16777216
	mov r9, #8
	mul  r10, r7, r9
	add  r7, r8, r10
	add  r8, fp, r7
	mov r7, #0
	mov r9, #4
	mul  r10, r7, r9
	add  r7, r8, r10
	str r7, [fp, #-524]
	mov r7, #20
	mov r8, #65276
	add  r8, r8, #16711680
	add  r8, r8, #-16777216
	mov r10, #8
	mul  r9, r7, r10
	add  r7, r8, r9
	add  r8, fp, r7
	mov r7, #0
	mov r9, #4
	mul  r10, r7, r9
	add  r7, r8, r10
	str r7, [fp, #-528]
	mov r7, #21
	mov r8, #65276
	add  r8, r8, #16711680
	add  r8, r8, #-16777216
	mov r9, #8
	mul  r10, r7, r9
	add  r7, r8, r10
	add  r8, fp, r7
	mov r7, #0
	mov r9, #4
	mul  r10, r7, r9
	add  r7, r8, r10
	str r7, [fp, #-532]
	mov r7, #22
	mov r8, #65276
	add  r8, r8, #16711680
	add  r8, r8, #-16777216
	mov r9, #8
	mul  r10, r7, r9
	add  r7, r8, r10
	add  r8, fp, r7
	mov r7, #0
	mov r9, #4
	mul  r10, r7, r9
	add  r7, r8, r10
	str r7, [fp, #-536]
	mov r7, #23
	mov r8, #65276
	add  r8, r8, #16711680
	add  r8, r8, #-16777216
	mov r9, #8
	mul  r10, r7, r9
	add  r7, r8, r10
	add  r8, fp, r7
	mov r7, #0
	mov r9, #4
	mul  r10, r7, r9
	add  r7, r8, r10
	str r7, [fp, #-540]
	mov r7, #24
	mov r8, #65276
	add  r8, r8, #16711680
	add  r8, r8, #-16777216
	mov r9, #8
	mul  r10, r7, r9
	add  r7, r8, r10
	add  r8, fp, r7
	mov r7, #0
	mov r9, #4
	mul  r10, r7, r9
	add  r7, r8, r10
	str r7, [fp, #-544]
	mov r7, #25
	mov r8, #65276
	add  r8, r8, #16711680
	add  r8, r8, #-16777216
	mov r9, #8
	mul  r10, r7, r9
	add  r7, r8, r10
	add  r8, fp, r7
	mov r7, #0
	mov r9, #4
	mul  r10, r7, r9
	add  r7, r8, r10
	str r7, [fp, #-548]
	mov r7, #26
	mov r8, #65276
	add  r8, r8, #16711680
	add  r8, r8, #-16777216
	mov r9, #8
	mul  r10, r7, r9
	add  r7, r8, r10
	add  r8, fp, r7
	mov r7, #0
	mov r9, #4
	mul  r10, r7, r9
	add  r7, r8, r10
	str r7, [fp, #-552]
	mov r7, #27
	mov r8, #65276
	add  r8, r8, #16711680
	add  r8, r8, #-16777216
	mov r9, #8
	mul  r10, r7, r9
	add  r7, r8, r10
	add  r8, fp, r7
	mov r7, #0
	mov r9, #4
	mul  r10, r7, r9
	add  r7, r8, r10
	str r7, [fp, #-556]
	mov r7, #28
	mov r8, #65276
	add  r8, r8, #16711680
	add  r8, r8, #-16777216
	mov r9, #8
	mul  r10, r7, r9
	add  r7, r8, r10
	add  r8, fp, r7
	mov r7, #0
	mov r9, #4
	mul  r10, r7, r9
	add  r7, r8, r10
	str r7, [fp, #-560]
	mov r7, #29
	mov r8, #65276
	add  r8, r8, #16711680
	add  r8, r8, #-16777216
	mov r9, #8
	mul  r10, r7, r9
	add  r7, r8, r10
	add  r8, fp, r7
	mov r7, #0
	mov r9, #4
	mul  r10, r7, r9
	add  r7, r8, r10
	str r7, [fp, #-564]
	mov r7, #30
	mov r8, #65276
	add  r8, r8, #16711680
	add  r8, r8, #-16777216
	mov r9, #8
	mul  r10, r7, r9
	add  r7, r8, r10
	add  r8, fp, r7
	mov r7, #0
	mov r9, #4
	mul  r10, r7, r9
	add  r7, r8, r10
	str r7, [fp, #-568]
	mov r7, #31
	mov r8, #65276
	add  r8, r8, #16711680
	add  r8, r8, #-16777216
	mov r9, #8
	mul  r10, r7, r9
	add  r7, r8, r10
	add  r8, fp, r7
	mov r7, #0
	mov r9, #4
	mul  r10, r7, r9
	add  r7, r8, r10
	mov r0, r4
	mov r1, r5
	mov r2, r6
	ldr r4, [fp, #-460]
	mov r3, r4
	ldr r4, [fp, #-464]
	mov r4, r4
	str r4, [sp, #-112]
	ldr r4, [fp, #-468]
	mov r4, r4
	str r4, [sp, #-108]
	ldr r4, [fp, #-472]
	mov r4, r4
	str r4, [sp, #-104]
	ldr r4, [fp, #-476]
	mov r4, r4
	str r4, [sp, #-100]
	ldr r4, [fp, #-480]
	mov r4, r4
	str r4, [sp, #-96]
	ldr r4, [fp, #-484]
	mov r4, r4
	str r4, [sp, #-92]
	ldr r4, [fp, #-488]
	mov r4, r4
	str r4, [sp, #-88]
	ldr r4, [fp, #-492]
	mov r4, r4
	str r4, [sp, #-84]
	ldr r4, [fp, #-496]
	mov r4, r4
	str r4, [sp, #-80]
	ldr r4, [fp, #-500]
	mov r4, r4
	str r4, [sp, #-76]
	ldr r4, [fp, #-504]
	mov r4, r4
	str r4, [sp, #-72]
	ldr r4, [fp, #-508]
	mov r4, r4
	str r4, [sp, #-68]
	ldr r4, [fp, #-512]
	mov r4, r4
	str r4, [sp, #-64]
	ldr r4, [fp, #-516]
	mov r4, r4
	str r4, [sp, #-60]
	ldr r4, [fp, #-520]
	mov r4, r4
	str r4, [sp, #-56]
	ldr r4, [fp, #-524]
	mov r4, r4
	str r4, [sp, #-52]
	ldr r4, [fp, #-528]
	mov r4, r4
	str r4, [sp, #-48]
	ldr r4, [fp, #-532]
	mov r4, r4
	str r4, [sp, #-44]
	ldr r4, [fp, #-536]
	mov r4, r4
	str r4, [sp, #-40]
	ldr r4, [fp, #-540]
	mov r4, r4
	str r4, [sp, #-36]
	ldr r4, [fp, #-544]
	mov r4, r4
	str r4, [sp, #-32]
	ldr r4, [fp, #-548]
	mov r4, r4
	str r4, [sp, #-28]
	ldr r4, [fp, #-552]
	mov r4, r4
	str r4, [sp, #-24]
	ldr r4, [fp, #-556]
	mov r4, r4
	str r4, [sp, #-20]
	ldr r4, [fp, #-560]
	mov r4, r4
	str r4, [sp, #-16]
	ldr r4, [fp, #-564]
	mov r4, r4
	str r4, [sp, #-12]
	ldr r4, [fp, #-568]
	mov r4, r4
	str r4, [sp, #-8]
	mov r4, r7
	str r4, [sp, #-4]
	sub  sp, sp, #112
	bl param32_arr
	add  sp, sp, #112
	mov r4, r0
	mov r0, r4
	bl putint
	mov r0, #10
	bl putch
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr

