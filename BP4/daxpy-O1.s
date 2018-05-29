	.file	"daxpy.c"
	.text
	.globl	daxpy
	.type	daxpy, @function
daxpy:
.LFB38:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movq	%rdi, %rbx
	movq	%rsi, %r12
	movl	%edx, %r13d
	movl	%ecx, %ebp
	movq	%r9, %r14
	movq	%r8, %rsi
	movl	$0, %edi
	call	clock_gettime
	testl	%ebp, %ebp
	je	.L2
	movl	$0, %eax
.L3:
	movl	%r13d, %edx
	imull	(%r12,%rax,4), %edx
	addl	%edx, (%rbx,%rax,4)
	addq	$1, %rax
	cmpl	%eax, %ebp
	ja	.L3
.L2:
	movq	%r14, %rsi
	movl	$0, %edi
	call	clock_gettime
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE38:
	.size	daxpy, .-daxpy
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"ERROR: falta tam del vector y constante\n"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"y[0] = %i, y[%i] = %i\n"
.LC3:
	.string	"\nTiempo (seg.) = %11.9f\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB39:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$72, %rsp
	.cfi_def_cfa_offset 112
	movq	%fs:40, %rax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	cmpl	$2, %edi
	jg	.L7
	movq	stderr(%rip), %rcx
	movl	$40, %edx
	movl	$1, %esi
	movl	$.LC0, %edi
	call	fwrite
	movl	$1, %edi
	call	exit
.L7:
	movq	%rsi, %rbx
	movq	8(%rsi), %rdi
	movl	$10, %edx
	movl	$0, %esi
	call	strtol
	movq	%rax, %r12
	movq	16(%rbx), %rdi
	movl	$10, %edx
	movl	$0, %esi
	call	strtol
	movq	%rax, %r13
	movl	%r12d, %ebp
	salq	$2, %rbp
	movq	%rbp, %rdi
	call	malloc
	movq	%rax, %rbx
	movq	%rbp, %rdi
	call	malloc
	movq	%rax, %rbp
	testl	%r12d, %r12d
	je	.L8
	leal	2(%r12), %esi
	movl	$0, %ecx
	movl	$0, %edx
	movl	$2, %eax
.L9:
	movl	%eax, (%rbx,%rdx)
	movl	%ecx, 0(%rbp,%rdx)
	addl	$1, %eax
	addq	$4, %rdx
	addl	$2, %ecx
	cmpl	%esi, %eax
	jne	.L9
.L8:
	leaq	32(%rsp), %r9
	leaq	16(%rsp), %r8
	movl	%r12d, %ecx
	movl	%r13d, %edx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	daxpy
	movq	40(%rsp), %rax
	subq	24(%rsp), %rax
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	divsd	.LC1(%rip), %xmm0
	movq	32(%rsp), %rax
	subq	16(%rsp), %rax
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, 8(%rsp)
	leal	-1(%r12), %ecx
	movl	%ecx, %eax
	movl	(%rbx,%rax,4), %r8d
	movl	(%rbx), %edx
	movl	$.LC2, %esi
	movl	$1, %edi
	movl	$0, %eax
	call	__printf_chk
	movsd	8(%rsp), %xmm0
	movl	$.LC3, %esi
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk
	movq	%rbx, %rdi
	call	free
	movq	%rbp, %rdi
	call	free
	movl	$0, %eax
	movq	56(%rsp), %rdi
	xorq	%fs:40, %rdi
	je	.L10
	call	__stack_chk_fail
.L10:
	addq	$72, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE39:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
