	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.text
	.global main
	.type main , %function
main:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub  sp, sp, #8
.L8:
	ldr r4, =10
	str r4, [fp, #-8]
	ldr r4, =5
	str r4, [fp, #-4]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	mul  r6, r5, r4
	mov r0, r6
	sub  sp, fp, #0
	pop {r4, r5, r6, fp, lr}
	bx lr

