	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global a
	.align 4
	.size a, 4
a:
	.word 10
	.text
	.global main
	.type main , %function
main:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub  sp, sp, #4
.L7:
	ldr r4, =2
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, addr_a
	ldr r6, [r5]
	add  r4, r4, r6
	sub  r4, r4, r6
	sub  r5, r4, r6
	mov r0, r5
	sub  sp, fp, #0
	pop {r4, r5, r6, fp, lr}
	bx lr

addr_a:
	.word a
