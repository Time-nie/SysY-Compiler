@数据段
@全局变量及常量的声明
	.data
a:
    .word 0
b:
	.word 1
i:
	.word 1
t:
	.word 0
n:
	.word 0

@代码段
    .text
    .align 4
res: 
    .asciz "fibo: %d \n"
	.align 4
info:
	.asciz "please input the number of Fibonacci: "
input: 
	.asciz "%d"
	.align 4
	
@主函数
	.global main
	.type main, %function
main:
	@mov r7, lr
	push {fp, lr}  @保存返回地址栈基地址

.input:
	adr r0, info   @读取字info字符串地址
	bl printf     @调用printf函数输出
	mov r8, lr
	adr r0, input
	sub sp, sp, #4   @留出一个4字节的空间，保存用户输入
	mov r1, sp
	bl scanf   
	ldr r2, [sp, #0]
	ldr r1, addr_n0
	str r2, [r1]  @保存n到对应地址中
	add sp, sp, #4
	mov lr, r8

.params:
	mov r0, r2
	ldr r4, addr_i0
	ldr r4, [r4]    @ 变量i
	ldr r3, addr_b0
	ldr r3, [r3]    @ 变量b
	ldr r6, addr_a0
	ldr r6, [r6]    @ 变量a

.LOOP1:
	mov r5, r3      @ t=b
	add r3, r3, r6  @ b=a+b
	push {r0,r1,r2,r3}
	adr r0, res     @准备printf的参数
	mov r1, r3
	bl printf       @ 调用printf函数 
	pop {r0,r1,r2,r3}

	mov r6, r5      @ a=t
	add r4, #1      @ i=i+1
	cmp r4, r0      @ 判断i与n大小关系
	bne .LOOP1      @ 当i<n时跳转至loop1继续循环

.Array:
	add	fp, sp, #0        @ 提升fp指向sp
	sub	sp, sp, #16       @ 准备16的空间，因为我们有a[2][2]共16字节
	@ 局部变量a[2][2]的空间位于sp到sp+12的位置，从低地址向高地址增长
	mov r0, #2
	str r0, [sp]		    @ a[0][0] = 2
	str r0, [sp, #8]		@ a[1][0] = 2
	str r0, [sp, #12]		@ a[1][1] = 2
	mov r0, #0
	str r0, [sp, #4]		@ a[0][1] = 0
	
	mov r1, sp		        @ 准备putarray()第二个参数，r1 = a的地址
	mov r0, #4				@ 准备putarray()第一个参数，输出4个整数的数组
	bl	putarray(PLT)       @ 调用putarray()

	mov r0, #0			    @ return 0; r0存储函数返回值
	add sp, sp, #16		    @ 回收栈空间

	pop		{fp}            @返回地址出栈
	pop		{lr}
	bx   lr				    @ 返回

.end:
	@mov lr, r7  
	@bx lr                  @ 退出
	pop {pc}

@桥接全局变量的地址
addr_a0:
	.word a
addr_b0:
	.word b
addr_i0:
	.word i
addr_t0:
	.word t
addr_n0:
	.word n
	
	.section   .note.GNU-stack,"",%progbits




	