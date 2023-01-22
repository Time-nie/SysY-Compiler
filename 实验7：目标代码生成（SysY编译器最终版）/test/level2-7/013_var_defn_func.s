	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.text
	.global defn
	.type defn , %function
defn:
	push {fp, lr}
	mov fp, sp
	sub  sp, sp, #0
.L4:
	mov r0, #4
	sub  sp, fp, #0
	pop {fp, lr}
	bx lr

	.global main
	.type main , %function
main:
	push {r4, fp, lr}
	mov fp, sp
	sub  sp, sp, #4
.L5:
	bl defn
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, fp, lr}
	bx lr

