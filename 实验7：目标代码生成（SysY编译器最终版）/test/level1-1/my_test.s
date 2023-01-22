	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.text
	.global main
	.type main , %function
main:
	push {r4}
	mov fp, sp
	sub  sp, sp, #4
.L4:
	bl getint
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	add  sp, sp, #4
	pop {fp}
	bx lr

