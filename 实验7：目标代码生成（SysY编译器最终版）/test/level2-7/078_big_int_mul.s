	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global len
	.align 4
	.size len, 4
len:
	.word 20
	.text
	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, r9, fp, lr}
	mov fp, sp
	mov r4, #548
	add  r4, r4, #0
	sub  sp, sp, r4
.L130:
	mov r4, #0
	mov r5, #65008
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =1
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =2
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =3
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =4
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =5
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =6
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =7
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =8
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =9
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =0
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =1
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =2
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =3
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =4
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =5
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =6
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =7
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =8
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =9
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =0
	str r5, [r4]
	mov r4, #0
	mov r5, #65088
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =2
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =3
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =4
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =2
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =5
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =7
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =9
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =9
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =0
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =1
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =9
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =8
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =7
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =6
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =4
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =3
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =2
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =1
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =2
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =2
	str r5, [r4]
	ldr r4, addr_len
	ldr r5, [r4]
	str r5, [fp, #-368]
	ldr r4, addr_len
	ldr r5, [r4]
	str r5, [fp, #-364]
	mov r4, #0
	mov r5, #-160
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, =0
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =0
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =0
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =0
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =0
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =0
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =0
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =0
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =0
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =0
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =0
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =0
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =0
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =0
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =0
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =0
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =0
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =0
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =0
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =0
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =0
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =0
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =0
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =0
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =0
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =0
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =0
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =0
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =0
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =0
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =0
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =0
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =0
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =0
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =0
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =0
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =0
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =0
	str r5, [r4]
	add  r5, r4, #4
	ldr r4, =0
	str r4, [r5]
	add  r4, r5, #4
	ldr r5, =0
	str r5, [r4]
	ldr r4, =0
	str r4, [fp, #-548]
	b .L223
.L223:
	mov r5, #65168
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	ldr r4, [fp, r5]
	mov r6, #64988
	add  r6, r6, #16711680
	add  r6, r6, #-16777216
	ldr r5, [fp, r6]
	cmp r4, r5
	bgt .L224
	b .L225
.L224:
	mov r5, #64988
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	ldr r4, [fp, r5]
	mov r5, #65008
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, [r5]
	mov r5, #64988
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	ldr r6, [fp, r5]
	mov r5, #65176
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r5, r8
	add  r5, fp, r6
	str r4, [r5]
	mov r4, #64988
	add  r4, r4, #16711680
	add  r4, r4, #-16777216
	ldr r5, [fp, r4]
	ldr r4, =1
	add  r6, r4, r5
	str r6, [fp, #-548]
	b .L223
.L225:
	ldr r4, =0
	str r4, [fp, #-548]
	b .L228
.L228:
	mov r5, #65172
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	ldr r4, [fp, r5]
	mov r6, #64988
	add  r6, r6, #16711680
	add  r6, r6, #-16777216
	ldr r5, [fp, r6]
	cmp r4, r5
	bgt .L229
	b .L230
.L229:
	mov r4, #64988
	add  r4, r4, #16711680
	add  r4, r4, #-16777216
	ldr r5, [fp, r4]
	mov r4, #65088
	add  r4, r4, #16711680
	add  r4, r4, #-16777216
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	add  r4, fp, r5
	ldr r5, [r4]
	mov r6, #64988
	add  r6, r6, #16711680
	add  r6, r6, #-16777216
	ldr r4, [fp, r6]
	mov r6, #65276
	add  r6, r6, #16711680
	add  r6, r6, #-16777216
	mov r8, #4
	mul  r7, r4, r8
	add  r4, r6, r7
	add  r6, fp, r4
	str r5, [r6]
	mov r5, #64988
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	ldr r4, [fp, r5]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-548]
	b .L228
.L230:
	mov r5, #65168
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	ldr r4, [fp, r5]
	mov r6, #65172
	add  r6, r6, #16711680
	add  r6, r6, #-16777216
	ldr r5, [fp, r6]
	add  r6, r5, r4
	sub  r4, r6, #1
	str r4, [fp, #-536]
	ldr r4, =0
	str r4, [fp, #-548]
	b .L233
.L233:
	mov r5, #65000
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	ldr r4, [fp, r5]
	mov r6, #64988
	add  r6, r6, #16711680
	add  r6, r6, #-16777216
	ldr r5, [fp, r6]
	cmp r4, r5
	bge .L234
	b .L235
.L234:
	mov r5, #64988
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	ldr r4, [fp, r5]
	mov r5, #-160
	mov r7, #4
	mul  r6, r4, r7
	add  r4, r5, r6
	add  r5, fp, r4
	ldr r4, =0
	str r4, [r5]
	mov r4, #64988
	add  r4, r4, #16711680
	add  r4, r4, #-16777216
	ldr r5, [fp, r4]
	ldr r4, =1
	add  r6, r4, r5
	str r6, [fp, #-548]
	b .L233
.L235:
	ldr r4, =0
	str r4, [fp, #-532]
	mov r5, #65172
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	ldr r4, [fp, r5]
	sub  r5, r4, #1
	str r5, [fp, #-548]
	b .L237
.L237:
	ldr r4, =0
	sub  r5, r4, #1
	mov r6, #64988
	add  r6, r6, #16711680
	add  r6, r6, #-16777216
	ldr r4, [fp, r6]
	cmp r5, r4
	blt .L238
	b .L239
.L238:
	mov r5, #64988
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	ldr r4, [fp, r5]
	mov r5, #65276
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, [r5]
	str r4, [fp, #-540]
	mov r4, #65168
	add  r4, r4, #16711680
	add  r4, r4, #-16777216
	ldr r5, [fp, r4]
	sub  r4, r5, #1
	str r4, [fp, #-544]
	b .L242
.L239:
	mov r4, #0
	mov r5, #-160
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, [r5]
	ldr r5, =0
	cmp r5, r4
	bne .L253
	b .L254
.L242:
	ldr r4, =0
	sub  r5, r4, #1
	mov r6, #64992
	add  r6, r6, #16711680
	add  r6, r6, #-16777216
	ldr r4, [fp, r6]
	cmp r5, r4
	blt .L243
	b .L244
.L243:
	mov r5, #65000
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	ldr r4, [fp, r5]
	mov r5, #-160
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, [r5]
	mov r5, #64996
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	ldr r6, [fp, r5]
	mov r7, #64992
	add  r7, r7, #16711680
	add  r7, r7, #-16777216
	ldr r5, [fp, r7]
	mov r7, #65176
	add  r7, r7, #16711680
	add  r7, r7, #-16777216
	mov r8, #4
	mul  r9, r5, r8
	add  r5, r7, r9
	add  r7, fp, r5
	ldr r5, [r7]
	mul  r7, r5, r6
	add  r5, r7, r4
	str r5, [fp, #-532]
	mov r5, #65004
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	ldr r4, [fp, r5]
	ldr r5, =10
	cmp r5, r4
	ble .L248
	b .L249
.L244:
	mov r5, #65000
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	ldr r4, [fp, r5]
	mov r5, #65168
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	ldr r6, [fp, r5]
	add  r5, r6, r4
	sub  r4, r5, #1
	str r4, [fp, #-536]
	mov r5, #64988
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	ldr r4, [fp, r5]
	sub  r5, r4, #1
	str r5, [fp, #-548]
	b .L237
.L248:
	mov r5, #65004
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	ldr r4, [fp, r5]
	mov r6, #65000
	add  r6, r6, #16711680
	add  r6, r6, #-16777216
	ldr r5, [fp, r6]
	mov r6, #-160
	mov r7, #4
	mul  r8, r5, r7
	add  r5, r6, r8
	add  r6, fp, r5
	str r4, [r6]
	mov r5, #65000
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	ldr r4, [fp, r5]
	sub  r5, r4, #1
	mov r4, #-160
	mov r6, #4
	mul  r7, r5, r6
	add  r5, r4, r7
	add  r4, fp, r5
	ldr r5, [r4]
	mov r6, #65004
	add  r6, r6, #16711680
	add  r6, r6, #-16777216
	ldr r4, [fp, r6]
	ldr r6, =10
	sdiv  r7, r4, r6
	add  r4, r7, r5
	mov r6, #65000
	add  r6, r6, #16711680
	add  r6, r6, #-16777216
	ldr r5, [fp, r6]
	sub  r6, r5, #1
	mov r5, #-160
	mov r7, #4
	mul  r8, r6, r7
	add  r6, r5, r8
	add  r5, fp, r6
	str r4, [r5]
	b .L250
.L249:
	mov r5, #65004
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	ldr r4, [fp, r5]
	mov r6, #65000
	add  r6, r6, #16711680
	add  r6, r6, #-16777216
	ldr r5, [fp, r6]
	mov r6, #-160
	mov r8, #4
	mul  r7, r5, r8
	add  r5, r6, r7
	add  r6, fp, r5
	str r4, [r6]
	b .L250
.L250:
	mov r5, #64992
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	ldr r4, [fp, r5]
	sub  r5, r4, #1
	str r5, [fp, #-544]
	mov r5, #65000
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	ldr r4, [fp, r5]
	sub  r5, r4, #1
	str r5, [fp, #-536]
	b .L242
.L253:
	mov r4, #0
	mov r5, #-160
	mov r7, #4
	mul  r6, r4, r7
	add  r4, r5, r6
	add  r5, fp, r4
	ldr r4, [r5]
	mov r0, r4
	bl putint
	b .L254
.L254:
	ldr r4, =1
	str r4, [fp, #-548]
	b .L258
.L258:
	mov r5, #65168
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	ldr r4, [fp, r5]
	mov r6, #65172
	add  r6, r6, #16711680
	add  r6, r6, #-16777216
	ldr r5, [fp, r6]
	add  r6, r5, r4
	sub  r4, r6, #1
	mov r5, #64988
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	ldr r6, [fp, r5]
	cmp r4, r6
	bge .L259
	b .L260
.L259:
	mov r5, #64988
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	ldr r4, [fp, r5]
	mov r5, #-160
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, [r5]
	mov r0, r4
	bl putint
	mov r5, #64988
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	ldr r4, [fp, r5]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-548]
	b .L258
.L260:
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, r9, fp, lr}
	bx lr

addr_len:
	.word len
