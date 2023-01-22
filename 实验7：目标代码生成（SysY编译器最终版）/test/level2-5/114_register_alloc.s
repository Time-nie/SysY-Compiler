	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global a1
	.align 4
	.size a1, 4
a1:
	.word 1
	.global a2
	.align 4
	.size a2, 4
a2:
	.word 2
	.global a3
	.align 4
	.size a3, 4
a3:
	.word 3
	.global a4
	.align 4
	.size a4, 4
a4:
	.word 4
	.global a5
	.align 4
	.size a5, 4
a5:
	.word 5
	.global a6
	.align 4
	.size a6, 4
a6:
	.word 6
	.global a7
	.align 4
	.size a7, 4
a7:
	.word 7
	.global a8
	.align 4
	.size a8, 4
a8:
	.word 8
	.global a9
	.align 4
	.size a9, 4
a9:
	.word 9
	.global a10
	.align 4
	.size a10, 4
a10:
	.word 10
	.global a11
	.align 4
	.size a11, 4
a11:
	.word 11
	.global a12
	.align 4
	.size a12, 4
a12:
	.word 12
	.global a13
	.align 4
	.size a13, 4
a13:
	.word 13
	.global a14
	.align 4
	.size a14, 4
a14:
	.word 14
	.global a15
	.align 4
	.size a15, 4
a15:
	.word 15
	.global a16
	.align 4
	.size a16, 4
a16:
	.word 16
	.global a17
	.align 4
	.size a17, 4
a17:
	.word 1
	.global a18
	.align 4
	.size a18, 4
a18:
	.word 2
	.global a19
	.align 4
	.size a19, 4
a19:
	.word 3
	.global a20
	.align 4
	.size a20, 4
a20:
	.word 4
	.global a21
	.align 4
	.size a21, 4
a21:
	.word 5
	.global a22
	.align 4
	.size a22, 4
a22:
	.word 6
	.global a23
	.align 4
	.size a23, 4
a23:
	.word 7
	.global a24
	.align 4
	.size a24, 4
a24:
	.word 8
	.global a25
	.align 4
	.size a25, 4
a25:
	.word 9
	.global a26
	.align 4
	.size a26, 4
a26:
	.word 10
	.global a27
	.align 4
	.size a27, 4
a27:
	.word 11
	.global a28
	.align 4
	.size a28, 4
a28:
	.word 12
	.global a29
	.align 4
	.size a29, 4
a29:
	.word 13
	.global a30
	.align 4
	.size a30, 4
a30:
	.word 14
	.global a31
	.align 4
	.size a31, 4
a31:
	.word 15
	.global a32
	.align 4
	.size a32, 4
a32:
	.word 16
	.text
	.global func
	.type func , %function
func:
	push {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov fp, sp
	ldr r4, =280
	sub  sp, sp, r4
.L580:
	str r0, [fp, #-156]
	str r1, [fp, #-152]
	ldr r4, [fp, #-152]
	ldr r5, [fp, #-156]
	add  r6, r5, r4
	str r6, [fp, #-148]
	bl getint
	mov r4, r0
	str r4, [fp, #-144]
	bl getint
	mov r4, r0
	str r4, [fp, #-140]
	bl getint
	mov r4, r0
	str r4, [fp, #-136]
	bl getint
	mov r4, r0
	str r4, [fp, #-132]
	ldr r4, addr_a1
	ldr r5, [r4]
	ldr r4, [fp, #-144]
	ldr r6, =1
	add  r7, r6, r4
	add  r4, r7, r5
	str r4, [fp, #-128]
	ldr r4, addr_a2
	ldr r5, [r4]
	ldr r4, [fp, #-140]
	ldr r6, =2
	add  r7, r6, r4
	add  r4, r7, r5
	str r4, [fp, #-124]
	ldr r4, addr_a3
	ldr r5, [r4]
	ldr r4, [fp, #-136]
	ldr r6, =3
	add  r7, r6, r4
	add  r4, r7, r5
	str r4, [fp, #-120]
	ldr r4, addr_a4
	ldr r5, [r4]
	ldr r4, [fp, #-132]
	ldr r6, =4
	add  r7, r6, r4
	add  r4, r7, r5
	str r4, [fp, #-116]
	ldr r4, addr_a5
	ldr r5, [r4]
	ldr r4, [fp, #-128]
	ldr r6, =1
	add  r7, r6, r4
	add  r4, r7, r5
	str r4, [fp, #-112]
	ldr r4, addr_a6
	ldr r5, [r4]
	ldr r4, [fp, #-124]
	ldr r6, =2
	add  r7, r6, r4
	add  r4, r7, r5
	str r4, [fp, #-108]
	ldr r4, addr_a7
	ldr r5, [r4]
	ldr r4, [fp, #-120]
	ldr r6, =3
	add  r7, r6, r4
	add  r4, r7, r5
	str r4, [fp, #-104]
	ldr r4, addr_a8
	ldr r5, [r4]
	ldr r4, [fp, #-116]
	ldr r6, =4
	add  r7, r6, r4
	add  r4, r7, r5
	str r4, [fp, #-100]
	ldr r4, addr_a9
	ldr r5, [r4]
	ldr r4, [fp, #-112]
	ldr r6, =1
	add  r7, r6, r4
	add  r4, r7, r5
	str r4, [fp, #-96]
	ldr r4, addr_a10
	ldr r5, [r4]
	ldr r4, [fp, #-108]
	ldr r6, =2
	add  r7, r6, r4
	add  r4, r7, r5
	str r4, [fp, #-92]
	ldr r4, addr_a11
	ldr r5, [r4]
	ldr r4, [fp, #-104]
	ldr r6, =3
	add  r7, r6, r4
	add  r4, r7, r5
	str r4, [fp, #-88]
	ldr r4, addr_a12
	ldr r5, [r4]
	ldr r4, [fp, #-100]
	ldr r6, =4
	add  r7, r6, r4
	add  r4, r7, r5
	str r4, [fp, #-84]
	ldr r4, addr_a13
	ldr r5, [r4]
	ldr r4, [fp, #-96]
	ldr r6, =1
	add  r7, r6, r4
	add  r4, r7, r5
	str r4, [fp, #-80]
	ldr r4, addr_a14
	ldr r5, [r4]
	ldr r4, [fp, #-92]
	ldr r6, =2
	add  r7, r6, r4
	add  r4, r7, r5
	str r4, [fp, #-76]
	ldr r4, addr_a15
	ldr r5, [r4]
	ldr r4, [fp, #-88]
	ldr r6, =3
	add  r7, r6, r4
	add  r4, r7, r5
	str r4, [fp, #-72]
	ldr r4, addr_a16
	ldr r5, [r4]
	ldr r4, [fp, #-84]
	ldr r6, =4
	add  r7, r6, r4
	add  r4, r7, r5
	str r4, [fp, #-68]
	ldr r4, addr_a17
	ldr r5, [r4]
	ldr r4, [fp, #-80]
	ldr r6, =1
	add  r7, r6, r4
	add  r4, r7, r5
	str r4, [fp, #-64]
	ldr r4, addr_a18
	ldr r5, [r4]
	ldr r4, [fp, #-76]
	ldr r6, =2
	add  r7, r6, r4
	add  r4, r7, r5
	str r4, [fp, #-60]
	ldr r4, addr_a19
	ldr r5, [r4]
	ldr r4, [fp, #-72]
	ldr r6, =3
	add  r7, r6, r4
	add  r4, r7, r5
	str r4, [fp, #-56]
	ldr r4, addr_a20
	ldr r5, [r4]
	ldr r4, [fp, #-68]
	ldr r6, =4
	add  r7, r6, r4
	add  r4, r7, r5
	str r4, [fp, #-52]
	ldr r4, addr_a21
	ldr r5, [r4]
	ldr r4, [fp, #-64]
	ldr r6, =1
	add  r7, r6, r4
	add  r4, r7, r5
	str r4, [fp, #-48]
	ldr r4, addr_a22
	ldr r5, [r4]
	ldr r4, [fp, #-60]
	ldr r6, =2
	add  r7, r6, r4
	add  r4, r7, r5
	str r4, [fp, #-44]
	ldr r4, addr_a23
	ldr r5, [r4]
	ldr r4, [fp, #-56]
	ldr r6, =3
	add  r7, r6, r4
	add  r4, r7, r5
	str r4, [fp, #-40]
	ldr r4, addr_a24
	ldr r5, [r4]
	ldr r4, [fp, #-52]
	ldr r6, =4
	add  r7, r6, r4
	add  r4, r7, r5
	str r4, [fp, #-36]
	ldr r4, addr_a25
	ldr r5, [r4]
	ldr r4, [fp, #-48]
	ldr r6, =1
	add  r7, r6, r4
	add  r4, r7, r5
	str r4, [fp, #-32]
	ldr r4, addr_a26
	ldr r5, [r4]
	ldr r4, [fp, #-44]
	ldr r6, =2
	add  r7, r6, r4
	add  r4, r7, r5
	str r4, [fp, #-28]
	ldr r4, addr_a27
	ldr r5, [r4]
	ldr r4, [fp, #-40]
	ldr r6, =3
	add  r7, r6, r4
	add  r4, r7, r5
	str r4, [fp, #-24]
	ldr r4, addr_a28
	ldr r5, [r4]
	ldr r4, [fp, #-36]
	ldr r6, =4
	add  r7, r6, r4
	add  r4, r7, r5
	str r4, [fp, #-20]
	ldr r4, addr_a29
	ldr r5, [r4]
	ldr r4, [fp, #-32]
	ldr r6, =1
	add  r7, r6, r4
	add  r4, r7, r5
	str r4, [fp, #-16]
	ldr r4, addr_a30
	ldr r5, [r4]
	ldr r4, [fp, #-28]
	ldr r6, =2
	add  r7, r6, r4
	add  r4, r7, r5
	str r4, [fp, #-12]
	ldr r4, addr_a31
	ldr r5, [r4]
	ldr r4, [fp, #-24]
	ldr r6, =3
	add  r7, r6, r4
	add  r4, r7, r5
	str r4, [fp, #-8]
	ldr r4, addr_a32
	ldr r5, [r4]
	ldr r4, [fp, #-20]
	ldr r6, =4
	add  r7, r6, r4
	add  r4, r7, r5
	str r4, [fp, #-4]
	ldr r4, [fp, #-156]
	ldr r5, [fp, #-152]
	sub  r6, r4, r5
	add  r4, r6, #10
	str r4, [fp, #-148]
	ldr r4, addr_a29
	ldr r5, [r4]
	ldr r4, [fp, #-32]
	ldr r6, =1
	add  r7, r6, r4
	add  r4, r7, r5
	str r4, [fp, #-16]
	ldr r4, addr_a30
	ldr r5, [r4]
	ldr r4, [fp, #-28]
	ldr r6, =2
	add  r7, r6, r4
	add  r4, r7, r5
	str r4, [fp, #-12]
	ldr r4, addr_a31
	ldr r5, [r4]
	ldr r4, [fp, #-24]
	ldr r6, =3
	add  r7, r6, r4
	add  r4, r7, r5
	str r4, [fp, #-8]
	ldr r4, addr_a32
	ldr r5, [r4]
	ldr r4, [fp, #-20]
	ldr r6, =4
	add  r7, r6, r4
	add  r4, r7, r5
	str r4, [fp, #-4]
	ldr r4, addr_a25
	ldr r5, [r4]
	ldr r4, [fp, #-48]
	ldr r6, =1
	add  r7, r6, r4
	add  r4, r7, r5
	str r4, [fp, #-32]
	ldr r4, addr_a26
	ldr r5, [r4]
	ldr r4, [fp, #-44]
	ldr r6, =2
	add  r7, r6, r4
	add  r4, r7, r5
	str r4, [fp, #-28]
	ldr r4, addr_a27
	ldr r5, [r4]
	ldr r4, [fp, #-40]
	ldr r6, =3
	add  r7, r6, r4
	add  r4, r7, r5
	str r4, [fp, #-24]
	ldr r4, addr_a28
	ldr r5, [r4]
	ldr r4, [fp, #-36]
	ldr r6, =4
	add  r7, r6, r4
	add  r4, r7, r5
	str r4, [fp, #-20]
	ldr r4, addr_a21
	ldr r5, [r4]
	ldr r4, [fp, #-64]
	ldr r6, =1
	add  r7, r6, r4
	add  r4, r7, r5
	str r4, [fp, #-48]
	ldr r4, addr_a22
	ldr r5, [r4]
	ldr r4, [fp, #-60]
	ldr r6, =2
	add  r7, r6, r4
	add  r4, r7, r5
	str r4, [fp, #-44]
	ldr r4, addr_a23
	ldr r5, [r4]
	ldr r4, [fp, #-56]
	ldr r6, =3
	add  r7, r6, r4
	add  r4, r7, r5
	str r4, [fp, #-40]
	ldr r4, addr_a24
	ldr r5, [r4]
	ldr r4, [fp, #-52]
	ldr r6, =4
	add  r7, r6, r4
	add  r4, r7, r5
	str r4, [fp, #-36]
	ldr r4, addr_a17
	ldr r5, [r4]
	ldr r4, [fp, #-80]
	ldr r6, =1
	add  r7, r6, r4
	add  r4, r7, r5
	str r4, [fp, #-64]
	ldr r4, addr_a18
	ldr r5, [r4]
	ldr r4, [fp, #-76]
	ldr r6, =2
	add  r7, r6, r4
	add  r4, r7, r5
	str r4, [fp, #-60]
	ldr r4, addr_a19
	ldr r5, [r4]
	ldr r4, [fp, #-72]
	ldr r6, =3
	add  r7, r6, r4
	add  r4, r7, r5
	str r4, [fp, #-56]
	ldr r4, addr_a20
	ldr r5, [r4]
	ldr r4, [fp, #-68]
	ldr r6, =4
	add  r7, r6, r4
	add  r4, r7, r5
	str r4, [fp, #-52]
	ldr r4, addr_a13
	ldr r5, [r4]
	ldr r4, [fp, #-96]
	ldr r6, =1
	add  r7, r6, r4
	add  r4, r7, r5
	str r4, [fp, #-80]
	ldr r4, addr_a14
	ldr r5, [r4]
	ldr r4, [fp, #-92]
	ldr r6, =2
	add  r7, r6, r4
	add  r4, r7, r5
	str r4, [fp, #-76]
	ldr r4, addr_a15
	ldr r5, [r4]
	ldr r4, [fp, #-88]
	ldr r6, =3
	add  r7, r6, r4
	add  r4, r7, r5
	str r4, [fp, #-72]
	ldr r4, addr_a16
	ldr r5, [r4]
	ldr r4, [fp, #-84]
	ldr r6, =4
	add  r7, r6, r4
	add  r4, r7, r5
	str r4, [fp, #-68]
	ldr r4, addr_a9
	ldr r5, [r4]
	ldr r4, [fp, #-112]
	ldr r6, =1
	add  r7, r6, r4
	add  r4, r7, r5
	str r4, [fp, #-96]
	ldr r4, addr_a10
	ldr r5, [r4]
	ldr r4, [fp, #-108]
	ldr r6, =2
	add  r7, r6, r4
	add  r4, r7, r5
	str r4, [fp, #-92]
	ldr r4, addr_a11
	ldr r5, [r4]
	ldr r4, [fp, #-104]
	ldr r6, =3
	add  r7, r6, r4
	add  r4, r7, r5
	str r4, [fp, #-88]
	ldr r4, addr_a12
	ldr r5, [r4]
	ldr r4, [fp, #-100]
	ldr r6, =4
	add  r7, r6, r4
	add  r4, r7, r5
	str r4, [fp, #-84]
	ldr r4, addr_a5
	ldr r5, [r4]
	ldr r4, [fp, #-128]
	ldr r6, =1
	add  r7, r6, r4
	add  r4, r7, r5
	str r4, [fp, #-112]
	ldr r4, addr_a6
	ldr r5, [r4]
	ldr r4, [fp, #-124]
	ldr r6, =2
	add  r7, r6, r4
	add  r4, r7, r5
	str r4, [fp, #-108]
	ldr r4, addr_a7
	ldr r5, [r4]
	ldr r4, [fp, #-120]
	ldr r6, =3
	add  r7, r6, r4
	add  r4, r7, r5
	str r4, [fp, #-104]
	ldr r4, addr_a8
	ldr r5, [r4]
	ldr r4, [fp, #-116]
	ldr r6, =4
	add  r7, r6, r4
	add  r4, r7, r5
	str r4, [fp, #-100]
	ldr r4, addr_a1
	ldr r5, [r4]
	ldr r4, [fp, #-144]
	ldr r6, =1
	add  r7, r6, r4
	add  r4, r7, r5
	str r4, [fp, #-128]
	ldr r4, addr_a2
	ldr r5, [r4]
	ldr r4, [fp, #-140]
	ldr r6, =2
	add  r7, r6, r4
	add  r4, r7, r5
	str r4, [fp, #-124]
	ldr r4, addr_a3
	ldr r5, [r4]
	ldr r4, [fp, #-136]
	ldr r6, =3
	add  r7, r6, r4
	add  r4, r7, r5
	str r4, [fp, #-120]
	ldr r4, addr_a4
	ldr r5, [r4]
	ldr r4, [fp, #-132]
	ldr r6, =4
	add  r7, r6, r4
	add  r4, r7, r5
	str r4, [fp, #-116]
	ldr r4, addr_a1
	ldr r5, [r4]
	ldr r4, [fp, #-144]
	ldr r6, =1
	add  r7, r6, r4
	add  r4, r7, r5
	str r4, [fp, #-128]
	ldr r4, addr_a2
	ldr r5, [r4]
	ldr r4, [fp, #-140]
	ldr r6, =2
	add  r7, r6, r4
	add  r4, r7, r5
	str r4, [fp, #-124]
	ldr r4, addr_a3
	ldr r5, [r4]
	ldr r4, [fp, #-136]
	ldr r6, =3
	add  r7, r6, r4
	add  r4, r7, r5
	str r4, [fp, #-120]
	ldr r4, addr_a4
	ldr r5, [r4]
	ldr r4, [fp, #-132]
	ldr r6, =4
	add  r7, r6, r4
	add  r4, r7, r5
	str r4, [fp, #-116]
	ldr r4, addr_a31
	ldr r5, [r4]
	str r5, [fp, #-160]
	ldr r4, addr_a29
	ldr r5, [r4]
	str r5, [fp, #-164]
	ldr r4, addr_a27
	ldr r5, [r4]
	str r5, [fp, #-168]
	ldr r4, addr_a25
	ldr r5, [r4]
	str r5, [fp, #-172]
	ldr r4, addr_a23
	ldr r5, [r4]
	str r5, [fp, #-176]
	ldr r4, addr_a21
	ldr r5, [r4]
	str r5, [fp, #-180]
	ldr r4, addr_a19
	ldr r5, [r4]
	str r5, [fp, #-184]
	ldr r4, addr_a17
	ldr r5, [r4]
	str r5, [fp, #-188]
	ldr r4, addr_a15
	ldr r5, [r4]
	str r5, [fp, #-192]
	ldr r4, addr_a13
	ldr r5, [r4]
	str r5, [fp, #-196]
	ldr r4, addr_a11
	ldr r5, [r4]
	str r5, [fp, #-200]
	ldr r4, addr_a9
	ldr r5, [r4]
	str r5, [fp, #-204]
	ldr r4, addr_a7
	ldr r5, [r4]
	str r5, [fp, #-208]
	ldr r4, addr_a5
	ldr r5, [r4]
	str r5, [fp, #-212]
	ldr r4, addr_a3
	ldr r5, [r4]
	str r5, [fp, #-216]
	ldr r4, addr_a1
	ldr r5, [r4]
	str r5, [fp, #-220]
	ldr r4, [fp, #-4]
	str r4, [fp, #-224]
	ldr r4, [fp, #-8]
	str r4, [fp, #-228]
	ldr r4, [fp, #-12]
	str r4, [fp, #-232]
	ldr r4, [fp, #-16]
	str r4, [fp, #-236]
	ldr r4, [fp, #-36]
	str r4, [fp, #-240]
	ldr r4, [fp, #-40]
	str r4, [fp, #-244]
	ldr r4, [fp, #-44]
	str r4, [fp, #-248]
	ldr r4, [fp, #-48]
	str r4, [fp, #-252]
	ldr r4, [fp, #-68]
	str r4, [fp, #-256]
	ldr r4, [fp, #-72]
	str r4, [fp, #-260]
	ldr r4, [fp, #-76]
	str r4, [fp, #-264]
	ldr r4, [fp, #-80]
	str r4, [fp, #-268]
	ldr r4, [fp, #-100]
	str r4, [fp, #-272]
	ldr r4, [fp, #-104]
	str r4, [fp, #-276]
	ldr r4, [fp, #-108]
	str r4, [fp, #-280]
	ldr r4, [fp, #-112]
	ldr r5, [fp, #-132]
	ldr r6, [fp, #-136]
	ldr r7, [fp, #-140]
	ldr r8, [fp, #-144]
	ldr r9, [fp, #-148]
	add  r10, r9, r8
	add  r8, r10, r7
	add  r7, r8, r6
	add  r6, r7, r5
	ldr r5, [fp, #-128]
	sub  r7, r6, r5
	ldr r5, [fp, #-124]
	sub  r6, r7, r5
	ldr r5, [fp, #-120]
	sub  r7, r6, r5
	ldr r5, [fp, #-116]
	sub  r6, r7, r5
	add  r5, r6, r4
	ldr r4, [fp, #-280]
	add  r6, r5, r4
	ldr r4, [fp, #-276]
	add  r5, r6, r4
	ldr r4, [fp, #-272]
	add  r6, r5, r4
	ldr r4, [fp, #-96]
	sub  r5, r6, r4
	ldr r4, [fp, #-92]
	sub  r6, r5, r4
	ldr r4, [fp, #-88]
	sub  r5, r6, r4
	ldr r4, [fp, #-84]
	sub  r6, r5, r4
	ldr r4, [fp, #-268]
	add  r5, r6, r4
	ldr r4, [fp, #-264]
	add  r6, r5, r4
	ldr r4, [fp, #-260]
	add  r5, r6, r4
	ldr r4, [fp, #-256]
	add  r6, r5, r4
	ldr r4, [fp, #-64]
	sub  r5, r6, r4
	ldr r4, [fp, #-60]
	sub  r6, r5, r4
	ldr r4, [fp, #-56]
	sub  r5, r6, r4
	ldr r4, [fp, #-52]
	sub  r6, r5, r4
	ldr r4, [fp, #-252]
	add  r5, r6, r4
	ldr r4, [fp, #-248]
	add  r6, r5, r4
	ldr r4, [fp, #-244]
	add  r5, r6, r4
	ldr r4, [fp, #-240]
	add  r6, r5, r4
	ldr r4, [fp, #-32]
	sub  r5, r6, r4
	ldr r4, [fp, #-28]
	sub  r6, r5, r4
	ldr r4, [fp, #-24]
	sub  r5, r6, r4
	ldr r4, [fp, #-20]
	sub  r6, r5, r4
	ldr r4, [fp, #-236]
	add  r5, r6, r4
	ldr r4, [fp, #-232]
	add  r6, r5, r4
	ldr r4, [fp, #-228]
	add  r5, r6, r4
	ldr r4, [fp, #-224]
	add  r6, r5, r4
	ldr r4, [fp, #-220]
	add  r5, r6, r4
	ldr r4, addr_a2
	ldr r6, [r4]
	sub  r4, r5, r6
	ldr r5, [fp, #-216]
	add  r6, r4, r5
	ldr r4, addr_a4
	ldr r5, [r4]
	sub  r4, r6, r5
	ldr r5, [fp, #-212]
	add  r6, r4, r5
	ldr r4, addr_a6
	ldr r5, [r4]
	sub  r4, r6, r5
	ldr r5, [fp, #-208]
	add  r6, r4, r5
	ldr r4, addr_a8
	ldr r5, [r4]
	sub  r4, r6, r5
	ldr r5, [fp, #-204]
	add  r6, r4, r5
	ldr r4, addr_a10
	ldr r5, [r4]
	sub  r4, r6, r5
	ldr r5, [fp, #-200]
	add  r6, r4, r5
	ldr r4, addr_a12
	ldr r5, [r4]
	sub  r4, r6, r5
	ldr r5, [fp, #-196]
	add  r6, r4, r5
	ldr r4, addr_a14
	ldr r5, [r4]
	sub  r4, r6, r5
	ldr r5, [fp, #-192]
	add  r6, r4, r5
	ldr r4, addr_a16
	ldr r5, [r4]
	sub  r4, r6, r5
	ldr r5, [fp, #-188]
	add  r6, r4, r5
	ldr r4, addr_a18
	ldr r5, [r4]
	sub  r4, r6, r5
	ldr r5, [fp, #-184]
	add  r6, r4, r5
	ldr r4, addr_a20
	ldr r5, [r4]
	sub  r4, r6, r5
	ldr r5, [fp, #-180]
	add  r6, r4, r5
	ldr r4, addr_a22
	ldr r5, [r4]
	sub  r4, r6, r5
	ldr r5, [fp, #-176]
	add  r6, r4, r5
	ldr r4, addr_a24
	ldr r5, [r4]
	sub  r4, r6, r5
	ldr r5, [fp, #-172]
	add  r6, r4, r5
	ldr r4, addr_a26
	ldr r5, [r4]
	sub  r4, r6, r5
	ldr r5, [fp, #-168]
	add  r6, r4, r5
	ldr r4, addr_a28
	ldr r5, [r4]
	sub  r4, r6, r5
	ldr r5, [fp, #-164]
	add  r6, r4, r5
	ldr r4, addr_a30
	ldr r5, [r4]
	sub  r4, r6, r5
	ldr r5, [fp, #-160]
	add  r6, r4, r5
	ldr r4, addr_a32
	ldr r5, [r4]
	sub  r4, r6, r5
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr

	.global main
	.type main , %function
main:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub  sp, sp, #8
.L622:
	bl getint
	mov r4, r0
	str r4, [fp, #-8]
	ldr r4, =9
	ldr r5, =2
	mul  r6, r4, r5
	ldr r4, [fp, #-8]
	add  r5, r4, r6
	str r5, [fp, #-4]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	mov r0, r4
	mov r1, r5
	bl func
	mov r4, r0
	str r4, [fp, #-8]
	ldr r4, [fp, #-8]
	mov r0, r4
	bl putint
	ldr r4, [fp, #-8]
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, fp, lr}
	bx lr

addr_a1:
	.word a1
addr_a2:
	.word a2
addr_a3:
	.word a3
addr_a4:
	.word a4
addr_a5:
	.word a5
addr_a6:
	.word a6
addr_a7:
	.word a7
addr_a8:
	.word a8
addr_a9:
	.word a9
addr_a10:
	.word a10
addr_a11:
	.word a11
addr_a12:
	.word a12
addr_a13:
	.word a13
addr_a14:
	.word a14
addr_a15:
	.word a15
addr_a16:
	.word a16
addr_a17:
	.word a17
addr_a18:
	.word a18
addr_a19:
	.word a19
addr_a20:
	.word a20
addr_a21:
	.word a21
addr_a22:
	.word a22
addr_a23:
	.word a23
addr_a24:
	.word a24
addr_a25:
	.word a25
addr_a26:
	.word a26
addr_a27:
	.word a27
addr_a28:
	.word a28
addr_a29:
	.word a29
addr_a30:
	.word a30
addr_a31:
	.word a31
addr_a32:
	.word a32
