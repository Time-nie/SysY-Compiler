	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.text
	.global testParam8
	.type testParam8 , %function
testParam8:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub  sp, sp, #32
.L289:
	str r0, [fp, #-32]
	str r1, [fp, #-28]
	str r2, [fp, #-24]
	str r3, [fp, #-20]
	ldr r4, [fp, #20]
	str r4, [fp, #-16]
	ldr r4, [fp, #24]
	str r4, [fp, #-12]
	ldr r4, [fp, #28]
	str r4, [fp, #-8]
	ldr r4, [fp, #32]
	str r4, [fp, #-4]
	ldr r4, [fp, #-32]
	ldr r5, [fp, #-28]
	sub  r6, r4, r5
	ldr r4, [fp, #-24]
	add  r5, r4, r6
	ldr r4, [fp, #-20]
	sub  r6, r5, r4
	ldr r4, [fp, #-16]
	sub  r5, r6, r4
	ldr r4, [fp, #-12]
	sub  r6, r5, r4
	ldr r4, [fp, #-8]
	add  r5, r4, r6
	ldr r4, [fp, #-4]
	add  r6, r4, r5
	mov r0, r6
	sub  sp, fp, #0
	pop {r4, r5, r6, fp, lr}
	bx lr

	.global testParam16
	.type testParam16 , %function
testParam16:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub  sp, sp, #64
.L306:
	str r0, [fp, #-64]
	str r1, [fp, #-60]
	str r2, [fp, #-56]
	str r3, [fp, #-52]
	ldr r4, [fp, #20]
	str r4, [fp, #-48]
	ldr r4, [fp, #24]
	str r4, [fp, #-44]
	ldr r4, [fp, #28]
	str r4, [fp, #-40]
	ldr r4, [fp, #32]
	str r4, [fp, #-36]
	ldr r4, [fp, #36]
	str r4, [fp, #-32]
	ldr r4, [fp, #40]
	str r4, [fp, #-28]
	ldr r4, [fp, #44]
	str r4, [fp, #-24]
	ldr r4, [fp, #48]
	str r4, [fp, #-20]
	ldr r4, [fp, #52]
	str r4, [fp, #-16]
	ldr r4, [fp, #56]
	str r4, [fp, #-12]
	ldr r4, [fp, #60]
	str r4, [fp, #-8]
	ldr r4, [fp, #64]
	str r4, [fp, #-4]
	ldr r4, [fp, #-64]
	ldr r5, [fp, #-60]
	add  r6, r5, r4
	ldr r4, [fp, #-56]
	add  r5, r4, r6
	ldr r4, [fp, #-52]
	add  r6, r4, r5
	ldr r4, [fp, #-48]
	sub  r5, r6, r4
	ldr r4, [fp, #-44]
	add  r6, r4, r5
	ldr r4, [fp, #-40]
	add  r5, r4, r6
	ldr r4, [fp, #-36]
	add  r6, r4, r5
	ldr r4, [fp, #-32]
	sub  r5, r6, r4
	ldr r4, [fp, #-28]
	add  r6, r4, r5
	ldr r4, [fp, #-24]
	sub  r5, r6, r4
	ldr r4, [fp, #-20]
	add  r6, r4, r5
	ldr r4, [fp, #-16]
	add  r5, r4, r6
	ldr r4, [fp, #-12]
	add  r6, r4, r5
	ldr r4, [fp, #-8]
	add  r5, r4, r6
	ldr r4, [fp, #-4]
	add  r6, r4, r5
	mov r0, r6
	sub  sp, fp, #0
	pop {r4, r5, r6, fp, lr}
	bx lr

	.global testParam32
	.type testParam32 , %function
testParam32:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub  sp, sp, #128
.L339:
	str r0, [fp, #-128]
	str r1, [fp, #-124]
	str r2, [fp, #-120]
	str r3, [fp, #-116]
	ldr r4, [fp, #24]
	str r4, [fp, #-112]
	ldr r4, [fp, #28]
	str r4, [fp, #-108]
	ldr r4, [fp, #32]
	str r4, [fp, #-104]
	ldr r4, [fp, #36]
	str r4, [fp, #-100]
	ldr r4, [fp, #40]
	str r4, [fp, #-96]
	ldr r4, [fp, #44]
	str r4, [fp, #-92]
	ldr r4, [fp, #48]
	str r4, [fp, #-88]
	ldr r4, [fp, #52]
	str r4, [fp, #-84]
	ldr r4, [fp, #56]
	str r4, [fp, #-80]
	ldr r4, [fp, #60]
	str r4, [fp, #-76]
	ldr r4, [fp, #64]
	str r4, [fp, #-72]
	ldr r4, [fp, #68]
	str r4, [fp, #-68]
	ldr r4, [fp, #72]
	str r4, [fp, #-64]
	ldr r4, [fp, #76]
	str r4, [fp, #-60]
	ldr r4, [fp, #80]
	str r4, [fp, #-56]
	ldr r4, [fp, #84]
	str r4, [fp, #-52]
	ldr r4, [fp, #88]
	str r4, [fp, #-48]
	ldr r4, [fp, #92]
	str r4, [fp, #-44]
	ldr r4, [fp, #96]
	str r4, [fp, #-40]
	ldr r4, [fp, #100]
	str r4, [fp, #-36]
	ldr r4, [fp, #104]
	str r4, [fp, #-32]
	ldr r4, [fp, #108]
	str r4, [fp, #-28]
	ldr r4, [fp, #112]
	str r4, [fp, #-24]
	ldr r4, [fp, #116]
	str r4, [fp, #-20]
	ldr r4, [fp, #120]
	str r4, [fp, #-16]
	ldr r4, [fp, #124]
	str r4, [fp, #-12]
	ldr r4, [fp, #128]
	str r4, [fp, #-8]
	ldr r4, [fp, #132]
	str r4, [fp, #-4]
	ldr r4, [fp, #-128]
	ldr r5, [fp, #-124]
	ldr r6, [fp, #-120]
	mul  r7, r6, r5
	add  r5, r7, r4
	ldr r4, [fp, #-116]
	add  r6, r4, r5
	ldr r4, [fp, #-112]
	add  r5, r4, r6
	ldr r4, [fp, #-108]
	add  r6, r4, r5
	ldr r4, [fp, #-104]
	add  r5, r4, r6
	ldr r4, [fp, #-100]
	add  r6, r4, r5
	ldr r4, [fp, #-96]
	add  r5, r4, r6
	ldr r4, [fp, #-92]
	add  r6, r4, r5
	ldr r4, [fp, #-88]
	add  r5, r4, r6
	ldr r4, [fp, #-84]
	add  r6, r4, r5
	ldr r4, [fp, #-80]
	sub  r5, r6, r4
	ldr r4, [fp, #-76]
	sub  r6, r5, r4
	ldr r4, [fp, #-72]
	sub  r5, r6, r4
	ldr r4, [fp, #-68]
	sub  r6, r5, r4
	ldr r4, [fp, #-64]
	sub  r5, r6, r4
	ldr r4, [fp, #-60]
	sub  r6, r5, r4
	ldr r4, [fp, #-56]
	sub  r5, r6, r4
	ldr r4, [fp, #-52]
	sub  r6, r5, r4
	ldr r4, [fp, #-48]
	sub  r5, r6, r4
	ldr r4, [fp, #-44]
	sub  r6, r5, r4
	ldr r4, [fp, #-40]
	add  r5, r4, r6
	ldr r4, [fp, #-36]
	add  r6, r4, r5
	ldr r4, [fp, #-32]
	add  r5, r4, r6
	ldr r4, [fp, #-28]
	add  r6, r4, r5
	ldr r4, [fp, #-24]
	add  r5, r4, r6
	ldr r4, [fp, #-20]
	add  r6, r4, r5
	ldr r4, [fp, #-16]
	add  r5, r4, r6
	ldr r4, [fp, #-12]
	add  r6, r4, r5
	ldr r4, [fp, #-8]
	add  r5, r4, r6
	ldr r4, [fp, #-4]
	add  r6, r4, r5
	mov r0, r6
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov fp, sp
	mov r4, #456
	add  r4, r4, #0
	sub  sp, sp, r4
.L404:
	ldr r4, =0
	str r4, [fp, #-128]
	ldr r4, =1
	str r4, [fp, #-124]
	ldr r4, =2
	str r4, [fp, #-120]
	ldr r4, =3
	str r4, [fp, #-116]
	ldr r4, =4
	str r4, [fp, #-112]
	ldr r4, =5
	str r4, [fp, #-108]
	ldr r4, =6
	str r4, [fp, #-104]
	ldr r4, =7
	str r4, [fp, #-100]
	ldr r4, =8
	str r4, [fp, #-96]
	ldr r4, =9
	str r4, [fp, #-92]
	ldr r4, =0
	str r4, [fp, #-88]
	ldr r4, =1
	str r4, [fp, #-84]
	ldr r4, =2
	str r4, [fp, #-80]
	ldr r4, =3
	str r4, [fp, #-76]
	ldr r4, =4
	str r4, [fp, #-72]
	ldr r4, =5
	str r4, [fp, #-68]
	ldr r4, =6
	str r4, [fp, #-64]
	ldr r4, =7
	str r4, [fp, #-60]
	ldr r4, =8
	str r4, [fp, #-56]
	ldr r4, =9
	str r4, [fp, #-52]
	ldr r4, =0
	str r4, [fp, #-48]
	ldr r4, =1
	str r4, [fp, #-44]
	ldr r4, =2
	str r4, [fp, #-40]
	ldr r4, =3
	str r4, [fp, #-36]
	ldr r4, =4
	str r4, [fp, #-32]
	ldr r4, =5
	str r4, [fp, #-28]
	ldr r4, =6
	str r4, [fp, #-24]
	ldr r4, =7
	str r4, [fp, #-20]
	ldr r4, =8
	str r4, [fp, #-16]
	ldr r4, =9
	str r4, [fp, #-12]
	ldr r4, =0
	str r4, [fp, #-8]
	ldr r4, =1
	str r4, [fp, #-4]
	ldr r4, [fp, #-128]
	ldr r5, [fp, #-124]
	ldr r6, [fp, #-120]
	ldr r7, [fp, #-116]
	ldr r8, [fp, #-112]
	ldr r9, [fp, #-108]
	ldr r10, [fp, #-104]
	str r10, [fp, #-448]
	ldr r10, [fp, #-100]
	str r10, [fp, #-308]
	mov r0, r4
	mov r1, r5
	mov r2, r6
	mov r3, r7
	mov r4, r8
	str r4, [sp, #-16]
	mov r4, r9
	str r4, [sp, #-12]
	ldr r4, [fp, #-448]
	mov r4, r4
	str r4, [sp, #-8]
	ldr r4, [fp, #-308]
	mov r4, r4
	str r4, [sp, #-4]
	sub  sp, sp, #16
	bl testParam8
	add  sp, sp, #16
	mov r4, r0
	ldr r5, [fp, #-124]
	ldr r6, [fp, #-120]
	ldr r7, [fp, #-116]
	ldr r8, [fp, #-112]
	ldr r9, [fp, #-108]
	ldr r10, [fp, #-104]
	str r10, [fp, #-452]
	ldr r10, [fp, #-100]
	str r10, [fp, #-312]
	ldr r10, [fp, #-96]
	str r10, [fp, #-316]
	ldr r10, [fp, #-92]
	str r10, [fp, #-320]
	ldr r10, [fp, #-88]
	str r10, [fp, #-324]
	ldr r10, [fp, #-84]
	str r10, [fp, #-328]
	ldr r10, [fp, #-80]
	str r10, [fp, #-332]
	ldr r10, [fp, #-76]
	str r10, [fp, #-336]
	ldr r10, [fp, #-72]
	str r10, [fp, #-340]
	ldr r10, [fp, #-68]
	str r10, [fp, #-344]
	mov r0, r4
	mov r1, r5
	mov r2, r6
	mov r3, r7
	mov r4, r8
	str r4, [sp, #-48]
	mov r4, r9
	str r4, [sp, #-44]
	ldr r4, [fp, #-452]
	mov r4, r4
	str r4, [sp, #-40]
	ldr r4, [fp, #-312]
	mov r4, r4
	str r4, [sp, #-36]
	ldr r4, [fp, #-316]
	mov r4, r4
	str r4, [sp, #-32]
	ldr r4, [fp, #-320]
	mov r4, r4
	str r4, [sp, #-28]
	ldr r4, [fp, #-324]
	mov r4, r4
	str r4, [sp, #-24]
	ldr r4, [fp, #-328]
	mov r4, r4
	str r4, [sp, #-20]
	ldr r4, [fp, #-332]
	mov r4, r4
	str r4, [sp, #-16]
	ldr r4, [fp, #-336]
	mov r4, r4
	str r4, [sp, #-12]
	ldr r4, [fp, #-340]
	mov r4, r4
	str r4, [sp, #-8]
	ldr r4, [fp, #-344]
	mov r4, r4
	str r4, [sp, #-4]
	sub  sp, sp, #48
	bl testParam16
	add  sp, sp, #48
	mov r4, r0
	ldr r5, [fp, #-124]
	ldr r6, [fp, #-120]
	ldr r7, [fp, #-116]
	ldr r8, [fp, #-112]
	ldr r9, [fp, #-108]
	ldr r10, [fp, #-104]
	str r10, [fp, #-456]
	ldr r10, [fp, #-100]
	str r10, [fp, #-348]
	ldr r10, [fp, #-96]
	str r10, [fp, #-352]
	ldr r10, [fp, #-92]
	str r10, [fp, #-356]
	ldr r10, [fp, #-88]
	str r10, [fp, #-360]
	ldr r10, [fp, #-84]
	str r10, [fp, #-364]
	ldr r10, [fp, #-80]
	str r10, [fp, #-368]
	ldr r10, [fp, #-76]
	str r10, [fp, #-372]
	ldr r10, [fp, #-72]
	str r10, [fp, #-376]
	ldr r10, [fp, #-68]
	str r10, [fp, #-380]
	ldr r10, [fp, #-64]
	str r10, [fp, #-384]
	ldr r10, [fp, #-60]
	str r10, [fp, #-388]
	ldr r10, [fp, #-56]
	str r10, [fp, #-392]
	ldr r10, [fp, #-52]
	str r10, [fp, #-396]
	ldr r10, [fp, #-48]
	str r10, [fp, #-400]
	ldr r10, [fp, #-44]
	str r10, [fp, #-404]
	ldr r10, [fp, #-40]
	str r10, [fp, #-408]
	ldr r10, [fp, #-36]
	str r10, [fp, #-412]
	ldr r10, [fp, #-32]
	str r10, [fp, #-416]
	ldr r10, [fp, #-28]
	str r10, [fp, #-420]
	ldr r10, [fp, #-24]
	str r10, [fp, #-424]
	ldr r10, [fp, #-20]
	str r10, [fp, #-428]
	ldr r10, [fp, #-16]
	str r10, [fp, #-432]
	ldr r10, [fp, #-12]
	str r10, [fp, #-436]
	ldr r10, [fp, #-8]
	str r10, [fp, #-440]
	ldr r10, [fp, #-4]
	str r10, [fp, #-444]
	mov r0, r4
	mov r1, r5
	mov r2, r6
	mov r3, r7
	mov r4, r8
	str r4, [sp, #-112]
	mov r4, r9
	str r4, [sp, #-108]
	ldr r4, [fp, #-456]
	mov r4, r4
	str r4, [sp, #-104]
	ldr r4, [fp, #-348]
	mov r4, r4
	str r4, [sp, #-100]
	ldr r4, [fp, #-352]
	mov r4, r4
	str r4, [sp, #-96]
	ldr r4, [fp, #-356]
	mov r4, r4
	str r4, [sp, #-92]
	ldr r4, [fp, #-360]
	mov r4, r4
	str r4, [sp, #-88]
	ldr r4, [fp, #-364]
	mov r4, r4
	str r4, [sp, #-84]
	ldr r4, [fp, #-368]
	mov r4, r4
	str r4, [sp, #-80]
	ldr r4, [fp, #-372]
	mov r4, r4
	str r4, [sp, #-76]
	ldr r4, [fp, #-376]
	mov r4, r4
	str r4, [sp, #-72]
	ldr r4, [fp, #-380]
	mov r4, r4
	str r4, [sp, #-68]
	ldr r4, [fp, #-384]
	mov r4, r4
	str r4, [sp, #-64]
	ldr r4, [fp, #-388]
	mov r4, r4
	str r4, [sp, #-60]
	ldr r4, [fp, #-392]
	mov r4, r4
	str r4, [sp, #-56]
	ldr r4, [fp, #-396]
	mov r4, r4
	str r4, [sp, #-52]
	ldr r4, [fp, #-400]
	mov r4, r4
	str r4, [sp, #-48]
	ldr r4, [fp, #-404]
	mov r4, r4
	str r4, [sp, #-44]
	ldr r4, [fp, #-408]
	mov r4, r4
	str r4, [sp, #-40]
	ldr r4, [fp, #-412]
	mov r4, r4
	str r4, [sp, #-36]
	ldr r4, [fp, #-416]
	mov r4, r4
	str r4, [sp, #-32]
	ldr r4, [fp, #-420]
	mov r4, r4
	str r4, [sp, #-28]
	ldr r4, [fp, #-424]
	mov r4, r4
	str r4, [sp, #-24]
	ldr r4, [fp, #-428]
	mov r4, r4
	str r4, [sp, #-20]
	ldr r4, [fp, #-432]
	mov r4, r4
	str r4, [sp, #-16]
	ldr r4, [fp, #-436]
	mov r4, r4
	str r4, [sp, #-12]
	ldr r4, [fp, #-440]
	mov r4, r4
	str r4, [sp, #-8]
	ldr r4, [fp, #-444]
	mov r4, r4
	str r4, [sp, #-4]
	sub  sp, sp, #112
	bl testParam32
	add  sp, sp, #112
	mov r4, r0
	str r4, [fp, #-128]
	ldr r4, [fp, #-128]
	mov r0, r4
	bl putint
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr

