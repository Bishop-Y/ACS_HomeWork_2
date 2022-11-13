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
.LC3:
	.string	"The nested sequence of parentheses is correct.\n"
.LC4:
	.string	"The nested sequence of parentheses is incorrect.\n"
.LC5:
	.string	"Enter type of filling: manual (1) or random (number != 1): "
.LC6:
	.string	"%d"
.LC7:
	.string	"\nType your string: "
.LC8:
	.string	"\nEnter seed: "
.LC9:
	.string	"\nTime: %d\n"
.LC10:
	.string	"\n\nThe nested sequence of parentheses is correct\n."
.LC11:
	.string	"\n\nThe nested sequence of parentheses is incorrect\n."
	.section	.text.startup,"ax",@progbits
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
	jne	.L2
	mov	rdi, QWORD PTR 8[rsi]
	mov	r12, rsi
	mov	ebx, 1
	lea	rsi, .LC0[rip]
	lea	r14, 16[rsp]
	call	fopen@PLT
	lea	rsi, .LC1[rip]
	mov	rbp, rax
	test	rax, rax
	je	.L24
.L3:
	mov	rdi, rbp
	lea	r13d, -1[rbx]
	mov	r15d, ebx
	call	fgetc@PLT
	mov	BYTE PTR 15[rsp+rbx], al
	inc	eax
	setne	dl
	cmp	ebx, 199
	setle	al
	inc	rbx
	test	dl, al
	jne	.L3
	mov	rdi, rbp
	movsx	r13, r13d
	mov	BYTE PTR 16[rsp+r13], 0
	call	fclose@PLT
	mov	esi, r15d
	mov	rdi, r14
	call	function@PLT
	mov	rdi, QWORD PTR 16[r12]
	lea	rsi, .LC2[rip]
	mov	ebx, eax
	call	fopen@PLT
	lea	rdi, .LC3[rip]
	mov	rbp, rax
	mov	rsi, rax
	test	ebx, ebx
	jne	.L23
	lea	rdi, .LC4[rip]
.L23:
	call	fputs@PLT
	mov	rdi, rbp
	call	fclose@PLT
	jmp	.L4
.L2:
	lea	rsi, .LC5[rip]
	xor	eax, eax
	mov	ebx, edi
	mov	edi, 1
	call	__printf_chk@PLT
	xor	eax, eax
	lea	rsi, 8[rsp]
	lea	rdi, .LC6[rip]
	call	__isoc99_scanf@PLT
	cmp	DWORD PTR 8[rsp], 1
	jne	.L7
	lea	rsi, .LC7[rip]
	mov	edi, 1
	xor	eax, eax
	mov	ebp, 1
	call	__printf_chk@PLT
	lea	r14, 15[rsp]
.L8:
	mov	rdi, QWORD PTR stdin[rip]
	lea	r13d, -1[rbp]
	mov	r12d, ebp
	call	fgetc@PLT
	mov	BYTE PTR [r14+rbp], al
	inc	eax
	setne	dl
	cmp	ebp, 199
	setle	al
	inc	rbp
	test	dl, al
	jne	.L8
	movsx	r13, r13d
	mov	BYTE PTR 16[rsp+r13], 0
	jmp	.L9
.L7:
	lea	rsi, .LC8[rip]
	mov	edi, 1
	xor	eax, eax
	xor	ebp, ebp
	call	__printf_chk@PLT
	lea	rsi, 12[rsp]
	xor	eax, eax
	lea	rdi, .LC6[rip]
	call	__isoc99_scanf@PLT
	mov	edi, DWORD PTR 12[rsp]
	mov	r14d, 95
	call	srand@PLT
	call	rand@PLT
	mov	ecx, 200
	mov	edi, 10
	cdq
	idiv	ecx
	mov	r13d, edx
	mov	r12d, edx
	call	putchar@PLT
.L10:
	call	rand@PLT
	cdq
	idiv	r14d
	add	edx, 33
	mov	BYTE PTR 16[rsp+rbp], dl
	movsx	edi, dl
	inc	rbp
	call	putchar@PLT
	cmp	r13d, ebp
	jg	.L10
.L9:
	cmp	ebx, 2
	lea	r14, 16[rsp]
	jne	.L11
	call	clock@PLT
	mov	r13d, 20000000
	mov	rbp, rax
.L12:
	mov	esi, r12d
	mov	rdi, r14
	call	function@PLT
	mov	ebx, eax
	dec	r13d
	jne	.L12
	call	clock@PLT
	mov	rsi, rbp
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
	jmp	.L13
.L11:
	mov	esi, r12d
	mov	rdi, r14
	call	function@PLT
	mov	ebx, eax
.L13:
	lea	rsi, .LC10[rip]
	test	ebx, ebx
	jne	.L24
	lea	rsi, .LC11[rip]
.L24:
	mov	edi, 1
	xor	eax, eax
	call	__printf_chk@PLT
.L4:
	mov	rax, QWORD PTR 216[rsp]
	xor	rax, QWORD PTR fs:40
	je	.L15
	call	__stack_chk_fail@PLT
.L15:
	add	rsp, 232
	xor	eax, eax
	pop	rbx
	pop	rbp
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
