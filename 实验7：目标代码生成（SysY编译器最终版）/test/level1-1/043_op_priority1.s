	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.text
	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub  sp, sp, #16
.L16:
	ldr r4, =10
	str r4, [fp, #-16]
	ldr r4, =4
	str r4, [fp, #-12]
	ldr r4, =2
	str r4, [fp, #-8]
	ldr r4, =2
	str r4, [fp, #-4]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-16]
	ldr r6, [fp, #-12]
	mul  r7, r6, r5
	mov r5, r7
	add  r5, r5, r4
	ldr r4, [fp, #-4]
	add  r5, r5, r4
	sub  r5, r5, r4
	sub  r6, r5, r4
	mov r0, r6
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

