	.text
	.file	"main.c"
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movl	$0, -24(%rbp)
	movl	$0, -8(%rbp)
	movl	$1, -4(%rbp)
	movl	$1, -16(%rbp)
	leaq	-12(%rbp), %rsi
	movl	$.L.str, %edi
	xorl	%eax, %eax
	callq	__isoc99_scanf
	cmpl	$99, -12(%rbp)
	jg	.LBB0_4
# %bb.1:
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	callq	printf
	movl	-8(%rbp), %esi
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	callq	printf
	movl	-4(%rbp), %esi
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	callq	printf
	jmp	.LBB0_2
	.p2align	4, 0x90
.LBB0_3:                                #   in Loop: Header=BB0_2 Depth=1
	movl	-4(%rbp), %esi
	movl	%esi, -20(%rbp)
	addl	-8(%rbp), %esi
	movl	%esi, -4(%rbp)
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	callq	printf
	movl	-20(%rbp), %eax
	movl	%eax, -8(%rbp)
	addl	$1, -16(%rbp)
.LBB0_2:                                # =>This Inner Loop Header: Depth=1
	movl	-16(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jl	.LBB0_3
.LBB0_4:
	xorl	%eax, %eax
	addq	$32, %rsp
	popq	%rbp
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%d"
	.size	.L.str, 3

	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.asciz	"success"
	.size	.L.str.1, 8

	.type	.L.str.2,@object        # @.str.2
.L.str.2:
	.asciz	"%d\n"
	.size	.L.str.2, 4


	.ident	"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"
	.section	".note.GNU-stack","",@progbits
