	.file	"pmm-secuencial-modA.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"falta size\n"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC2:
	.string	"Tiempo = %11.9f\t Primera = %d\t Ultima=%d\n"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB3:
	.section	.text.startup,"ax",@progbits
.LHOTB3:
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB38:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$88, %rsp
	.cfi_def_cfa_offset 144
	movq	%fs:40, %rax
	movq	%rax, 72(%rsp)
	xorl	%eax, %eax
	cmpl	$1, %edi
	jle	.L29
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol
	movq	%rax, 16(%rsp)
	movl	16(%rsp), %r13d
	movl	%eax, %r15d
	leaq	0(,%r13,8), %rbx
	movq	%rbx, %rdi
	call	malloc
	movq	%rbx, %rdi
	movq	%rax, %rbp
	call	malloc
	movq	%rbx, %rdi
	movq	%rax, %r12
	call	malloc
	movq	%rax, %r14
	movq	16(%rsp), %rax
	testl	%eax, %eax
	je	.L3
	subl	$1, %eax
	salq	$2, %r13
	xorl	%ebx, %ebx
	movl	%eax, 28(%rsp)
	leaq	8(,%rax,8), %rax
	movq	%rax, 8(%rsp)
.L4:
	movq	%r13, %rdi
	call	malloc
	movq	%r13, %rdi
	movq	%rax, 0(%rbp,%rbx)
	call	malloc
	movq	%r13, %rdi
	movq	%rax, (%r12,%rbx)
	call	malloc
	movq	%rax, (%r14,%rbx)
	addq	$8, %rbx
	cmpq	%rbx, 8(%rsp)
	jne	.L4
	xorl	%edi, %edi
.L7:
	movq	0(%rbp,%rdi,8), %rsi
	movq	(%r12,%rdi,8), %rcx
	xorl	%eax, %eax
	movq	(%r14,%rdi,8), %rdx
	.p2align 4,,10
	.p2align 3
.L6:
	movl	$0, (%rsi,%rax,4)
	movl	$6, (%rcx,%rax,4)
	movl	$4, (%rdx,%rax,4)
	addq	$1, %rax
	cmpl	%eax, %r15d
	ja	.L6
	addq	$1, %rdi
	cmpl	%edi, %r15d
	ja	.L7
	leaq	32(%rsp), %rsi
	xorl	%edi, %edi
	xorl	%ebx, %ebx
	call	clock_gettime
.L16:
	movq	0(%rbp,%rbx,8), %rdx
	movq	(%r12,%rbx,8), %r11
	xorl	%r10d, %r10d
	.p2align 4,,10
	.p2align 3
.L12:
	movl	(%r11,%r10,4), %edi
	movq	(%r14,%r10,8), %rsi
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L10:
	movl	(%rsi,%rax,4), %ecx
	imull	%edi, %ecx
	addl	%ecx, (%rdx,%rax,4)
	addq	$1, %rax
	cmpl	%eax, %r15d
	ja	.L10
	addq	$1, %r10
	cmpl	%r10d, %r15d
	ja	.L12
	addq	$1, %rbx
	cmpl	%ebx, %r15d
	ja	.L16
.L9:
	leaq	48(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movl	28(%rsp), %ebx
	pxor	%xmm0, %xmm0
	movq	0(%rbp), %rdx
	movl	$.LC2, %esi
	movl	$1, %edi
	movq	0(%rbp,%rbx,8), %rax
	movl	(%rdx), %edx
	leaq	8(,%rbx,8), %r13
	movl	(%rax,%rbx,4), %ecx
	movq	56(%rsp), %rax
	xorl	%ebx, %ebx
	subq	40(%rsp), %rax
	cvtsi2sdq	%rax, %xmm0
	movq	48(%rsp), %rax
	subq	32(%rsp), %rax
	movapd	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	divsd	.LC1(%rip), %xmm1
	cvtsi2sdq	%rax, %xmm0
	movl	$1, %eax
	addsd	%xmm1, %xmm0
	call	__printf_chk
	movl	16(%rsp), %eax
	testl	%eax, %eax
	je	.L15
.L18:
	movq	0(%rbp,%rbx), %rdi
	call	free
	movq	(%r12,%rbx), %rdi
	call	free
	movq	(%r14,%rbx), %rdi
	addq	$8, %rbx
	call	free
	cmpq	%r13, %rbx
	jne	.L18
.L15:
	movq	%rbp, %rdi
	call	free
	movq	%r12, %rdi
	call	free
	movq	%r14, %rdi
	call	free
	xorl	%eax, %eax
	movq	72(%rsp), %rbx
	xorq	%fs:40, %rbx
	jne	.L30
	addq	$88, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L3:
	.cfi_restore_state
	leaq	32(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movl	$-1, 28(%rsp)
	jmp	.L9
.L29:
	movq	stderr(%rip), %rcx
	movl	$.LC0, %edi
	movl	$11, %edx
	movl	$1, %esi
	call	fwrite
	orl	$-1, %edi
	call	exit
.L30:
	call	__stack_chk_fail
	.cfi_endproc
.LFE38:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE3:
	.section	.text.startup
.LHOTE3:
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
