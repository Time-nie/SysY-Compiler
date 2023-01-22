	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global g
	.align 4
	.size g, 4
g:
	.word 0
	.global h
	.align 4
	.size h, 4
h:
	.word 0
	.global f
	.align 4
	.size f, 4
f:
	.word 0
	.global e
	.align 4
	.size e, 4
e:
	.word 0
	.text
	.global EightWhile
	.type EightWhile , %function
EightWhile:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub  sp, sp, #16
.L94:
	ldr r4, =5
	str r4, [fp, #-16]
	ldr r4, =6
	str r4, [fp, #-12]
	ldr r4, =7
	str r4, [fp, #-8]
	ldr r4, =10
	str r4, [fp, #-4]
	b .L99
.L99:
	ldr r4, [fp, #-16]
	ldr r5, =20
	cmp r5, r4
	bgt .L100
	b .L101
.L100:
	ldr r4, [fp, #-16]
	ldr r5, =3
	mov r5, r5
	add  r5, r5, r4
	str r5, [fp, #-16]
	b .L103
.L101:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-12]
	ldr r6, [fp, #-4]
	mov r6, r6
	add  r6, r6, r5
	mov r5, r6
	add  r5, r5, r4
	ldr r4, [fp, #-8]
	mov r4, r4
	add  r4, r4, r5
	ldr r5, addr_e
	ldr r6, [r5]
	ldr r5, [fp, #-4]
	mov r5, r5
	add  r5, r5, r6
	ldr r6, addr_g
	ldr r7, [r6]
	add  r5, r5, r7
	sub  r5, r5, r7
	sub  r6, r5, r7
	ldr r5, addr_h
	ldr r7, [r5]
	mov r5, r7
	add  r5, r5, r6
	add  r4, r4, r5
	sub  r4, r4, r5
	sub  r6, r4, r5
	mov r0, r6
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
.L103:
	ldr r4, [fp, #-12]
	ldr r5, =10
	cmp r5, r4
	bgt .L104
	b .L105
.L104:
	ldr r4, [fp, #-12]
	ldr r5, =1
	mov r5, r5
	add  r5, r5, r4
	str r5, [fp, #-12]
	b .L107
.L105:
	ldr r4, [fp, #-12]
	add  r4, r4, #2
	sub  r4, r4, #2
	sub  r5, r4, #2
	str r5, [fp, #-12]
	b .L99
.L107:
	ldr r4, [fp, #-8]
	ldr r5, =7
	cmp r5, r4
	beq .L108
	b .L109
.L108:
	ldr r4, [fp, #-8]
	add  r4, r4, #1
	sub  r4, r4, #1
	sub  r5, r4, #1
	str r5, [fp, #-8]
	b .L111
.L109:
	ldr r4, [fp, #-8]
	ldr r5, =1
	mov r5, r5
	add  r5, r5, r4
	str r5, [fp, #-8]
	b .L103
.L111:
	ldr r4, [fp, #-4]
	ldr r5, =20
	cmp r5, r4
	bgt .L112
	b .L113
.L112:
	ldr r4, [fp, #-4]
	ldr r5, =3
	mov r5, r5
	add  r5, r5, r4
	str r5, [fp, #-4]
	b .L115
.L113:
	ldr r4, [fp, #-4]
	add  r4, r4, #1
	sub  r4, r4, #1
	sub  r5, r4, #1
	str r5, [fp, #-4]
	b .L107
.L115:
	ldr r4, addr_e
	ldr r5, [r4]
	ldr r4, =1
	cmp r4, r5
	blt .L116
	b .L117
.L116:
	ldr r4, addr_e
	ldr r5, [r4]
	add  r5, r5, #1
	sub  r5, r5, #1
	sub  r4, r5, #1
	ldr r5, addr_e
	str r4, [r5]
	b .L119
.L117:
	ldr r4, addr_e
	ldr r5, [r4]
	ldr r4, =1
	mov r4, r4
	add  r4, r4, r5
	ldr r5, addr_e
	str r4, [r5]
	b .L111
.L119:
	ldr r4, addr_f
	ldr r5, [r4]
	ldr r4, =2
	cmp r4, r5
	blt .L120
	b .L121
.L120:
	ldr r4, addr_f
	ldr r5, [r4]
	add  r5, r5, #2
	sub  r5, r5, #2
	sub  r4, r5, #2
	ldr r5, addr_f
	str r4, [r5]
	b .L123
.L121:
	ldr r4, addr_f
	ldr r5, [r4]
	ldr r4, =1
	mov r4, r4
	add  r4, r4, r5
	ldr r5, addr_f
	str r4, [r5]
	b .L115
.L123:
	ldr r4, addr_g
	ldr r5, [r4]
	ldr r4, =3
	cmp r4, r5
	bgt .L124
	b .L125
.L124:
	ldr r4, addr_g
	ldr r5, [r4]
	ldr r4, =10
	mov r4, r4
	add  r4, r4, r5
	ldr r5, addr_g
	str r4, [r5]
	b .L127
.L125:
	ldr r4, addr_g
	ldr r5, [r4]
	add  r5, r5, #8
	sub  r5, r5, #8
	sub  r4, r5, #8
	ldr r5, addr_g
	str r4, [r5]
	b .L119
.L127:
	ldr r4, addr_h
	ldr r5, [r4]
	ldr r4, =10
	cmp r4, r5
	bgt .L128
	b .L129
.L128:
	ldr r4, addr_h
	ldr r5, [r4]
	ldr r4, =8
	mov r4, r4
	add  r4, r4, r5
	ldr r5, addr_h
	str r4, [r5]
	b .L127
.L129:
	ldr r4, addr_h
	ldr r5, [r4]
	add  r5, r5, #1
	sub  r5, r5, #1
	sub  r4, r5, #1
	ldr r5, addr_h
	str r4, [r5]
	b .L123

	.global main
	.type main , %function
main:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub  sp, sp, #0
.L131:
	ldr r4, =1
	ldr r5, addr_g
	str r4, [r5]
	ldr r4, =2
	ldr r5, addr_h
	str r4, [r5]
	ldr r4, =4
	ldr r5, addr_e
	str r4, [r5]
	ldr r4, =6
	ldr r5, addr_f
	str r4, [r5]
	bl EightWhile
	mov r4, r0
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, fp, lr}
	bx lr

addr_g:
	.word g
addr_h:
	.word h
addr_f:
	.word f
addr_e:
	.word e
