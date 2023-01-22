	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global INF
	.align 4
	.size INF, 4
INF:
	.word 65535
	.balign 4
	e: .skip 1024
	.balign 4
	book: .skip 64
	.balign 4
	dis: .skip 64
	.global n
	.align 4
	.size n, 4
n:
	.word 0
	.global m
	.align 4
	.size m, 4
m:
	.word 0
	.global v1
	.align 4
	.size v1, 4
v1:
	.word 0
	.global v2
	.align 4
	.size v2, 4
v2:
	.word 0
	.global w
	.align 4
	.size w, 4
w:
	.word 0
	.text
	.global Dijkstra
	.type Dijkstra , %function
Dijkstra:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub  sp, sp, #24
.L141:
	ldr r4, =1
	str r4, [fp, #-24]
	b .L144
.L144:
	ldr r4, addr_n
	ldr r5, [r4]
	ldr r4, [fp, #-24]
	cmp r5, r4
	bge .L145
	b .L146
.L145:
	mov r4, #1
	ldr r5, addr_e
	mov r6, #64
	mul  r7, r4, r6
	add  r4, r5, r7
	mov r5, r4
	ldr r4, [fp, #-24]
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	ldr r5, [r4]
	ldr r4, [fp, #-24]
	ldr r6, addr_dis
	mov r7, #4
	mul  r8, r4, r7
	add  r4, r6, r8
	mov r6, r4
	str r5, [r6]
	ldr r4, [fp, #-24]
	ldr r5, addr_book
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	mov r5, r4
	ldr r4, =0
	str r4, [r5]
	ldr r4, [fp, #-24]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-24]
	b .L144
.L146:
	mov r4, #1
	ldr r5, addr_book
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	mov r5, r4
	ldr r4, =1
	str r4, [r5]
	ldr r4, =1
	str r4, [fp, #-24]
	b .L150
.L150:
	ldr r4, addr_n
	ldr r5, [r4]
	sub  r4, r5, #1
	ldr r5, [fp, #-24]
	cmp r4, r5
	bge .L151
	b .L152
.L151:
	ldr r4, addr_INF
	ldr r5, [r4]
	str r5, [fp, #-16]
	ldr r4, =0
	str r4, [fp, #-12]
	ldr r4, =1
	str r4, [fp, #-8]
	b .L157
.L152:
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L157:
	ldr r4, addr_n
	ldr r5, [r4]
	ldr r4, [fp, #-8]
	cmp r5, r4
	bge .L158
	b .L159
.L158:
	ldr r4, [fp, #-8]
	ldr r5, addr_dis
	mov r7, #4
	mul  r6, r4, r7
	add  r4, r5, r6
	mov r5, r4
	ldr r4, [r5]
	ldr r5, [fp, #-16]
	cmp r4, r5
	movlt r4, #1
	movge r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L167
	b .L162
.L159:
	ldr r4, [fp, #-12]
	ldr r5, addr_book
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	mov r5, r4
	ldr r4, =1
	str r4, [r5]
	ldr r4, =1
	str r4, [fp, #-4]
	b .L174
.L161:
	ldr r4, [fp, #-8]
	ldr r5, addr_dis
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	str r4, [fp, #-16]
	ldr r4, [fp, #-8]
	str r4, [fp, #-12]
	b .L162
.L162:
	ldr r4, [fp, #-8]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-8]
	b .L157
.L167:
	ldr r4, [fp, #-8]
	ldr r5, addr_book
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	ldr r5, =0
	cmp r5, r4
	moveq r4, #1
	movne r4, #0
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	bne .L161
	b .L162
.L174:
	ldr r4, addr_n
	ldr r5, [r4]
	ldr r4, [fp, #-4]
	cmp r5, r4
	bge .L175
	b .L176
.L175:
	ldr r4, addr_INF
	ldr r5, [r4]
	ldr r4, [fp, #-12]
	ldr r6, addr_e
	mov r7, #64
	mul  r8, r4, r7
	add  r4, r6, r8
	mov r6, r4
	ldr r4, [fp, #-4]
	mov r8, #4
	mul  r7, r4, r8
	add  r4, r6, r7
	ldr r6, [r4]
	cmp r5, r6
	bgt .L178
	b .L179
.L176:
	ldr r4, [fp, #-24]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-24]
	b .L150
.L178:
	ldr r4, [fp, #-12]
	ldr r5, addr_dis
	mov r7, #4
	mul  r6, r4, r7
	add  r4, r5, r6
	mov r5, r4
	ldr r4, [r5]
	ldr r5, [fp, #-12]
	ldr r6, addr_e
	mov r7, #64
	mul  r8, r5, r7
	add  r5, r6, r8
	mov r6, r5
	ldr r5, [fp, #-4]
	mov r7, #4
	mul  r8, r5, r7
	add  r5, r6, r8
	ldr r6, [r5]
	add  r5, r6, r4
	ldr r4, [fp, #-4]
	ldr r6, addr_dis
	mov r7, #4
	mul  r8, r4, r7
	add  r4, r6, r8
	mov r6, r4
	ldr r4, [r6]
	cmp r5, r4
	blt .L183
	b .L184
.L179:
	ldr r4, [fp, #-4]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-4]
	b .L174
.L183:
	ldr r4, [fp, #-12]
	ldr r5, addr_dis
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	ldr r5, [fp, #-12]
	ldr r6, addr_e
	mov r7, #64
	mul  r8, r5, r7
	add  r5, r6, r8
	mov r6, r5
	ldr r5, [fp, #-4]
	mov r7, #4
	mul  r8, r5, r7
	add  r5, r6, r8
	ldr r6, [r5]
	add  r5, r6, r4
	ldr r4, [fp, #-4]
	ldr r6, addr_dis
	mov r7, #4
	mul  r8, r4, r7
	add  r4, r6, r8
	mov r6, r4
	str r5, [r6]
	b .L184
.L184:
	b .L179

	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	sub  sp, sp, #16
.L193:
	bl getint
	mov r4, r0
	ldr r5, addr_n
	str r4, [r5]
	bl getint
	mov r4, r0
	ldr r5, addr_m
	str r4, [r5]
	ldr r4, =1
	str r4, [fp, #-16]
	b .L195
.L195:
	ldr r4, addr_n
	ldr r5, [r4]
	ldr r4, [fp, #-16]
	cmp r5, r4
	bge .L196
	b .L197
.L196:
	ldr r4, =1
	str r4, [fp, #-12]
	b .L200
.L197:
	ldr r4, =1
	str r4, [fp, #-16]
	b .L210
.L200:
	ldr r4, addr_n
	ldr r5, [r4]
	ldr r4, [fp, #-12]
	cmp r5, r4
	bge .L201
	b .L202
.L201:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-16]
	cmp r4, r5
	beq .L204
	b .L205
.L202:
	ldr r4, [fp, #-16]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-16]
	b .L195
.L204:
	ldr r4, [fp, #-16]
	ldr r5, addr_e
	mov r6, #64
	mul  r7, r4, r6
	add  r4, r5, r7
	mov r5, r4
	ldr r4, [fp, #-12]
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	ldr r5, =0
	str r5, [r4]
	b .L206
.L205:
	ldr r4, addr_INF
	ldr r5, [r4]
	ldr r4, [fp, #-16]
	ldr r6, addr_e
	mov r7, #64
	mul  r8, r4, r7
	add  r4, r6, r8
	mov r6, r4
	ldr r4, [fp, #-12]
	mov r8, #4
	mul  r7, r4, r8
	add  r4, r6, r7
	str r5, [r4]
	b .L206
.L206:
	ldr r4, [fp, #-12]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-12]
	b .L200
.L210:
	ldr r4, addr_m
	ldr r5, [r4]
	ldr r4, [fp, #-16]
	cmp r5, r4
	bge .L211
	b .L212
.L211:
	bl getint
	mov r4, r0
	str r4, [fp, #-8]
	bl getint
	mov r4, r0
	str r4, [fp, #-4]
	bl getint
	mov r4, r0
	ldr r5, [fp, #-8]
	ldr r6, addr_e
	mov r7, #64
	mul  r8, r5, r7
	add  r5, r6, r8
	mov r6, r5
	ldr r5, [fp, #-4]
	mov r7, #4
	mul  r8, r5, r7
	add  r5, r6, r8
	str r4, [r5]
	ldr r4, [fp, #-16]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-16]
	b .L210
.L212:
	bl Dijkstra
	ldr r4, =1
	str r4, [fp, #-16]
	b .L217
.L217:
	ldr r4, addr_n
	ldr r5, [r4]
	ldr r4, [fp, #-16]
	cmp r5, r4
	bge .L218
	b .L219
.L218:
	ldr r4, [fp, #-16]
	ldr r5, addr_dis
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	mov r5, r4
	ldr r4, [r5]
	mov r0, r4
	bl putint
	mov r0, #32
	bl putch
	ldr r4, [fp, #-16]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-16]
	b .L217
.L219:
	mov r0, #10
	bl putch
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr

addr_INF:
	.word INF
addr_e:
	.word e
addr_book:
	.word book
addr_dis:
	.word dis
addr_n:
	.word n
addr_m:
	.word m
addr_v1:
	.word v1
addr_v2:
	.word v2
addr_w:
	.word w
