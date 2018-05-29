	.file	"daxpy.c"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB0:
	.text
.LHOTB0:
	.globl	daxpy
	.type	daxpy, @function
daxpy:
.LFB20:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movq	%rsi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%r8, %rsi
	movq	%rdi, %rbx
	xorl	%edi, %edi
	movl	%edx, %r13d
	subq	$24, %rsp
	.cfi_def_cfa_offset 64
	movl	%ecx, %ebp
	movq	%r9, 8(%rsp)
	call	clock_gettime
	movq	8(%rsp), %r9
	xorl	%eax, %eax
.L2:
	cmpl	%eax, %ebp
	jbe	.L6
	movl	(%r12,%rax,4), %edx
	imull	%r13d, %edx
	addl	%edx, (%rbx,%rax,4)
	incq	%rax
	jmp	.L2
.L6:
	addq	$24, %rsp
	.cfi_def_cfa_offset 40
	movq	%r9, %rsi
	xorl	%edi, %edi
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	jmp	clock_gettime
	.cfi_endproc
.LFE20:
	.size	daxpy, .-daxpy
	.section	.text.unlikely
.LCOLDE0:
	.text
.LHOTE0:
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"ERROR: falta tam del vector y constante\n"
.LC3:
	.string	"y[0] = %i, y[%i] = %i\n"
.LC4:
	.string	"\nTiempo (seg.) = %11.9f\n"
	.section	.text.unlikely
.LCOLDB5:
	.section	.text.startup,"ax",@progbits
.LHOTB5:
	.globl	main
	.type	main, @function
main:
.LFB21:
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
	subq	$64, %rsp
	.cfi_def_cfa_offset 112
	movq	%fs:40, %rax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	cmpl	$2, %edi
	jg	.L8
	movq	stderr(%rip), %rsi
	movl	$.LC1, %edi
	call	fputs
	movl	$1, %edi
	call	exit
.L8:
	movq	8(%rsi), %rdi
	movq	%rsi, %rbp
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol
	movq	16(%rbp), %rdi
	movq	%rax, %rbx
	movl	$10, %edx
	movl	%ebx, %r12d
	xorl	%esi, %esi
	movl	%eax, %r13d
	salq	$2, %r12
	call	strtol
	movq	%r12, %rdi
	movq	%rax, %r14
	call	malloc
	movq	%r12, %rdi
	movq	%rax, %rbp
	call	malloc
	movq	%rax, %r12
	xorl	%eax, %eax
.L9:
	cmpl	%eax, %r13d
	jbe	.L13
	leal	2(%rax), %edx
	movl	%edx, 0(%rbp,%rax,4)
	leal	(%rax,%rax), %edx
	movl	%edx, (%r12,%rax,4)
	incq	%rax
	jmp	.L9
.L13:
	leaq	40(%rsp), %r9
	leaq	24(%rsp), %r8
	movl	%ebx, %ecx
	movl	%r14d, %edx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	daxpy
	movq	48(%rsp), %rax
	subq	32(%rsp), %rax
	movl	$.LC3, %esi
	movl	0(%rbp), %edx
	movl	$1, %edi
	cvtsi2sdq	%rax, %xmm0
	movq	40(%rsp), %rax
	subq	24(%rsp), %rax
	cvtsi2sdq	%rax, %xmm1
	leal	-1(%rbx), %eax
	movl	0(%rbp,%rax,4), %r8d
	movq	%rax, %rcx
	xorl	%eax, %eax
	divsd	.LC2(%rip), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, 8(%rsp)
	call	__printf_chk
	movsd	8(%rsp), %xmm0
	movl	$.LC4, %esi
	movl	$1, %edi
	movb	$1, %al
	call	__printf_chk
	movq	%rbp, %rdi
	call	free
	movq	%r12, %rdi
	call	free
	xorl	%eax, %eax
	movq	56(%rsp), %rcx
	xorq	%fs:40, %rcx
	je	.L11
	call	__stack_chk_fail
.L11:
	addq	$64, %rsp
	.cfi_def_cfa_offset 48
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
.LFE21:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE5:
	.section	.text.startup
.LHOTE5:
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC2:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
