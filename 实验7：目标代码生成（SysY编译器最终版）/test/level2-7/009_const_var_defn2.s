	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global a
	.align 4
	.size a, 4
a:
	.word 10
	.global b
	.align 4
	.size b, 4
b:
	.word 5
	.text
	.global main
	.type main , %function
main:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub  sp, sp, #0
.L4:
	ldr r4, addr_b
	ldr r5, [r4]
	mov r0, r5
	sub  sp, fp, #0
	pop {r4, r5, fp, lr}
	bx lr

addr_a:
	.word a
addr_b:
	.word b
