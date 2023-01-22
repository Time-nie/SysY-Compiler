	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.text
	.global main
	.type main , %function
main:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub  sp, sp, #4
.L5:
	ldr r4, =10
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	add  r4, r4, #2
	sub  r4, r4, #2
	sub  r5, r4, #2
	mov r0, r5
	sub  sp, fp, #0
	pop {r4, r5, fp, lr}
	bx lr

