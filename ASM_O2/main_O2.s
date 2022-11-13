	.file	"main.c"
	.intel_syntax noprefix
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"r"
.LC1:
	.string	"File does not exist"
.LC2:
	.string	"w"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC3:
	.string	"The nested sequence of parentheses is correct.\n"
	.align 8
.LC4:
	.string	"The nested sequence of parentheses is incorrect.\n"
	.align 8
.LC5:
	.string	"Enter type of filling: manual (1) or random (number != 1): "
	.section	.rodata.str1.1
.LC6:
	.string	"%d"
.LC7:
	.string	"\nType your string: "
.LC8:
	.string	"\nEnter seed: "
.LC9:
	.string	"\nTime: %d\n"
	.section	.rodata.str1.8
	.align 8
.LC10:
	.string	"\n\nThe nested sequence of parentheses is correct\n."
	.align 8
.LC11:
	.string	"\n\nThe nested sequence of parentheses is incorrect\n."
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbp
	push	rbx
	sub	rsp, 248
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 232[rsp], rax
	xor	eax, eax
	cmp	edi, 3
	je	.L28
	lea	rsi, .LC5[rip]
	xor	eax, eax
	mov	r14d, edi
	mov	edi, 1
	call	__printf_chk@PLT
	xor	eax, eax
	lea	rsi, 24[rsp]
	lea	rdi, .LC6[rip]
	call	__isoc99_scanf@PLT
	cmp	DWORD PTR 24[rsp], 1
	je	.L29
	lea	rsi, .LC8[rip]
	mov	edi, 1
	xor	eax, eax
	xor	ebx, ebx
	call	__printf_chk@PLT
	lea	rsi, 28[rsp]
	xor	eax, eax
	lea	rdi, .LC6[rip]
	call	__isoc99_scanf@PLT
	mov	edi, DWORD PTR 28[rsp]
	lea	r13, 32[rsp]
	call	srand@PLT
	call	rand@PLT
	mov	ecx, 200
	mov	edi, 10
	cdq
	idiv	ecx
	mov	ebp, edx
	mov	r12d, edx
	call	putchar@PLT
	.p2align 4,,10
	.p2align 3
.L11:
	call	rand@PLT
	movsx	rdx, eax
	mov	ecx, eax
	imul	rdx, rdx, -1401515643
	sar	ecx, 31
	shr	rdx, 32
	add	edx, eax
	sar	edx, 6
	sub	edx, ecx
	imul	edx, edx, 95
	sub	eax, edx
	add	eax, 33
	mov	BYTE PTR 0[r13+rbx], al
	movsx	edi, al
	add	rbx, 1
	call	putchar@PLT
	cmp	ebp, ebx
	jg	.L11
.L10:
	cmp	r14d, 2
	je	.L30
	mov	esi, r12d
	mov	rdi, r13
	call	function@PLT
	mov	ebx, eax
.L14:
	test	ebx, ebx
	je	.L15
	lea	rsi, .LC10[rip]
	mov	edi, 1
	xor	eax, eax
	call	__printf_chk@PLT
.L4:
	mov	rax, QWORD PTR 232[rsp]
	xor	rax, QWORD PTR fs:40
	jne	.L31
	add	rsp, 248
	xor	eax, eax
	pop	rbx
	pop	rbp
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	ret
.L29:
	mov	edi, 1
	xor	eax, eax
	lea	r13, 32[rsp]
	xor	r12d, r12d
	lea	rsi, .LC7[rip]
	mov	rbx, r13
	call	__printf_chk@PLT
	jmp	.L8
	.p2align 4,,10
	.p2align 3
.L32:
	cmp	r12d, 199
	jg	.L18
.L8:
	mov	rdi, QWORD PTR stdin[rip]
	add	rbx, 1
	call	fgetc@PLT
	movsx	rdx, r12d
	add	r12d, 1
	mov	BYTE PTR -1[rbx], al
	cmp	eax, -1
	jne	.L32
.L18:
	mov	BYTE PTR 32[rsp+rdx], 0
	jmp	.L10
.L28:
	mov	rdi, QWORD PTR 8[rsi]
	mov	rbp, rsi
	lea	rsi, .LC0[rip]
	call	fopen@PLT
	mov	r15, rax
	test	rax, rax
	je	.L33
	mov	ebx, 1
	lea	r13, 32[rsp]
	lea	r14, 31[rsp]
	.p2align 4,,10
	.p2align 3
.L3:
	mov	rdi, r15
	lea	r12d, -1[rbx]
	call	fgetc@PLT
	mov	esi, ebx
	cmp	eax, -1
	mov	BYTE PTR [r14+rbx], al
	setne	dl
	cmp	ebx, 199
	setle	al
	add	rbx, 1
	test	dl, al
	jne	.L3
	mov	rdi, r15
	movsx	r12, r12d
	mov	DWORD PTR 12[rsp], esi
	mov	BYTE PTR 32[rsp+r12], 0
	call	fclose@PLT
	mov	esi, DWORD PTR 12[rsp]
	mov	rdi, r13
	call	function@PLT
	mov	rdi, QWORD PTR 16[rbp]
	lea	rsi, .LC2[rip]
	mov	ebx, eax
	call	fopen@PLT
	mov	rbp, rax
	mov	rcx, rax
	test	ebx, ebx
	jne	.L34
	mov	edx, 49
	mov	esi, 1
	lea	rdi, .LC4[rip]
	call	fwrite@PLT
.L6:
	mov	rdi, rbp
	call	fclose@PLT
	jmp	.L4
.L15:
	lea	rsi, .LC11[rip]
	mov	edi, 1
	xor	eax, eax
	call	__printf_chk@PLT
	jmp	.L4
.L30:
	call	clock@PLT
	mov	ebp, 20000000
	mov	r14, rax
	.p2align 4,,10
	.p2align 3
.L13:
	mov	esi, r12d
	mov	rdi, r13
	call	function@PLT
	mov	ebx, eax
	sub	ebp, 1
	jne	.L13
	call	clock@PLT
	mov	rsi, r14
	mov	rdi, rax
	call	difftime@PLT
	mov	ecx, 1000
	mov	edi, 1
	lea	rsi, .LC9[rip]
	cvttsd2si	eax, xmm0
	cdq
	idiv	ecx
	mov	edx, eax
	xor	eax, eax
	call	__printf_chk@PLT
	jmp	.L14
.L34:
	mov	edx, 47
	mov	esi, 1
	lea	rdi, .LC3[rip]
	call	fwrite@PLT
	jmp	.L6
.L33:
	lea	rsi, .LC1[rip]
	mov	edi, 1
	xor	eax, eax
	call	__printf_chk@PLT
	jmp	.L4
.L31:
	call	__stack_chk_fail@PLT
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
