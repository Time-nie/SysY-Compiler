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
	sub  sp, sp, #4
.L5:
	ldr r4, =10
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, =2
	mul  r6, r5, r4
	ldr r4, =1
	mov r4, r4
	add  r4, r4, r6
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, fp, lr}
	bx lr

