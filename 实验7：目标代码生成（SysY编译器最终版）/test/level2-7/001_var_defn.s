	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global a
	.align 4
	.size a, 4
a:
	.word 3
	.global b
	.align 4
	.size b, 4
b:
	.word 5
	.text
	.global main
	.type main , %function
main:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub  sp, sp, #0
.L6:
	ldr r4, addr_a
	ldr r5, [r4]
	ldr r4, addr_b
	ldr r6, [r4]
	add  r4, r6, r5
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, fp, lr}
	bx lr

addr_a:
	.word a
addr_b:
	.word b
