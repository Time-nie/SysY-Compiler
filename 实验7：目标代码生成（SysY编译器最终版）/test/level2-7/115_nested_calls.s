	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.text
	.global func1
	.type func1 , %function
func1:
	push {r4, r5, r6, r7, fp, lr}
	mov fp, sp
	sub  sp, sp, #12
.L132:
	str r0, [fp, #-12]
	str r1, [fp, #-8]
	str r2, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, =0
	cmp r5, r4
	beq .L139
	b .L140
.L139:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-8]
	mul  r6, r5, r4
	mov r0, r6
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
	b .L141
.L140:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-8]
	ldr r6, [fp, #-4]
	sub  r7, r5, r6
	mov r0, r4
	mov r1, r7
	mov r2, #0
	bl func1
	mov r4, r0
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, fp, lr}
	bx lr
	b .L141
.L141:
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, fp, lr}
	bx lr

	.global func2
	.type func2 , %function
func2:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub  sp, sp, #8
.L143:
	str r0, [fp, #-8]
	str r1, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, =0
	cmp r4, r5
	bne .L148
	b .L149
.L148:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	sdiv  r6, r4, r5
	mul  r6, r6, r5
	sub  r5, r4, r6
	mov r0, r5
	mov r1, #0
	bl func2
	mov r4, r0
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, fp, lr}
	bx lr
	b .L150
.L149:
	ldr r4, [fp, #-8]
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, fp, lr}
	bx lr
	b .L150
.L150:
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, r6, fp, lr}
	bx lr

	.global func3
	.type func3 , %function
func3:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub  sp, sp, #8
.L152:
	str r0, [fp, #-8]
	str r1, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, =0
	cmp r5, r4
	beq .L157
	b .L158
.L157:
	ldr r4, [fp, #-8]
	ldr r5, =1
	add  r6, r5, r4
	mov r0, r6
	sub  sp, fp, #0
	pop {r4, r5, r6, fp, lr}
	bx lr
	b .L159
.L158:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	add  r6, r5, r4
	mov r0, r6
	mov r1, #0
	bl func3
	mov r4, r0
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, fp, lr}
	bx lr
	b .L159
.L159:
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, r6, fp, lr}
	bx lr

	.global func4
	.type func4 , %function
func4:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub  sp, sp, #12
.L161:
	str r0, [fp, #-12]
	str r1, [fp, #-8]
	str r2, [fp, #-4]
	ldr r4, [fp, #-12]
	ldr r5, =0
	cmp r4, r5
	bne .L168
	b .L169
.L168:
	ldr r4, [fp, #-8]
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, fp, lr}
	bx lr
	b .L170
.L169:
	ldr r4, [fp, #-4]
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, fp, lr}
	bx lr
	b .L170
.L170:
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, fp, lr}
	bx lr

	.global func5
	.type func5 , %function
func5:
	push {r4, r5, r6, fp, lr}
	mov fp, sp
	sub  sp, sp, #4
.L172:
	str r0, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, =0
	sub  r6, r5, r4
	mov r0, r6
	sub  sp, fp, #0
	pop {r4, r5, r6, fp, lr}
	bx lr

	.global func6
	.type func6 , %function
func6:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub  sp, sp, #8
.L175:
	str r0, [fp, #-8]
	str r1, [fp, #-4]
	ldr r4, [fp, #-8]
	ldr r5, =0
	cmp r4, r5
	bne .L184
	b .L181
.L180:
	mov r0, #1
	sub  sp, fp, #0
	pop {r4, r5, fp, lr}
	bx lr
	b .L182
.L181:
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, fp, lr}
	bx lr
	b .L182
.L182:
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, fp, lr}
	bx lr
.L184:
	ldr r4, [fp, #-4]
	ldr r5, =0
	cmp r4, r5
	bne .L180
	b .L181

	.global func7
	.type func7 , %function
func7:
	push {r4, r5, fp, lr}
	mov fp, sp
	sub  sp, sp, #4
.L186:
	str r0, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, =0
	cmp r4, r5
	beq .L189
	b .L190
.L189:
	mov r0, #1
	sub  sp, fp, #0
	pop {r4, r5, fp, lr}
	bx lr
	b .L191
.L190:
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, fp, lr}
	bx lr
	b .L191
.L191:
	mov r0, #0
	sub  sp, fp, #0
	pop {r4, r5, fp, lr}
	bx lr

	.global main
	.type main , %function
main:
	push {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov fp, sp
	sub  sp, sp, #76
.L193:
	bl getint
	mov r4, r0
	str r4, [fp, #-64]
	bl getint
	mov r4, r0
	str r4, [fp, #-60]
	bl getint
	mov r4, r0
	str r4, [fp, #-56]
	bl getint
	mov r4, r0
	str r4, [fp, #-52]
	ldr r4, =0
	str r4, [fp, #-8]
	b .L200
.L200:
	ldr r4, [fp, #-8]
	ldr r5, =10
	cmp r5, r4
	bgt .L201
	b .L202
.L201:
	bl getint
	mov r4, r0
	ldr r5, [fp, #-8]
	mov r6, #-48
	mov r7, #4
	mul  r8, r5, r7
	add  r5, r6, r8
	add  r6, fp, r5
	str r4, [r6]
	ldr r4, [fp, #-8]
	ldr r5, =1
	add  r6, r5, r4
	str r6, [fp, #-8]
	b .L200
.L202:
	ldr r4, [fp, #-64]
	mov r0, r4
	bl func7
	mov r4, r0
	ldr r5, [fp, #-60]
	mov r0, r5
	bl func5
	mov r5, r0
	mov r0, r4
	mov r1, r5
	bl func6
	mov r4, r0
	ldr r5, [fp, #-56]
	mov r0, r4
	mov r1, r5
	bl func2
	mov r4, r0
	ldr r5, [fp, #-52]
	mov r0, r4
	mov r1, r5
	bl func3
	mov r4, r0
	mov r0, r4
	bl func5
	mov r4, r0
	str r4, [fp, #-72]
	mov r4, #0
	mov r5, #-48
	mov r6, #4
	mul  r7, r4, r6
	add  r4, r5, r7
	add  r5, fp, r4
	ldr r4, [r5]
	str r4, [fp, #-68]
	mov r4, #1
	mov r5, #-48
	mov r7, #4
	mul  r6, r4, r7
	add  r4, r5, r6
	add  r5, fp, r4
	ldr r4, [r5]
	mov r0, r4
	bl func5
	mov r4, r0
	mov r5, #2
	mov r6, #-48
	mov r7, #4
	mul  r8, r5, r7
	add  r5, r6, r8
	add  r6, fp, r5
	ldr r5, [r6]
	mov r6, #3
	mov r7, #-48
	mov r8, #4
	mul  r9, r6, r8
	add  r6, r7, r9
	add  r7, fp, r6
	ldr r6, [r7]
	mov r0, r6
	bl func7
	mov r6, r0
	mov r0, r5
	mov r1, r6
	bl func6
	mov r5, r0
	mov r6, #4
	mov r7, #-48
	mov r8, #4
	mul  r9, r6, r8
	add  r6, r7, r9
	add  r7, fp, r6
	ldr r6, [r7]
	mov r7, #5
	mov r8, #-48
	mov r9, #4
	mul  r10, r7, r9
	add  r7, r8, r10
	add  r8, fp, r7
	ldr r7, [r8]
	mov r0, r7
	bl func7
	mov r7, r0
	mov r0, r6
	mov r1, r7
	bl func2
	mov r6, r0
	mov r0, r4
	mov r1, r5
	mov r2, r6
	bl func4
	mov r4, r0
	mov r5, #6
	mov r6, #-48
	mov r7, #4
	mul  r8, r5, r7
	add  r5, r6, r8
	add  r6, fp, r5
	ldr r5, [r6]
	mov r0, r4
	mov r1, r5
	bl func3
	mov r4, r0
	mov r5, #7
	mov r6, #-48
	mov r7, #4
	mul  r8, r5, r7
	add  r5, r6, r8
	add  r6, fp, r5
	ldr r5, [r6]
	mov r0, r4
	mov r1, r5
	bl func2
	mov r4, r0
	mov r5, #8
	mov r6, #-48
	mov r7, #4
	mul  r8, r5, r7
	add  r5, r6, r8
	add  r6, fp, r5
	ldr r5, [r6]
	mov r6, #9
	mov r7, #-48
	mov r9, #4
	mul  r8, r6, r9
	add  r6, r7, r8
	add  r7, fp, r6
	ldr r6, [r7]
	mov r0, r6
	bl func7
	mov r6, r0
	mov r0, r5
	mov r1, r6
	bl func3
	mov r5, r0
	ldr r6, [fp, #-64]
	mov r0, r4
	mov r1, r5
	mov r2, r6
	bl func1
	mov r4, r0
	ldr r5, [fp, #-72]
	mov r0, r5
	ldr r5, [fp, #-68]
	mov r1, r5
	mov r2, r4
	bl func4
	mov r4, r0
	ldr r5, [fp, #-60]
	ldr r6, [fp, #-56]
	mov r0, r6
	bl func7
	mov r6, r0
	ldr r7, [fp, #-52]
	mov r0, r6
	mov r1, r7
	bl func3
	mov r6, r0
	mov r0, r5
	mov r1, r6
	bl func2
	mov r5, r0
	mov r0, r4
	mov r1, r5
	bl func3
	mov r4, r0
	mov r5, #0
	mov r6, #-48
	mov r7, #4
	mul  r8, r5, r7
	add  r5, r6, r8
	add  r6, fp, r5
	ldr r5, [r6]
	mov r6, #1
	mov r7, #-48
	mov r8, #4
	mul  r9, r6, r8
	add  r6, r7, r9
	add  r7, fp, r6
	ldr r6, [r7]
	mov r0, r4
	mov r1, r5
	mov r2, r6
	bl func1
	mov r4, r0
	mov r5, #2
	mov r6, #-48
	mov r7, #4
	mul  r8, r5, r7
	add  r5, r6, r8
	add  r6, fp, r5
	ldr r5, [r6]
	mov r0, r4
	mov r1, r5
	bl func2
	mov r4, r0
	mov r5, #3
	mov r6, #-48
	mov r8, #4
	mul  r7, r5, r8
	add  r5, r6, r7
	add  r6, fp, r5
	ldr r5, [r6]
	str r5, [fp, #-76]
	mov r5, #4
	mov r6, #-48
	mov r7, #4
	mul  r8, r5, r7
	add  r5, r6, r8
	add  r6, fp, r5
	ldr r5, [r6]
	mov r6, #5
	mov r7, #-48
	mov r9, #4
	mul  r8, r6, r9
	add  r6, r7, r8
	add  r7, fp, r6
	ldr r6, [r7]
	mov r0, r6
	bl func5
	mov r6, r0
	mov r0, r5
	mov r1, r6
	bl func3
	mov r5, r0
	mov r6, #6
	mov r7, #-48
	mov r8, #4
	mul  r9, r6, r8
	add  r6, r7, r9
	add  r7, fp, r6
	ldr r6, [r7]
	mov r0, r6
	bl func5
	mov r6, r0
	mov r0, r5
	mov r1, r6
	bl func2
	mov r5, r0
	mov r6, #7
	mov r7, #-48
	mov r8, #4
	mul  r9, r6, r8
	add  r6, r7, r9
	add  r7, fp, r6
	ldr r6, [r7]
	mov r7, #8
	mov r8, #-48
	mov r9, #4
	mul  r10, r7, r9
	add  r7, r8, r10
	add  r8, fp, r7
	ldr r7, [r8]
	mov r0, r7
	bl func7
	mov r7, r0
	mov r0, r5
	mov r1, r6
	mov r2, r7
	bl func1
	mov r5, r0
	mov r6, #9
	mov r7, #-48
	mov r9, #4
	mul  r8, r6, r9
	add  r6, r7, r8
	add  r7, fp, r6
	ldr r6, [r7]
	mov r0, r6
	bl func5
	mov r6, r0
	mov r0, r5
	mov r1, r6
	bl func2
	mov r5, r0
	ldr r6, [fp, #-64]
	mov r0, r5
	mov r1, r6
	bl func3
	mov r5, r0
	mov r0, r4
	ldr r4, [fp, #-76]
	mov r1, r4
	mov r2, r5
	bl func1
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	sub  sp, fp, #0
	pop {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx lr

