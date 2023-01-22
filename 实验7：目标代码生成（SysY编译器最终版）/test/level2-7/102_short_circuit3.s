	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global a
	.align 4
	.size a, 4
a:
	.word 0
	.global b
	.align 4
	.size b, 4
b:
	.word 0
	.global d
	.align 4
	.size d, 4
d:
	.word 0
	.text
	.global set_a
	.type set_a , %function
set_a:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub  sp, sp, #4
.L109:
	str r0, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, addr_a
	str r4, [r5]
	ldr r4, addr_a
	ldr r5, [r4]
	mov r0, r5
	sub  sp, fp, #0
	pop {r4, r5, fp, lr}
	bx lr

	.global set_b
	.type set_b , %function
set_b:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub  sp, sp, #4
.L112:
	str r0, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, addr_b
	str r4, [r5]
	ldr r4, addr_b
	ldr r5, [r4]
	mov r0, r5
	sub  sp, fp, #0
	pop {r4, r5, fp, lr}
	bx lr

	.global set_d
	.type set_d , %function
set_d:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub  sp, sp, #4
.L115:
	str r0, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, addr_d
	str r4, [r5]
	ldr r4, addr_d
	ldr r5, [r4]
	mov r0, r5
	sub  sp, fp, #0
	pop {r4, r5, fp, lr}
	bx lr

	.global main
	.type main , %function
main:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub  sp, sp, #24
.L118:
	ldr r4, =2
	ldr r5, addr_a
	str r4, [r5]
	ldr r4, =3
	ldr r5, addr_b
	str r4, [r5]
	mov r0, #0
	bl set_a
	mov r4, r0
	ldr r5, =0
	cmp r4, r5
	bne .L122
	b .L120
.L119:
	b .L120
.L120:
	ldr r4, addr_a
	ldr r5, [r4]
	mov r0, r5
	bl putint
	mov r0, #32
	bl putch
	ldr r4, addr_b
	ldr r5, [r4]
	mov r0, r5
	bl putint
	mov r0, #32
	bl putch
	ldr r4, =2
	ldr r5, addr_a
	str r4, [r5]
	ldr r4, =3
	ldr r5, addr_b
	str r4, [r5]
	mov r0, #0
	bl set_a
	mov r4, r0
	ldr r5, =0
	cmp r4, r5
	bne .L127
	b .L125
.L122:
	mov r0, #1
	bl set_b
	mov r4, r0
	ldr r5, =0
	cmp r4, r5
	bne .L119
	b .L120
.L124:
	b .L125
.L125:
	ldr r4, addr_a
	ldr r5, [r4]
	mov r0, r5
	bl putint
	mov r0, #32
	bl putch
	ldr r4, addr_b
	ldr r5, [r4]
	mov r0, r5
	bl putint
	mov r0, #10
	bl putch
	ldr r4, =1
	str r4, [fp, #-24]
	ldr r4, =2
	ldr r5, addr_d
	str r4, [r5]
	ldr r4, [fp, #-24]
	ldr r5, =1
	cmp r5, r4
	movle r4, #1
	movgt r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L135
	b .L131
.L127:
	mov r0, #1
	bl set_b
	mov r4, r0
	ldr r5, =0
	cmp r4, r5
	bne .L124
	b .L125
.L130:
	b .L131
.L131:
	ldr r4, addr_d
	ldr r5, [r4]
	mov r0, r5
	bl putint
	mov r0, #32
	bl putch
	ldr r4, [fp, #-24]
	ldr r5, =1
	cmp r5, r4
	movge r4, #1
	movlt r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L137
	b .L142
.L135:
	mov r0, #3
	bl set_d
	mov r4, r0
	ldr r5, =0
	cmp r4, r5
	bne .L130
	b .L131
.L137:
	b .L138
.L138:
	ldr r4, addr_d
	ldr r5, [r4]
	mov r0, r5
	bl putint
	mov r0, #10
	bl putch
	ldr r4, =1
	add  r5, r4, #2
	ldr r4, =3
	sub  r6, r4, r5
	ldr r4, =16
	cmp r6, r4
	ble .L144
	b .L145
.L142:
	mov r0, #4
	bl set_d
	mov r4, r0
	ldr r5, =0
	cmp r4, r5
	bne .L137
	b .L138
.L144:
	mov r0, #65
	bl putch
	b .L145
.L145:
	ldr r4, =3
	ldr r5, =6
	mul  r6, r4, r5
	ldr r4, =36
	sub  r5, r4, r6
	ldr r4, =25
	sub  r6, r4, #7
	cmp r5, r6
	bne .L147
	b .L148
.L147:
	mov r0, #66
	bl putch
	b .L148
.L148:
	ldr r4, =7
	ldr r5, =2
	sdiv  r6, r4, r5
	mul  r5, r6, r5
	sub  r6, r4, r5
	ldr r4, =8
	ldr r5, =1
	cmp r4, r5
	movgt r4, #1
	movle r4, #0
	mov r5, r4
	cmp r6, r5
	bne .L150
	b .L151
.L150:
	mov r0, #67
	bl putch
	b .L151
.L151:
	ldr r4, =4
	ldr r5, =3
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r4, r5
	beq .L155
	b .L156
.L155:
	mov r0, #68
	bl putch
	b .L156
.L156:
	ldr r4, =63
	ldr r5, =102
	cmp r4, r5
	movge r4, #1
	movlt r4, #0
	mov r5, r4
	ldr r4, =1
	cmp r5, r4
	beq .L160
	b .L161
.L160:
	mov r0, #69
	bl putch
	b .L161
.L161:
	ldr r4, =0
	ldr r5, =0
	cmp r4, r5
	moveq r4, #1
	movne r4, #0
	mov r5, r4
	ldr r4, =0
	sub  r6, r4, r5
	ldr r4, =5
	sub  r5, r4, #6
	cmp r6, r5
	beq .L165
	b .L166
.L165:
	mov r0, #70
	bl putch
	b .L166
.L166:
	mov r0, #10
	bl putch
	ldr r4, =0
	str r4, [fp, #-20]
	ldr r4, =1
	str r4, [fp, #-16]
	ldr r4, =2
	str r4, [fp, #-12]
	ldr r4, =3
	str r4, [fp, #-8]
	ldr r4, =4
	str r4, [fp, #-4]
	b .L175
.L175:
	ldr r4, [fp, #-20]
	ldr r5, =0
	cmp r4, r5
	bne .L179
	b .L177
.L176:
	mov r0, #32
	bl putch
	b .L175
.L177:
	ldr r4, [fp, #-20]
	ldr r5, =0
	cmp r4, r5
	bne .L181
	b .L184
.L179:
	ldr r4, [fp, #-16]
	ldr r5, =0
	cmp r4, r5
	bne .L176
	b .L177
.L181:
	mov r0, #67
	bl putch
	b .L182
.L182:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-20]
	cmp r4, r5
	movle r4, #1
	movgt r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L186
	b .L191
.L184:
	ldr r4, [fp, #-16]
	ldr r5, =0
	cmp r4, r5
	bne .L181
	b .L182
.L186:
	mov r0, #72
	bl putch
	b .L187
.L187:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-12]
	cmp r4, r5
	movle r4, #1
	movgt r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L200
	b .L196
.L191:
	ldr r4, [fp, #-20]
	ldr r5, [fp, #-16]
	cmp r4, r5
	movge r4, #1
	movlt r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L186
	b .L187
.L195:
	mov r0, #73
	bl putch
	b .L196
.L196:
	ldr r4, [fp, #-16]
	ldr r5, =0
	cmp r4, r5
	moveq r4, #1
	movne r4, #0
	ldr r5, [fp, #-20]
	mov r6, r4
	cmp r6, r5
	moveq r4, #1
	movne r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L211
	b .L215
.L200:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	cmp r4, r5
	movne r4, #1
	moveq r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L195
	b .L196
.L204:
	mov r0, #74
	bl putch
	b .L205
.L205:
	ldr r4, [fp, #-16]
	ldr r5, =0
	cmp r4, r5
	moveq r4, #1
	movne r4, #0
	ldr r5, [fp, #-20]
	mov r6, r4
	cmp r6, r5
	moveq r4, #1
	movne r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L219
	b .L226
.L211:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-8]
	cmp r4, r5
	movgt r4, #1
	movle r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L204
	b .L215
.L215:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-4]
	cmp r4, r5
	movle r4, #1
	movgt r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L204
	b .L205
.L219:
	mov r0, #75
	bl putch
	b .L220
.L220:
	mov r0, #10
	bl putch
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, r6, fp, lr}
	bx lr
.L226:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-8]
	cmp r4, r5
	movgt r4, #1
	movle r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L230
	b .L220
.L230:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-4]
	cmp r4, r5
	movle r4, #1
	movgt r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L219
	b .L220

addr_a:
	.word a
addr_b:
	.word b
addr_d:
	.word d
