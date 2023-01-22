	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.text
	.global fun
	.type fun , %function
fun:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub  sp, sp, #12
.L27:
	str r0, [fp, #-12]
	str r1, [fp, #-8]
	b .L33
.L33:
	ldr r4, [fp, #-8]
	ldr r5, =0
	cmp r5, r4
	blt .L34
	b .L35
.L34:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-8]
	sdiv  r6, r4, r5
	mul  r6, r6, r5
	sub  r5, r4, r6
	str r5, [fp, #-4]
	ldr r4, [fp, #-8]
	str r4, [fp, #-12]
	ldr r4, [fp, #-4]
	str r4, [fp, #-8]
	b .L33
.L35:
	ldr r4, [fp, #-12]
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, fp, lr}
	bx lr

	.global main
	.type main , %function
main:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub  sp, sp, #12
.L37:
	bl getint
	mov r4, r0
	str r4, [fp, #-8]
	bl getint
	mov r4, r0
	str r4, [fp, #-12]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-12]
	mov r0, r4
	mov r1, r5
	bl fun
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putint
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, fp, lr}
	bx lr

