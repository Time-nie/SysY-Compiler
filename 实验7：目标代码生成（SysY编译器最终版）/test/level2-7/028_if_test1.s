	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.text
	.global ifElse
	.type ifElse , %function
ifElse:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub  sp, sp, #4
.L11:
	ldr r4, =5
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, =5
	cmp r5, r4
	beq .L13
	b .L14
.L13:
	ldr r4, =25
	str r4, [fp, #-4]
	b .L15
.L14:
	ldr r4, [fp, #-4]
	ldr r5, =2
	mul  r6, r5, r4
	str r6, [fp, #-4]
	b .L15
.L15:
	ldr r4, [fp, #-4]
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, fp, lr}
	bx lr

	.global main
	.type main , %function
main:
	push {r4, fp, lr}
	mov fp, sp
	sub  sp, sp, #0
.L17:
	bl ifElse
	mov r4, r0
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, fp, lr}
	bx lr

