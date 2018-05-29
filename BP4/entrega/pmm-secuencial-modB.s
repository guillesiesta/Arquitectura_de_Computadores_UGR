	.file	"pmm-secuencial-modB.c"
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
	subq	$152, %rsp
	.cfi_def_cfa_offset 208
	movq	%fs:40, %rax
	movq	%rax, 136(%rsp)
	xorl	%eax, %eax
	cmpl	$1, %edi
	jle	.L35
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol
	movl	%eax, %ebp
	movq	%rax, %r12
	movq	%rax, 80(%rsp)
	leaq	0(,%rbp,8), %rbx
	movl	%eax, %r15d
	movq	%rbx, %rdi
	call	malloc
	movq	%rbx, %rdi
	movq	%rax, %r13
	movq	%rax, 72(%rsp)
	call	malloc
	movq	%rbx, %rdi
	movq	%rax, %r14
	movq	%rax, 24(%rsp)
	call	malloc
	testl	%r12d, %r12d
	movq	%rax, %rcx
	movq	%rax, 32(%rsp)
	je	.L3
	movl	%r12d, %eax
	movl	%r15d, 8(%rsp)
	salq	$2, %rbp
	subl	$1, %eax
	xorl	%ebx, %ebx
	movq	%rcx, %r15
	leaq	8(,%rax,8), %r12
	movl	%eax, 92(%rsp)
.L4:
	movq	%rbp, %rdi
	call	malloc
	movq	%rbp, %rdi
	movq	%rax, 0(%r13,%rbx)
	call	malloc
	movq	%rbp, %rdi
	movq	%rax, (%r14,%rbx)
	call	malloc
	movq	%rax, (%r15,%rbx)
	addq	$8, %rbx
	cmpq	%rbx, %r12
	jne	.L4
	movl	8(%rsp), %r15d
	movq	72(%rsp), %r8
	xorl	%edi, %edi
	movq	24(%rsp), %r9
	movq	32(%rsp), %r10
.L7:
	movq	(%r8,%rdi,8), %rsi
	movq	(%r9,%rdi,8), %rcx
	xorl	%eax, %eax
	movq	(%r10,%rdi,8), %rdx
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
	leaq	96(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movl	80(%rsp), %eax
	movq	$0, 16(%rsp)
	shrl	$3, %eax
	leal	0(,%rax,8), %ebx
	movl	%eax, 60(%rsp)
	subl	$1, %eax
	addq	$1, %rax
	salq	$5, %rax
	movl	%ebx, 88(%rsp)
	movq	%rax, 64(%rsp)
.L19:
	movq	72(%rsp), %rax
	movq	16(%rsp), %rbx
	xorl	%r13d, %r13d
	movq	$0, 8(%rsp)
	movq	(%rax,%rbx,8), %rax
	movq	%rax, 48(%rsp)
	.p2align 4,,10
	.p2align 3
.L15:
	movl	60(%rsp), %edx
	testl	%edx, %edx
	je	.L21
	movq	16(%rsp), %rbx
	movq	24(%rsp), %rax
	xorl	%r12d, %r12d
	movq	8(%rsp), %rcx
	xorl	%ebp, %ebp
	xorl	%r11d, %r11d
	xorl	%r10d, %r10d
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movq	(%rax,%rbx,8), %rax
	movq	32(%rsp), %rbx
	movq	%rbx, %rdi
	movq	(%rbx,%rcx,8), %rbx
	xorl	%ecx, %ecx
	movq	%rbx, 40(%rsp)
	leaq	4(%rbx), %rdx
	movq	64(%rsp), %rbx
	leaq	(%rax,%rbx), %r14
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L10:
	movq	(%rdi), %rsi
	addq	$32, %rax
	addq	$64, %rdi
	addq	$32, %rdx
	movl	(%rsi,%r13), %esi
	imull	-32(%rax), %esi
	addl	%esi, %ecx
	movl	-28(%rax), %esi
	imull	-32(%rdx), %esi
	addl	%esi, %r8d
	movl	-24(%rax), %esi
	imull	-28(%rdx), %esi
	addl	%esi, %r9d
	movl	-20(%rax), %esi
	imull	-24(%rdx), %esi
	addl	%esi, %r10d
	movl	-16(%rax), %esi
	imull	-20(%rdx), %esi
	addl	%esi, %r11d
	movl	-12(%rax), %esi
	imull	-16(%rdx), %esi
	addl	%esi, %ebx
	movl	-8(%rax), %esi
	imull	-12(%rdx), %esi
	addl	%esi, %ebp
	movl	-4(%rax), %esi
	imull	-8(%rdx), %esi
	addl	%esi, %r12d
	cmpq	%r14, %rax
	jne	.L10
	addl	%r8d, %ecx
	addl	%r9d, %ecx
	addl	%r10d, %ecx
	addl	%ecx, %r11d
	addl	%r11d, %ebx
	addl	%ebx, %ebp
	addl	%ebp, %r12d
.L14:
	movl	88(%rsp), %eax
	cmpl	%eax, %r15d
	jbe	.L11
	movq	24(%rsp), %rbx
	movq	16(%rsp), %rcx
	movq	(%rbx,%rcx,8), %rsi
	movq	32(%rsp), %rbx
	movq	8(%rsp), %rcx
	movq	(%rbx,%rcx,8), %rcx
	.p2align 4,,10
	.p2align 3
.L12:
	movl	%eax, %edi
	addl	$1, %eax
	movl	(%rsi,%rdi,4), %edx
	imull	(%rcx,%rdi,4), %edx
	addl	%edx, %r12d
	cmpl	%eax, %r15d
	jne	.L12
.L11:
	movq	48(%rsp), %rax
	addq	$1, 8(%rsp)
	movl	%r12d, (%rax,%r13)
	addq	$4, %r13
	movq	8(%rsp), %rax
	cmpl	%eax, %r15d
	ja	.L15
	addq	$1, 16(%rsp)
	movq	16(%rsp), %rax
	cmpl	%eax, %r15d
	ja	.L19
.L9:
	leaq	112(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movl	92(%rsp), %ebx
	movq	72(%rsp), %rdi
	movl	$.LC2, %esi
	pxor	%xmm0, %xmm0
	movq	(%rdi), %rdx
	movq	(%rdi,%rbx,8), %rax
	movl	$1, %edi
	leaq	8(,%rbx,8), %rbp
	movl	(%rdx), %edx
	movl	(%rax,%rbx,4), %ecx
	movq	120(%rsp), %rax
	xorl	%ebx, %ebx
	subq	104(%rsp), %rax
	cvtsi2sdq	%rax, %xmm0
	movq	112(%rsp), %rax
	subq	96(%rsp), %rax
	movapd	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	divsd	.LC1(%rip), %xmm1
	cvtsi2sdq	%rax, %xmm0
	movl	$1, %eax
	addsd	%xmm1, %xmm0
	call	__printf_chk
	movl	80(%rsp), %eax
	testl	%eax, %eax
	je	.L18
	movq	72(%rsp), %r12
	movq	24(%rsp), %r13
	movq	32(%rsp), %r14
.L22:
	movq	(%r12,%rbx), %rdi
	call	free
	movq	0(%r13,%rbx), %rdi
	call	free
	movq	(%r14,%rbx), %rdi
	addq	$8, %rbx
	call	free
	cmpq	%rbx, %rbp
	jne	.L22
.L18:
	movq	72(%rsp), %rdi
	call	free
	movq	24(%rsp), %rdi
	call	free
	movq	32(%rsp), %rdi
	call	free
	xorl	%eax, %eax
	movq	136(%rsp), %rbx
	xorq	%fs:40, %rbx
	jne	.L36
	addq	$152, %rsp
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
.L21:
	.cfi_restore_state
	xorl	%r12d, %r12d
	jmp	.L14
.L3:
	leaq	96(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movl	$-1, 92(%rsp)
	jmp	.L9
.L35:
	movq	stderr(%rip), %rcx
	movl	$.LC0, %edi
	movl	$11, %edx
	movl	$1, %esi
	call	fwrite
	orl	$-1, %edi
	call	exit
.L36:
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
