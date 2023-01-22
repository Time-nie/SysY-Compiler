	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global a
	.align 4
	.size a, 20
a:
	.word 0
	.word 1
	.word 2
	.word 3
	.word 4
	.text
	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub  sp, sp, #0
.L3:
	mov r4, #4
	ldr r5, addr_a
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

addr_a:
	.word a
