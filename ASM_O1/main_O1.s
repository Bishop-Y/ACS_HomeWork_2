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
	.text
	.globl	main
	.type	main, @function
main:
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbp
	push	rbx
	sub	rsp, 232
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 216[rsp], rax
	xor	eax, eax
	cmp	edi, 3
	je	.L25
	mov	r12d, edi
	lea	rsi, .LC5[rip]
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk@PLT
	lea	rsi, 8[rsp]
	lea	rdi, .LC6[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	cmp	DWORD PTR 8[rsp], 1
	je	.L26
	lea	rsi, .LC8[rip]
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk@PLT
	lea	rsi, 12[rsp]
	lea	rdi, .LC6[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	edi, DWORD PTR 12[rsp]
	call	srand@PLT
	call	rand@PLT
	mov	ecx, 200
	cdq
	idiv	ecx
	mov	ebp, edx
	mov	edi, 10
	call	putchar@PLT
	mov	ebx, 0
.L11:
	call	rand@PLT
	movsx	rdx, eax
	imul	rdx, rdx, -1401515643
	shr	rdx, 32
	add	edx, eax
	sar	edx, 6
	mov	ecx, eax
	sar	ecx, 31
	sub	edx, ecx
	imul	edx, edx, 95
	sub	eax, edx
	add	eax, 33
	mov	BYTE PTR 16[rsp+rbx], al
	movsx	edi, al
	call	putchar@PLT
	add	rbx, 1
	cmp	ebp, ebx
	jg	.L11
.L10:
	cmp	r12d, 2
	je	.L27
	lea	rdi, 16[rsp]
	mov	esi, ebp
	call	function@PLT
	mov	r12d, eax
.L14:
	test	r12d, r12d
	je	.L15
	lea	rsi, .LC10[rip]
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk@PLT
.L4:
	mov	rax, QWORD PTR 216[rsp]
	xor	rax, QWORD PTR fs:40
	jne	.L28
	mov	eax, 0
	add	rsp, 232
	pop	rbx
	pop	rbp
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	ret
.L25:
	mov	r13, rsi
	mov	rdi, QWORD PTR 8[rsi]
	lea	rsi, .LC0[rip]
	call	fopen@PLT
	mov	rbp, rax
	mov	ebx, 1
	lea	r14, 15[rsp]
	test	rax, rax
	je	.L29
.L3:
	lea	r12d, -1[rbx]
	mov	rdi, rbp
	call	fgetc@PLT
	mov	r15d, ebx
	mov	BYTE PTR [r14+rbx], al
	cmp	eax, -1
	setne	dl
	cmp	ebx, 199
	setle	al
	add	rbx, 1
	test	dl, al
	jne	.L3
	movsx	r12, r12d
	mov	BYTE PTR 16[rsp+r12], 0
	mov	rdi, rbp
	call	fclose@PLT
	lea	rdi, 16[rsp]
	mov	esi, r15d
	call	function@PLT
	mov	ebp, eax
	mov	rdi, QWORD PTR 16[r13]
	lea	rsi, .LC2[rip]
	call	fopen@PLT
	mov	rbx, rax
	test	ebp, ebp
	je	.L5
	mov	rcx, rax
	mov	edx, 47
	mov	esi, 1
	lea	rdi, .LC3[rip]
	call	fwrite@PLT
.L6:
	mov	rdi, rbx
	call	fclose@PLT
	jmp	.L4
.L29:
	lea	rsi, .LC1[rip]
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk@PLT
	jmp	.L4
.L5:
	mov	rcx, rax
	mov	edx, 49
	mov	esi, 1
	lea	rdi, .LC4[rip]
	call	fwrite@PLT
	jmp	.L6
.L26:
	lea	rsi, .LC7[rip]
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk@PLT
	lea	rbx, 16[rsp]
	mov	ebp, 0
.L8:
	mov	rdi, QWORD PTR stdin[rip]
	call	fgetc@PLT
	mov	edx, ebp
	add	ebp, 1
	mov	BYTE PTR [rbx], al
	add	rbx, 1
	cmp	eax, -1
	je	.L18
	cmp	ebp, 199
	jle	.L8
.L18:
	movsx	rdx, edx
	mov	BYTE PTR 16[rsp+rdx], 0
	jmp	.L10
.L27:
	call	clock@PLT
	mov	r14, rax
	mov	ebx, 20000000
	lea	r13, 16[rsp]
.L13:
	mov	esi, ebp
	mov	rdi, r13
	call	function@PLT
	mov	r12d, eax
	sub	ebx, 1
	jne	.L13
	call	clock@PLT
	mov	rdi, rax
	mov	rsi, r14
	call	difftime@PLT
	cvttsd2si	eax, xmm0
	mov	ecx, 1000
	cdq
	idiv	ecx
	mov	edx, eax
	lea	rsi, .LC9[rip]
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk@PLT
	jmp	.L14
.L15:
	lea	rsi, .LC11[rip]
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk@PLT
	jmp	.L4
.L28:
	call	__stack_chk_fail@PLT
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
