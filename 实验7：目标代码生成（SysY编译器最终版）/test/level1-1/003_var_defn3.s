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
	sub  sp, sp, #12
.L10:
	ldr r4, =1
	str r4, [fp, #-12]
	ldr r4, =2
	str r4, [fp, #-8]
	ldr r4, =3
	str r4, [fp, #-4]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	mov r5, r5
	add  r5, r5, r4
	mov r0, r5
	sub  sp, fp, #0
	pop {r4, r5, fp, lr}
	bx lr

