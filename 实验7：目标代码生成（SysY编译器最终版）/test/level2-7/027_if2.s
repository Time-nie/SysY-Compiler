	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global a
	.align 4
	.size a, 4
a:
	.word 0
	.text
	.global main
	.type main , %function
main:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub  sp, sp, #0
.L5:
	ldr r4, =10
	ldr r5, addr_a
	str r4, [r5]
	ldr r4, addr_a
	ldr r5, [r4]
	ldr r4, =0
	cmp r4, r5
	blt .L6
	b .L7
.L6:
	mov r0, #1
	sub  sp, fp, #0
	pop {r4, r5, fp, lr}
	bx lr
	b .L8
.L7:
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, fp, lr}
	bx lr
	b .L8
.L8:
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, fp, lr}
	bx lr

addr_a:
	.word a
