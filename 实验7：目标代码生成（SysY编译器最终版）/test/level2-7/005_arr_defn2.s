	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.balign 4
	a: .skip 400
	.text
	.global main
	.type main , %function
main:
	push {fp, lr}
	mov fp, sp
	sub  sp, sp, #0
.L2:
	mov r0, #0
	sub  sp, fp, #0
	pop {fp, lr}
	bx lr

addr_a:
	.word a
