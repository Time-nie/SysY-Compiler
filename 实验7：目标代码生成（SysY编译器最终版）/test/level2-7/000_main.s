	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.text
	.global main
	.type main , %function
main:
	push {fp, lr}
	mov fp, sp
	sub  sp, sp, #0
.L1:
	mov r0, #3
	sub  sp, fp, #0
	pop {fp, lr}
	bx lr

