	.file	"figura1-modB.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"R[0] = %i, R[39999] = %i\n"
.LC2:
	.string	"\nTiempo (seg.) = %11.9f\n"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB3:
	.section	.text.startup,"ax",@progbits
.LHOTB3:
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
	subq	$160072, %rsp
	.cfi_def_cfa_offset 160080
	xorl	%edi, %edi
	leaq	16(%rsp), %rsi
	movq	%fs:40, %rax
	movq	%rax, 160056(%rsp)
	xorl	%eax, %eax
	call	clock_gettime
	leaq	52(%rsp), %r10
	movl	$1, %ecx
	movl	$s+40000, %r9d
	.p2align 4,,10
	.p2align 3
.L2:
	movl	$s, %eax
	xorl	%esi, %esi
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L3:
	movl	(%rax), %edi
	addq	$32, %rax
	leal	(%rcx,%rdi,2), %edi
	addl	%edi, %edx
	movl	-28(%rax), %edi
	leal	(%rdi,%rdi,2), %r8d
	movl	-24(%rax), %edi
	subl	%ecx, %r8d
	leal	(%rcx,%rdi,2), %edi
	addl	%r8d, %esi
	addl	%edi, %edx
	movl	-20(%rax), %edi
	leal	(%rdi,%rdi,2), %edi
	subl	%ecx, %edi
	leal	(%rdi,%rsi), %r8d
	movl	-16(%rax), %esi
	leal	(%rcx,%rsi,2), %esi
	addl	%esi, %edx
	movl	-12(%rax), %esi
	leal	(%rsi,%rsi,2), %esi
	subl	%ecx, %esi
	leal	(%rsi,%r8), %edi
	movl	-8(%rax), %esi
	leal	(%rcx,%rsi,2), %esi
	addl	%esi, %edx
	movl	-4(%rax), %esi
	leal	(%rsi,%rsi,2), %esi
	subl	%ecx, %esi
	addl	%edi, %esi
	cmpq	%rax, %r9
	jne	.L3
	cmpl	%esi, %edx
	cmovg	%esi, %edx
	addl	$1, %ecx
	addq	$4, %r10
	movl	%edx, -4(%r10)
	cmpl	$40001, %ecx
	jne	.L2
	leaq	32(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movq	40(%rsp), %rax
	subq	24(%rsp), %rax
	movl	$.LC1, %esi
	pxor	%xmm0, %xmm0
	movl	160044(%rsp), %ecx
	movl	48(%rsp), %edx
	movl	$1, %edi
	cvtsi2sdq	%rax, %xmm0
	movq	32(%rsp), %rax
	subq	16(%rsp), %rax
	movapd	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	divsd	.LC0(%rip), %xmm1
	cvtsi2sdq	%rax, %xmm0
	xorl	%eax, %eax
	addsd	%xmm1, %xmm0
	movsd	%xmm0, 8(%rsp)
	call	__printf_chk
	movsd	8(%rsp), %xmm0
	movl	$.LC2, %esi
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk
	xorl	%eax, %eax
	movq	160056(%rsp), %rcx
	xorq	%fs:40, %rcx
	jne	.L9
	addq	$160072, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L9:
	.cfi_restore_state
	call	__stack_chk_fail
	.cfi_endproc
.LFE23:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE3:
	.section	.text.startup
.LHOTE3:
	.comm	s,40000,32
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
