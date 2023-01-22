	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.text
	.global foo
	.type foo , %function
foo:
	push {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov fp, sp
	sub  sp, sp, #152
.L159:
	mov r4, #0
	mov r5, #-136
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =0
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =1
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =2
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =3
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =0
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =1
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =2
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =3
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =0
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =1
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =2
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =3
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =0
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =1
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =2
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =3
	str r5, [r4]
	ldr r4, =3
	str r4, [fp, #-72]
	ldr r4, =7
	str r4, [fp, #-68]
	ldr r4, =5
	str r4, [fp, #-64]
	ldr r4, =6
	str r4, [fp, #-60]
	ldr r4, =1
	str r4, [fp, #-56]
	ldr r4, =0
	str r4, [fp, #-52]
	ldr r4, =3
	str r4, [fp, #-48]
	ldr r4, =5
	str r4, [fp, #-44]
	ldr r4, =4
	str r4, [fp, #-40]
	ldr r4, =2
	str r4, [fp, #-36]
	ldr r4, =7
	str r4, [fp, #-32]
	ldr r4, =9
	str r4, [fp, #-28]
	ldr r4, =8
	str r4, [fp, #-24]
	ldr r4, =1
	str r4, [fp, #-20]
	ldr r4, =4
	str r4, [fp, #-16]
	ldr r4, =6
	str r4, [fp, #-12]
	ldr r4, [fp, #-44]
	str r4, [fp, #-140]
	ldr r4, [fp, #-48]
	str r4, [fp, #-144]
	ldr r4, [fp, #-52]
	ldr r5, [fp, #-56]
	ldr r6, [fp, #-60]
	ldr r7, [fp, #-64]
	ldr r8, [fp, #-68]
	ldr r9, [fp, #-72]
	add  r10, r9, r8
	add  r8, r10, r7
	add  r7, r8, r6
	add  r6, r7, r5
	add  r5, r6, r4
	ldr r4, [fp, #-144]
	add  r6, r5, r4
	ldr r4, [fp, #-140]
	add  r5, r6, r4
	str r5, [fp, #-8]
	ldr r4, [fp, #-12]
	str r4, [fp, #-148]
	ldr r4, [fp, #-16]
	str r4, [fp, #-152]
	ldr r4, [fp, #-20]
	ldr r5, [fp, #-24]
	ldr r6, [fp, #-28]
	ldr r7, [fp, #-32]
	ldr r8, [fp, #-36]
	ldr r9, [fp, #-40]
	add  r10, r9, r8
	add  r8, r10, r7
	add  r7, r8, r6
	add  r6, r7, r5
	add  r5, r6, r4
	ldr r4, [fp, #-152]
	add  r6, r5, r4
	ldr r4, [fp, #-148]
	add  r5, r6, r4
	str r5, [fp, #-4]
	ldr r4, [fp, #-72]
	mov r5, #-136
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, [r5]
	ldr r5, [fp, #-4]
	ldr r6, [fp, #-8]
	add  r7, r6, r5
	add  r5, r7, r4
	mov r0, r5
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr

	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov fp, sp
	sub  sp, sp, #136
.L196:
	ldr r4, =3
	str r4, [fp, #-112]
	ldr r4, =7
	str r4, [fp, #-108]
	ldr r4, =5
	str r4, [fp, #-104]
	ldr r4, =6
	str r4, [fp, #-100]
	ldr r4, =1
	str r4, [fp, #-96]
	ldr r4, =0
	str r4, [fp, #-92]
	ldr r4, =3
	str r4, [fp, #-88]
	ldr r4, =5
	str r4, [fp, #-84]
	ldr r4, =4
	str r4, [fp, #-80]
	ldr r4, =2
	str r4, [fp, #-76]
	ldr r4, =7
	str r4, [fp, #-72]
	ldr r4, =9
	str r4, [fp, #-68]
	ldr r4, =8
	str r4, [fp, #-64]
	ldr r4, =1
	str r4, [fp, #-60]
	ldr r4, =4
	str r4, [fp, #-56]
	ldr r4, =6
	str r4, [fp, #-52]
	ldr r4, [fp, #-84]
	str r4, [fp, #-116]
	ldr r4, [fp, #-88]
	str r4, [fp, #-120]
	ldr r4, [fp, #-92]
	ldr r5, [fp, #-96]
	ldr r6, [fp, #-100]
	ldr r7, [fp, #-104]
	ldr r8, [fp, #-108]
	ldr r9, [fp, #-112]
	add  r10, r9, r8
	add  r8, r10, r7
	add  r7, r8, r6
	add  r6, r7, r5
	add  r5, r6, r4
	ldr r4, [fp, #-120]
	add  r6, r5, r4
	ldr r4, [fp, #-116]
	add  r5, r6, r4
	str r5, [fp, #-48]
	ldr r4, [fp, #-52]
	str r4, [fp, #-124]
	ldr r4, [fp, #-56]
	str r4, [fp, #-128]
	ldr r4, [fp, #-60]
	ldr r5, [fp, #-64]
	ldr r6, [fp, #-68]
	ldr r7, [fp, #-72]
	ldr r8, [fp, #-76]
	ldr r9, [fp, #-80]
	add  r10, r9, r8
	add  r8, r10, r7
	add  r7, r8, r6
	add  r6, r7, r5
	add  r5, r6, r4
	ldr r4, [fp, #-128]
	add  r6, r5, r4
	ldr r4, [fp, #-124]
	add  r5, r6, r4
	str r5, [fp, #-44]
	bl foo
	mov r4, r0
	ldr r5, [fp, #-48]
	add  r6, r5, r4
	str r6, [fp, #-48]
	ldr r4, =4
	str r4, [fp, #-40]
	ldr r4, =7
	str r4, [fp, #-36]
	ldr r4, =2
	str r4, [fp, #-32]
	ldr r4, =5
	str r4, [fp, #-28]
	ldr r4, =8
	str r4, [fp, #-24]
	ldr r4, =0
	str r4, [fp, #-20]
	ldr r4, =6
	str r4, [fp, #-16]
	ldr r4, =3
	str r4, [fp, #-12]
	bl foo
	mov r4, r0
	ldr r5, [fp, #-44]
	add  r6, r5, r4
	str r6, [fp, #-44]
	ldr r4, [fp, #-80]
	str r4, [fp, #-112]
	ldr r4, [fp, #-76]
	str r4, [fp, #-108]
	ldr r4, [fp, #-72]
	str r4, [fp, #-104]
	ldr r4, [fp, #-68]
	str r4, [fp, #-100]
	ldr r4, [fp, #-64]
	str r4, [fp, #-96]
	ldr r4, [fp, #-60]
	str r4, [fp, #-92]
	ldr r4, [fp, #-56]
	str r4, [fp, #-88]
	ldr r4, [fp, #-52]
	str r4, [fp, #-84]
	ldr r4, [fp, #-12]
	str r4, [fp, #-132]
	ldr r4, [fp, #-16]
	str r4, [fp, #-136]
	ldr r4, [fp, #-20]
	ldr r5, [fp, #-24]
	ldr r6, [fp, #-28]
	ldr r7, [fp, #-32]
	ldr r8, [fp, #-36]
	ldr r9, [fp, #-40]
	add  r10, r9, r8
	add  r8, r10, r7
	add  r7, r8, r6
	add  r6, r7, r5
	add  r5, r6, r4
	ldr r4, [fp, #-136]
	add  r6, r5, r4
	ldr r4, [fp, #-132]
	add  r5, r6, r4
	str r5, [fp, #-8]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-44]
	ldr r6, [fp, #-48]
	add  r7, r6, r5
	add  r5, r7, r4
	str r5, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putint
	mov r0, #10
	bl putch
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr

