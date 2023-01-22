	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global N
	.align 4
	.size N, 4
N:
	.word 10000
	.text
	.global long_array
	.type long_array , %function
long_array:
	push {r4, r5, r6, r7, r8, fp, lr}
	mov fp, sp
	mov r4, #54484
	add  r4, r4, #65536
	sub  sp, sp, r4
.L136:
	mov r4, #11052
	add  r4, r4, #16646144
	add  r4, r4, #-16777216
	str r0, [fp, r4]
	ldr r4, =0
	str r4, [fp, #-16]
	b .L143
.L143:
	ldr r4, addr_N
	ldr r5, [r4]
	ldr r4, [fp, #-16]
	cmp r5, r4
	bgt .L144
	b .L145
.L144:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-16]
	mul  r6, r5, r4
	ldr r4, =10
	sdiv  r5, r6, r4
	mul  r5, r5, r4
	sub  r4, r6, r5
	ldr r5, [fp, #-16]
	mov r6, #11056
	add  r6, r6, #16646144
	add  r6, r6, #-16777216
	mov r7, #4
	mul  r8, r5, r7
	add  r5, r6, r8
	add  r6, fp, r5
	str r4, [r6]
	ldr r4, [fp, #-16]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-16]
	b .L143
.L145:
	ldr r4, =0
	str r4, [fp, #-16]
	b .L147
.L147:
	ldr r4, addr_N
	ldr r5, [r4]
	ldr r4, [fp, #-16]
	cmp r5, r4
	bgt .L148
	b .L149
.L148:
	ldr r4, [fp, #-16]
	mov r5, #11056
	add  r5, r5, #16646144
	add  r5, r5, #-16777216
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, [r5]
	ldr r5, [fp, #-16]
	mov r6, #11056
	add  r6, r6, #16646144
	add  r6, r6, #-16777216
	mov r7, #4
	mul  r8, r5, r7
	add  r5, r6, r8
	add  r6, fp, r5
	ldr r5, [r6]
	mul  r6, r5, r4
	ldr r4, =10
	sdiv  r5, r6, r4
	mul  r4, r5, r4
	sub  r5, r6, r4
	ldr r4, [fp, #-16]
	mov r6, #51056
	add  r6, r6, #16646144
	add  r6, r6, #-16777216
	mov r7, #4
	mul  r8, r4, r7
	add  r4, r6, r8
	add  r6, fp, r4
	str r5, [r6]
	ldr r4, [fp, #-16]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-16]
	b .L147
.L149:
	ldr r4, =0
	str r4, [fp, #-16]
	b .L153
.L153:
	ldr r4, addr_N
	ldr r5, [r4]
	ldr r4, [fp, #-16]
	cmp r5, r4
	bgt .L154
	b .L155
.L154:
	ldr r4, [fp, #-16]
	mov r5, #51056
	add  r5, r5, #16646144
	add  r5, r5, #-16777216
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, [r5]
	ldr r5, [fp, #-16]
	mov r6, #51056
	add  r6, r6, #16646144
	add  r6, r6, #-16777216
	mov r7, #4
	mul  r8, r5, r7
	add  r5, r6, r8
	add  r6, fp, r5
	ldr r5, [r6]
	mul  r6, r5, r4
	ldr r4, =100
	sdiv  r5, r6, r4
	mul  r4, r5, r4
	sub  r5, r6, r4
	ldr r4, [fp, #-16]
	mov r6, #11056
	add  r6, r6, #16646144
	add  r6, r6, #-16777216
	mov r7, #4
	mul  r8, r4, r7
	add  r4, r6, r8
	add  r6, fp, r4
	ldr r4, [r6]
	add  r6, r4, r5
	ldr r4, [fp, #-16]
	mov r5, #25520
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	mov r7, #4
	mul  r8, r4, r7
	add  r4, r5, r8
	add  r5, fp, r4
	str r6, [r5]
	ldr r4, [fp, #-16]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-16]
	b .L153
.L155:
	ldr r4, =0
	str r4, [fp, #-12]
	ldr r4, =0
	str r4, [fp, #-16]
	b .L161
.L161:
	ldr r4, addr_N
	ldr r5, [r4]
	ldr r4, [fp, #-16]
	cmp r5, r4
	bgt .L162
	b .L163
.L162:
	ldr r4, [fp, #-16]
	ldr r5, =10
	cmp r5, r4
	bgt .L165
	b .L166
.L163:
	ldr r4, [fp, #-12]
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, fp, lr}
	bx lr
.L165:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-16]
	mov r6, #25520
	add  r6, r6, #16711680
	add  r6, r6, #-16777216
	mov r7, #4
	mul  r8, r5, r7
	add  r5, r6, r8
	add  r6, fp, r5
	ldr r5, [r6]
	add  r6, r5, r4
	ldr r4, =1333
	sdiv  r5, r6, r4
	mul  r5, r5, r4
	sub  r4, r6, r5
	str r4, [fp, #-12]
	ldr r4, [fp, #-12]
	mov r0, r4
	bl putint
	b .L167
.L166:
	ldr r4, [fp, #-16]
	ldr r5, =20
	cmp r5, r4
	bgt .L170
	b .L171
.L167:
	ldr r4, [fp, #-16]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-16]
	b .L161
.L170:
	ldr r4, addr_N
	ldr r5, [r4]
	ldr r4, =2
	sdiv  r6, r5, r4
	str r6, [fp, #-8]
	b .L175
.L171:
	ldr r4, [fp, #-16]
	ldr r5, =30
	cmp r5, r4
	bgt .L181
	b .L182
.L172:
	b .L167
.L175:
	ldr r4, addr_N
	ldr r5, [r4]
	ldr r4, [fp, #-8]
	cmp r5, r4
	bgt .L176
	b .L177
.L176:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-16]
	mov r6, #25520
	add  r6, r6, #16711680
	add  r6, r6, #-16777216
	mov r7, #4
	mul  r8, r5, r7
	add  r5, r6, r8
	add  r6, fp, r5
	ldr r5, [r6]
	add  r6, r5, r4
	ldr r4, [fp, #-8]
	mov r5, #11056
	add  r5, r5, #16646144
	add  r5, r5, #-16777216
	mov r7, #4
	mul  r8, r4, r7
	add  r4, r5, r8
	add  r5, fp, r4
	ldr r4, [r5]
	sub  r5, r6, r4
	str r5, [fp, #-12]
	ldr r4, [fp, #-8]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-8]
	b .L175
.L177:
	ldr r4, [fp, #-12]
	mov r0, r4
	bl putint
	b .L172
.L181:
	ldr r4, addr_N
	ldr r5, [r4]
	ldr r4, =2
	sdiv  r6, r5, r4
	str r6, [fp, #-4]
	b .L186
.L182:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-16]
	mov r6, #25520
	add  r6, r6, #16711680
	add  r6, r6, #-16777216
	mov r7, #4
	mul  r8, r5, r7
	add  r5, r6, r8
	add  r6, fp, r5
	ldr r5, [r6]
	mov r7, #11052
	add  r7, r7, #16646144
	add  r7, r7, #-16777216
	ldr r6, [fp, r7]
	mul  r7, r6, r5
	add  r5, r7, r4
	ldr r4, =99988
	sdiv  r6, r5, r4
	mul  r6, r6, r4
	sub  r4, r5, r6
	str r4, [fp, #-12]
	b .L183
.L183:
	b .L172
.L186:
	ldr r4, addr_N
	ldr r5, [r4]
	ldr r4, [fp, #-4]
	cmp r5, r4
	bgt .L187
	b .L188
.L187:
	ldr r4, [fp, #-4]
	ldr r5, =2233
	cmp r5, r4
	blt .L190
	b .L191
.L188:
	ldr r4, [fp, #-12]
	mov r0, r4
	bl putint
	b .L183
.L190:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-16]
	mov r6, #51056
	add  r6, r6, #16646144
	add  r6, r6, #-16777216
	mov r8, #4
	mul  r7, r5, r8
	add  r5, r6, r7
	add  r6, fp, r5
	ldr r5, [r6]
	add  r6, r5, r4
	ldr r4, [fp, #-4]
	mov r5, #11056
	add  r5, r5, #16646144
	add  r5, r5, #-16777216
	mov r7, #4
	mul  r8, r4, r7
	add  r4, r5, r8
	add  r5, fp, r4
	ldr r4, [r5]
	sub  r5, r6, r4
	str r5, [fp, #-12]
	ldr r4, [fp, #-4]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-4]
	b .L192
.L191:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-16]
	mov r6, #11056
	add  r6, r6, #16646144
	add  r6, r6, #-16777216
	mov r7, #4
	mul  r8, r5, r7
	add  r5, r6, r8
	add  r6, fp, r5
	ldr r5, [r6]
	add  r6, r5, r4
	ldr r4, [fp, #-4]
	mov r5, #25520
	add  r5, r5, #16711680
	add  r5, r5, #-16777216
	mov r7, #4
	mul  r8, r4, r7
	add  r4, r5, r8
	add  r5, fp, r4
	ldr r4, [r5]
	add  r5, r4, r6
	ldr r4, =13333
	sdiv  r6, r5, r4
	mul  r6, r6, r4
	sub  r4, r5, r6
	str r4, [fp, #-12]
	ldr r4, [fp, #-4]
	ldr r5, =2
	add  r6, r5, r4
	str r6, [fp, #-4]
	b .L192
.L192:
	b .L186

	.global main
	.type main , %function
main:
	push {r4, fp, lr}
	mov fp, sp
	sub  sp, sp, #0
.L199:
	mov r0, #9
	bl long_array
	mov r4, r0
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, fp, lr}
	bx lr

addr_N:
	.word N
