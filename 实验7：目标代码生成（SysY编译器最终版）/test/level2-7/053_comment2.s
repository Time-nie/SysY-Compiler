	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.text
	.global main
	.type main , %function
main:
	push {r4, fp, lr}
	mov fp, sp
	sub  sp, sp, #8
.L6:
	ldr r4, =10
	str r4, [fp, #-8]
	ldr r4, =2
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, fp, lr}
	bx lr

