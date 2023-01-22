	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global a0
	.align 4
	.size a0, 4
a0:
	.word 0
	.global a1
	.align 4
	.size a1, 4
a1:
	.word 0
	.global a2
	.align 4
	.size a2, 4
a2:
	.word 0
	.global a3
	.align 4
	.size a3, 4
a3:
	.word 0
	.global a4
	.align 4
	.size a4, 4
a4:
	.word 0
	.global a5
	.align 4
	.size a5, 4
a5:
	.word 0
	.global a6
	.align 4
	.size a6, 4
a6:
	.word 0
	.global a7
	.align 4
	.size a7, 4
a7:
	.word 0
	.global a8
	.align 4
	.size a8, 4
a8:
	.word 0
	.global a9
	.align 4
	.size a9, 4
a9:
	.word 0
	.global a10
	.align 4
	.size a10, 4
a10:
	.word 0
	.global a11
	.align 4
	.size a11, 4
a11:
	.word 0
	.global a12
	.align 4
	.size a12, 4
a12:
	.word 0
	.global a13
	.align 4
	.size a13, 4
a13:
	.word 0
	.global a14
	.align 4
	.size a14, 4
a14:
	.word 0
	.global a15
	.align 4
	.size a15, 4
a15:
	.word 0
	.global a16
	.align 4
	.size a16, 4
a16:
	.word 0
	.global a17
	.align 4
	.size a17, 4
a17:
	.word 0
	.global a18
	.align 4
	.size a18, 4
a18:
	.word 0
	.global a19
	.align 4
	.size a19, 4
a19:
	.word 0
	.global a20
	.align 4
	.size a20, 4
a20:
	.word 0
	.global a21
	.align 4
	.size a21, 4
a21:
	.word 0
	.global a22
	.align 4
	.size a22, 4
a22:
	.word 0
	.global a23
	.align 4
	.size a23, 4
a23:
	.word 0
	.global a24
	.align 4
	.size a24, 4
a24:
	.word 0
	.global a25
	.align 4
	.size a25, 4
a25:
	.word 0
	.global a26
	.align 4
	.size a26, 4
a26:
	.word 0
	.global a27
	.align 4
	.size a27, 4
a27:
	.word 0
	.global a28
	.align 4
	.size a28, 4
a28:
	.word 0
	.global a29
	.align 4
	.size a29, 4
a29:
	.word 0
	.global a30
	.align 4
	.size a30, 4
a30:
	.word 0
	.global a31
	.align 4
	.size a31, 4
a31:
	.word 0
	.global a32
	.align 4
	.size a32, 4
a32:
	.word 0
	.global a33
	.align 4
	.size a33, 4
a33:
	.word 0
	.global a34
	.align 4
	.size a34, 4
a34:
	.word 0
	.global a35
	.align 4
	.size a35, 4
a35:
	.word 0
	.global a36
	.align 4
	.size a36, 4
a36:
	.word 0
	.global a37
	.align 4
	.size a37, 4
a37:
	.word 0
	.global a38
	.align 4
	.size a38, 4
a38:
	.word 0
	.global a39
	.align 4
	.size a39, 4
a39:
	.word 0
	.text
	.global testParam8
	.type testParam8 , %function
testParam8:
	push {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov fp, sp
	sub  sp, sp, #40
.L311:
	str r0, [fp, #-32]
	str r1, [fp, #-28]
	str r2, [fp, #-24]
	str r3, [fp, #-20]
	ldr r4, [fp, #36]
	str r4, [fp, #-16]
	ldr r4, [fp, #40]
	str r4, [fp, #-12]
	ldr r4, [fp, #44]
	str r4, [fp, #-8]
	ldr r4, [fp, #48]
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	str r4, [fp, #-36]
	ldr r4, [fp, #-8]
	str r4, [fp, #-40]
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-16]
	ldr r6, [fp, #-20]
	ldr r7, [fp, #-24]
	ldr r8, [fp, #-28]
	ldr r9, [fp, #-32]
	add  r10, r9, r8
	add  r8, r10, r7
	add  r7, r8, r6
	add  r6, r7, r5
	add  r5, r6, r4
	ldr r4, [fp, #-40]
	add  r6, r5, r4
	ldr r4, [fp, #-36]
	add  r5, r6, r4
	mov r0, r5
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr

	.global testParam16
	.type testParam16 , %function
testParam16:
	push {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov fp, sp
	sub  sp, sp, #84
.L328:
	str r0, [fp, #-64]
	str r1, [fp, #-60]
	str r2, [fp, #-56]
	str r3, [fp, #-52]
	ldr r4, [fp, #36]
	str r4, [fp, #-48]
	ldr r4, [fp, #40]
	str r4, [fp, #-44]
	ldr r4, [fp, #44]
	str r4, [fp, #-40]
	ldr r4, [fp, #48]
	str r4, [fp, #-36]
	ldr r4, [fp, #52]
	str r4, [fp, #-32]
	ldr r4, [fp, #56]
	str r4, [fp, #-28]
	ldr r4, [fp, #60]
	str r4, [fp, #-24]
	ldr r4, [fp, #64]
	str r4, [fp, #-20]
	ldr r4, [fp, #68]
	str r4, [fp, #-16]
	ldr r4, [fp, #72]
	str r4, [fp, #-12]
	ldr r4, [fp, #76]
	str r4, [fp, #-8]
	ldr r4, [fp, #80]
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	str r4, [fp, #-68]
	ldr r4, [fp, #-8]
	str r4, [fp, #-72]
	ldr r4, [fp, #-12]
	str r4, [fp, #-76]
	ldr r4, [fp, #-16]
	str r4, [fp, #-80]
	ldr r4, [fp, #-20]
	str r4, [fp, #-84]
	ldr r4, [fp, #-24]
	ldr r5, [fp, #-28]
	ldr r6, [fp, #-32]
	ldr r7, [fp, #-56]
	ldr r8, [fp, #-60]
	ldr r9, [fp, #-64]
	add  r10, r9, r8
	add  r8, r10, r7
	ldr r7, [fp, #-52]
	sub  r9, r8, r7
	ldr r7, [fp, #-48]
	sub  r8, r9, r7
	ldr r7, [fp, #-44]
	sub  r9, r8, r7
	ldr r7, [fp, #-40]
	sub  r8, r9, r7
	ldr r7, [fp, #-36]
	sub  r9, r8, r7
	add  r7, r9, r6
	add  r6, r7, r5
	add  r5, r6, r4
	ldr r4, [fp, #-84]
	add  r6, r5, r4
	ldr r4, [fp, #-80]
	add  r5, r6, r4
	ldr r4, [fp, #-76]
	add  r6, r5, r4
	ldr r4, [fp, #-72]
	add  r5, r6, r4
	ldr r4, [fp, #-68]
	add  r6, r5, r4
	mov r0, r6
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr

	.global testParam32
	.type testParam32 , %function
testParam32:
	push {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov fp, sp
	sub  sp, sp, #212
.L361:
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
	ldr r4, [fp, #-4]
	str r4, [fp, #-132]
	ldr r4, [fp, #-8]
	str r4, [fp, #-136]
	ldr r4, [fp, #-12]
	str r4, [fp, #-140]
	ldr r4, [fp, #-16]
	str r4, [fp, #-144]
	ldr r4, [fp, #-20]
	str r4, [fp, #-148]
	ldr r4, [fp, #-24]
	str r4, [fp, #-152]
	ldr r4, [fp, #-28]
	str r4, [fp, #-156]
	ldr r4, [fp, #-32]
	str r4, [fp, #-160]
	ldr r4, [fp, #-36]
	str r4, [fp, #-164]
	ldr r4, [fp, #-60]
	str r4, [fp, #-168]
	ldr r4, [fp, #-64]
	str r4, [fp, #-172]
	ldr r4, [fp, #-68]
	str r4, [fp, #-176]
	ldr r4, [fp, #-72]
	str r4, [fp, #-180]
	ldr r4, [fp, #-76]
	str r4, [fp, #-184]
	ldr r4, [fp, #-80]
	str r4, [fp, #-188]
	ldr r4, [fp, #-84]
	str r4, [fp, #-192]
	ldr r4, [fp, #-88]
	str r4, [fp, #-196]
	ldr r4, [fp, #-92]
	str r4, [fp, #-200]
	ldr r4, [fp, #-96]
	str r4, [fp, #-204]
	ldr r4, [fp, #-100]
	str r4, [fp, #-208]
	ldr r4, [fp, #-104]
	str r4, [fp, #-212]
	ldr r4, [fp, #-108]
	ldr r5, [fp, #-112]
	ldr r6, [fp, #-116]
	ldr r7, [fp, #-120]
	ldr r8, [fp, #-124]
	ldr r9, [fp, #-128]
	add  r10, r9, r8
	add  r8, r10, r7
	add  r7, r8, r6
	add  r6, r7, r5
	add  r5, r6, r4
	ldr r4, [fp, #-212]
	add  r6, r5, r4
	ldr r4, [fp, #-208]
	add  r5, r6, r4
	ldr r4, [fp, #-204]
	add  r6, r5, r4
	ldr r4, [fp, #-200]
	add  r5, r6, r4
	ldr r4, [fp, #-196]
	add  r6, r5, r4
	ldr r4, [fp, #-192]
	add  r5, r6, r4
	ldr r4, [fp, #-188]
	add  r6, r5, r4
	ldr r4, [fp, #-184]
	add  r5, r6, r4
	ldr r4, [fp, #-180]
	add  r6, r5, r4
	ldr r4, [fp, #-176]
	add  r5, r6, r4
	ldr r4, [fp, #-172]
	add  r6, r5, r4
	ldr r4, [fp, #-168]
	add  r5, r6, r4
	ldr r4, [fp, #-56]
	sub  r6, r5, r4
	ldr r4, [fp, #-52]
	sub  r5, r6, r4
	ldr r4, [fp, #-48]
	sub  r6, r5, r4
	ldr r4, [fp, #-44]
	sub  r5, r6, r4
	ldr r4, [fp, #-40]
	sub  r6, r5, r4
	ldr r4, [fp, #-164]
	add  r5, r6, r4
	ldr r4, [fp, #-160]
	add  r6, r5, r4
	ldr r4, [fp, #-156]
	add  r5, r6, r4
	ldr r4, [fp, #-152]
	add  r6, r5, r4
	ldr r4, [fp, #-148]
	add  r5, r6, r4
	ldr r4, [fp, #-144]
	add  r6, r5, r4
	ldr r4, [fp, #-140]
	add  r5, r6, r4
	ldr r4, [fp, #-136]
	add  r6, r5, r4
	ldr r4, [fp, #-132]
	add  r5, r6, r4
	mov r0, r5
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr

	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov fp, sp
	ldr r4, =340
	sub  sp, sp, r4
.L426:
	ldr r4, =0
	ldr r5, addr_a0
	str r4, [r5]
	ldr r4, =1
	ldr r5, addr_a1
	str r4, [r5]
	ldr r4, =2
	ldr r5, addr_a2
	str r4, [r5]
	ldr r4, =3
	ldr r5, addr_a3
	str r4, [r5]
	ldr r4, =4
	ldr r5, addr_a4
	str r4, [r5]
	ldr r4, =5
	ldr r5, addr_a5
	str r4, [r5]
	ldr r4, =6
	ldr r5, addr_a6
	str r4, [r5]
	ldr r4, =7
	ldr r5, addr_a7
	str r4, [r5]
	ldr r4, =8
	ldr r5, addr_a8
	str r4, [r5]
	ldr r4, =9
	ldr r5, addr_a9
	str r4, [r5]
	ldr r4, =0
	ldr r5, addr_a10
	str r4, [r5]
	ldr r4, =1
	ldr r5, addr_a11
	str r4, [r5]
	ldr r4, =2
	ldr r5, addr_a12
	str r4, [r5]
	ldr r4, =3
	ldr r5, addr_a13
	str r4, [r5]
	ldr r4, =4
	ldr r5, addr_a14
	str r4, [r5]
	ldr r4, =5
	ldr r5, addr_a15
	str r4, [r5]
	ldr r4, =6
	ldr r5, addr_a16
	str r4, [r5]
	ldr r4, =7
	ldr r5, addr_a17
	str r4, [r5]
	ldr r4, =8
	ldr r5, addr_a18
	str r4, [r5]
	ldr r4, =9
	ldr r5, addr_a19
	str r4, [r5]
	ldr r4, =0
	ldr r5, addr_a20
	str r4, [r5]
	ldr r4, =1
	ldr r5, addr_a21
	str r4, [r5]
	ldr r4, =2
	ldr r5, addr_a22
	str r4, [r5]
	ldr r4, =3
	ldr r5, addr_a23
	str r4, [r5]
	ldr r4, =4
	ldr r5, addr_a24
	str r4, [r5]
	ldr r4, =5
	ldr r5, addr_a25
	str r4, [r5]
	ldr r4, =6
	ldr r5, addr_a26
	str r4, [r5]
	ldr r4, =7
	ldr r5, addr_a27
	str r4, [r5]
	ldr r4, =8
	ldr r5, addr_a28
	str r4, [r5]
	ldr r4, =9
	ldr r5, addr_a29
	str r4, [r5]
	ldr r4, =0
	ldr r5, addr_a30
	str r4, [r5]
	ldr r4, =1
	ldr r5, addr_a31
	str r4, [r5]
	ldr r4, =4
	ldr r5, addr_a32
	str r4, [r5]
	ldr r4, =5
	ldr r5, addr_a33
	str r4, [r5]
	ldr r4, =6
	ldr r5, addr_a34
	str r4, [r5]
	ldr r4, =7
	ldr r5, addr_a35
	str r4, [r5]
	ldr r4, =8
	ldr r5, addr_a36
	str r4, [r5]
	ldr r4, =9
	ldr r5, addr_a37
	str r4, [r5]
	ldr r4, =0
	ldr r5, addr_a38
	str r4, [r5]
	ldr r4, =1
	ldr r5, addr_a39
	str r4, [r5]
	ldr r4, addr_a0
	ldr r5, [r4]
	ldr r4, addr_a1
	ldr r6, [r4]
	ldr r4, addr_a2
	ldr r7, [r4]
	ldr r4, addr_a3
	ldr r8, [r4]
	ldr r4, addr_a4
	ldr r9, [r4]
	ldr r4, addr_a5
	ldr r10, [r4]
	str r10, [fp, #-332]
	ldr r4, addr_a6
	ldr r10, [r4]
	str r10, [fp, #-180]
	ldr r4, addr_a7
	ldr r10, [r4]
	str r10, [fp, #-184]
	mov r0, r5
	mov r1, r6
	mov r2, r7
	mov r3, r8
	mov r4, r9
	str r4, [sp, #-16]
	ldr r4, [fp, #-332]
	mov r4, r4
	str r4, [sp, #-12]
	ldr r4, [fp, #-180]
	mov r4, r4
	str r4, [sp, #-8]
	ldr r4, [fp, #-184]
	mov r4, r4
	str r4, [sp, #-4]
	sub  sp, sp, #16
	bl testParam8
	add  sp, sp, #16
	mov r4, r0
	ldr r5, addr_a0
	str r4, [r5]
	ldr r4, addr_a0
	ldr r5, [r4]
	mov r0, r5
	bl putint
	ldr r4, addr_a32
	ldr r5, [r4]
	ldr r4, addr_a33
	ldr r6, [r4]
	ldr r4, addr_a34
	ldr r7, [r4]
	ldr r4, addr_a35
	ldr r8, [r4]
	ldr r4, addr_a36
	ldr r9, [r4]
	ldr r4, addr_a37
	ldr r10, [r4]
	str r10, [fp, #-336]
	ldr r4, addr_a38
	ldr r10, [r4]
	str r10, [fp, #-188]
	ldr r4, addr_a39
	ldr r10, [r4]
	str r10, [fp, #-192]
	ldr r4, addr_a8
	ldr r10, [r4]
	str r10, [fp, #-196]
	ldr r4, addr_a9
	ldr r10, [r4]
	str r10, [fp, #-200]
	ldr r4, addr_a10
	ldr r10, [r4]
	str r10, [fp, #-204]
	ldr r4, addr_a11
	ldr r10, [r4]
	str r10, [fp, #-208]
	ldr r4, addr_a12
	ldr r10, [r4]
	str r10, [fp, #-212]
	ldr r4, addr_a13
	ldr r10, [r4]
	str r10, [fp, #-216]
	ldr r4, addr_a14
	ldr r10, [r4]
	str r10, [fp, #-220]
	ldr r4, addr_a15
	ldr r10, [r4]
	str r10, [fp, #-224]
	mov r0, r5
	mov r1, r6
	mov r2, r7
	mov r3, r8
	mov r4, r9
	str r4, [sp, #-48]
	ldr r4, [fp, #-336]
	mov r4, r4
	str r4, [sp, #-44]
	ldr r4, [fp, #-188]
	mov r4, r4
	str r4, [sp, #-40]
	ldr r4, [fp, #-192]
	mov r4, r4
	str r4, [sp, #-36]
	ldr r4, [fp, #-196]
	mov r4, r4
	str r4, [sp, #-32]
	ldr r4, [fp, #-200]
	mov r4, r4
	str r4, [sp, #-28]
	ldr r4, [fp, #-204]
	mov r4, r4
	str r4, [sp, #-24]
	ldr r4, [fp, #-208]
	mov r4, r4
	str r4, [sp, #-20]
	ldr r4, [fp, #-212]
	mov r4, r4
	str r4, [sp, #-16]
	ldr r4, [fp, #-216]
	mov r4, r4
	str r4, [sp, #-12]
	ldr r4, [fp, #-220]
	mov r4, r4
	str r4, [sp, #-8]
	ldr r4, [fp, #-224]
	mov r4, r4
	str r4, [sp, #-4]
	sub  sp, sp, #48
	bl testParam16
	add  sp, sp, #48
	mov r4, r0
	ldr r5, addr_a0
	str r4, [r5]
	ldr r4, addr_a0
	ldr r5, [r4]
	mov r0, r5
	bl putint
	ldr r4, addr_a0
	ldr r5, [r4]
	ldr r4, addr_a1
	ldr r6, [r4]
	ldr r4, addr_a2
	ldr r7, [r4]
	ldr r4, addr_a3
	ldr r8, [r4]
	ldr r4, addr_a4
	ldr r9, [r4]
	ldr r4, addr_a5
	ldr r10, [r4]
	str r10, [fp, #-340]
	ldr r4, addr_a6
	ldr r10, [r4]
	str r10, [fp, #-228]
	ldr r4, addr_a7
	ldr r10, [r4]
	str r10, [fp, #-232]
	ldr r4, addr_a8
	ldr r10, [r4]
	str r10, [fp, #-236]
	ldr r4, addr_a9
	ldr r10, [r4]
	str r10, [fp, #-240]
	ldr r4, addr_a10
	ldr r10, [r4]
	str r10, [fp, #-244]
	ldr r4, addr_a11
	ldr r10, [r4]
	str r10, [fp, #-248]
	ldr r4, addr_a12
	ldr r10, [r4]
	str r10, [fp, #-252]
	ldr r4, addr_a13
	ldr r10, [r4]
	str r10, [fp, #-256]
	ldr r4, addr_a14
	ldr r10, [r4]
	str r10, [fp, #-260]
	ldr r4, addr_a15
	ldr r10, [r4]
	str r10, [fp, #-264]
	ldr r4, addr_a16
	ldr r10, [r4]
	str r10, [fp, #-268]
	ldr r4, addr_a17
	ldr r10, [r4]
	str r10, [fp, #-272]
	ldr r4, addr_a18
	ldr r10, [r4]
	str r10, [fp, #-276]
	ldr r4, addr_a19
	ldr r10, [r4]
	str r10, [fp, #-280]
	ldr r4, addr_a20
	ldr r10, [r4]
	str r10, [fp, #-284]
	ldr r4, addr_a21
	ldr r10, [r4]
	str r10, [fp, #-288]
	ldr r4, addr_a22
	ldr r10, [r4]
	str r10, [fp, #-292]
	ldr r4, addr_a23
	ldr r10, [r4]
	str r10, [fp, #-296]
	ldr r4, addr_a24
	ldr r10, [r4]
	str r10, [fp, #-300]
	ldr r4, addr_a25
	ldr r10, [r4]
	str r10, [fp, #-304]
	ldr r4, addr_a26
	ldr r10, [r4]
	str r10, [fp, #-308]
	ldr r4, addr_a27
	ldr r10, [r4]
	str r10, [fp, #-312]
	ldr r4, addr_a28
	ldr r10, [r4]
	str r10, [fp, #-316]
	ldr r4, addr_a29
	ldr r10, [r4]
	str r10, [fp, #-320]
	ldr r4, addr_a30
	ldr r10, [r4]
	str r10, [fp, #-324]
	ldr r4, addr_a31
	ldr r10, [r4]
	str r10, [fp, #-328]
	mov r0, r5
	mov r1, r6
	mov r2, r7
	mov r3, r8
	mov r4, r9
	str r4, [sp, #-112]
	ldr r4, [fp, #-340]
	mov r4, r4
	str r4, [sp, #-108]
	ldr r4, [fp, #-228]
	mov r4, r4
	str r4, [sp, #-104]
	ldr r4, [fp, #-232]
	mov r4, r4
	str r4, [sp, #-100]
	ldr r4, [fp, #-236]
	mov r4, r4
	str r4, [sp, #-96]
	ldr r4, [fp, #-240]
	mov r4, r4
	str r4, [sp, #-92]
	ldr r4, [fp, #-244]
	mov r4, r4
	str r4, [sp, #-88]
	ldr r4, [fp, #-248]
	mov r4, r4
	str r4, [sp, #-84]
	ldr r4, [fp, #-252]
	mov r4, r4
	str r4, [sp, #-80]
	ldr r4, [fp, #-256]
	mov r4, r4
	str r4, [sp, #-76]
	ldr r4, [fp, #-260]
	mov r4, r4
	str r4, [sp, #-72]
	ldr r4, [fp, #-264]
	mov r4, r4
	str r4, [sp, #-68]
	ldr r4, [fp, #-268]
	mov r4, r4
	str r4, [sp, #-64]
	ldr r4, [fp, #-272]
	mov r4, r4
	str r4, [sp, #-60]
	ldr r4, [fp, #-276]
	mov r4, r4
	str r4, [sp, #-56]
	ldr r4, [fp, #-280]
	mov r4, r4
	str r4, [sp, #-52]
	ldr r4, [fp, #-284]
	mov r4, r4
	str r4, [sp, #-48]
	ldr r4, [fp, #-288]
	mov r4, r4
	str r4, [sp, #-44]
	ldr r4, [fp, #-292]
	mov r4, r4
	str r4, [sp, #-40]
	ldr r4, [fp, #-296]
	mov r4, r4
	str r4, [sp, #-36]
	ldr r4, [fp, #-300]
	mov r4, r4
	str r4, [sp, #-32]
	ldr r4, [fp, #-304]
	mov r4, r4
	str r4, [sp, #-28]
	ldr r4, [fp, #-308]
	mov r4, r4
	str r4, [sp, #-24]
	ldr r4, [fp, #-312]
	mov r4, r4
	str r4, [sp, #-20]
	ldr r4, [fp, #-316]
	mov r4, r4
	str r4, [sp, #-16]
	ldr r4, [fp, #-320]
	mov r4, r4
	str r4, [sp, #-12]
	ldr r4, [fp, #-324]
	mov r4, r4
	str r4, [sp, #-8]
	ldr r4, [fp, #-328]
	mov r4, r4
	str r4, [sp, #-4]
	sub  sp, sp, #112
	bl testParam32
	add  sp, sp, #112
	mov r4, r0
	ldr r5, addr_a0
	str r4, [r5]
	ldr r4, addr_a0
	ldr r5, [r4]
	mov r0, r5
	bl putint
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr

addr_a0:
	.word a0
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
addr_a33:
	.word a33
addr_a34:
	.word a34
addr_a35:
	.word a35
addr_a36:
	.word a36
addr_a37:
	.word a37
addr_a38:
	.word a38
addr_a39:
	.word a39
