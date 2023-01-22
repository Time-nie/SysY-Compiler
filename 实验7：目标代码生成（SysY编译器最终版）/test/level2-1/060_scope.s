	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global a
	.align 4
	.size a, 4
a:
	.word 7
	.text
	.global func
	.type func , %function
func:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub  sp, sp, #8
.L25:
	ldr r4, addr_a
	ldr r5, [r4]
	str r5, [fp, #-8]
	ldr r4, =1
	str r4, [fp, #-4]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	cmp r4, r5
	beq .L28
	b .L29
.L28:
	ldr r4, [fp, #-4]
	ldr r5, =1
	mov r5, r5
	add  r5, r5, r4
	str r5, [fp, #-4]
	mov r0, #1
	sub  sp, fp, #0
	pop {r4, r5, fp, lr}
	bx lr
	b .L30
.L29:
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, fp, lr}
	bx lr
	b .L30
.L30:
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, fp, lr}
	bx lr

	.global main
	.type main , %function
main:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub  sp, sp, #8
.L32:
	ldr r4, =0
	str r4, [fp, #-8]
	ldr r4, =0
	str r4, [fp, #-4]
	b .L35
.L35:
	ldr r4, [fp, #-4]
	ldr r5, =100
	cmp r5, r4
	bgt .L36
	b .L37
.L36:
	bl func
	mov r4, r0
	ldr r5, =1
	cmp r5, r4
	beq .L39
	b .L40
.L37:
	ldr r4, [fp, #-8]
	ldr r5, =100
	cmp r5, r4
	bgt .L42
	b .L43
.L39:
	ldr r4, [fp, #-8]
	ldr r5, =1
	mov r5, r5
	add  r5, r5, r4
	str r5, [fp, #-8]
	b .L40
.L40:
	ldr r4, [fp, #-4]
	ldr r5, =1
	mov r5, r5
	add  r5, r5, r4
	str r5, [fp, #-4]
	b .L35
.L42:
	mov r0, #1
	bl putint
	b .L44
.L43:
	mov r0, #0
	bl putint
	b .L44
.L44:
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, fp, lr}
	bx lr

addr_a:
	.word a
