	.file	"main.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
	.align 8
.LC0:
	.string	"Enter type of filling: manual (1) or random (number != 1): "
.LC1:
	.string	"%d"
	.align 8
.LC2:
	.string	"\nThe nested sequence of parentheses is correct."
	.align 8
.LC3:
	.string	"\nThe nested sequence of parentheses is incorrect."
.LC4:
	.string	"\nTime: %d\n"
	.text
	.globl	main
	.type	main, @function
main:
	endbr64
	push	rbp
	mov	rbp, rsp
	lea	r11, -98304[rsp]
.LPSRL0:
	sub	rsp, 4096
	or	DWORD PTR [rsp], 0
	cmp	rsp, r11
	jne	.LPSRL0
	sub	rsp, 1760
	mov	DWORD PTR -100052[rbp], edi
	mov	QWORD PTR -100064[rbp], rsi
	cmp	DWORD PTR -100052[rbp], 3
	jne	.L2
	mov	rax, QWORD PTR -100064[rbp]
	add	rax, 8
	mov	rdx, QWORD PTR [rax]
	lea	rax, -100032[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	fillStringFile@PLT
	mov	DWORD PTR -8[rbp], eax
	mov	edx, DWORD PTR -8[rbp]
	lea	rax, -100032[rbp]
	mov	esi, edx
	mov	rdi, rax
	call	function@PLT
	mov	DWORD PTR -4[rbp], eax
	mov	rax, QWORD PTR -100064[rbp]
	add	rax, 16
	mov	rdx, QWORD PTR [rax]
	mov	eax, DWORD PTR -4[rbp]
	mov	rsi, rdx
	mov	edi, eax
	call	writeStringFile@PLT
	mov	eax, 0
	jmp	.L10
.L2:
	lea	rdi, .LC0[rip]
	mov	eax, 0
	call	printf@PLT
	lea	rax, -100036[rbp]
	mov	rsi, rax
	lea	rdi, .LC1[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	eax, DWORD PTR -100036[rbp]
	cmp	eax, 1
	jne	.L4
	lea	rax, -100032[rbp]
	mov	rdi, rax
	call	fillStringManual@PLT
	mov	DWORD PTR -8[rbp], eax
	jmp	.L5
.L4:
	lea	rax, -100032[rbp]
	mov	rdi, rax
	call	generation@PLT
	mov	DWORD PTR -8[rbp], eax
.L5:
	call	clock@PLT
	mov	QWORD PTR -24[rbp], rax
	mov	DWORD PTR -12[rbp], 0
	jmp	.L6
.L7:
	mov	edx, DWORD PTR -8[rbp]
	lea	rax, -100032[rbp]
	mov	esi, edx
	mov	rdi, rax
	call	function@PLT
	mov	DWORD PTR -4[rbp], eax
	add	DWORD PTR -12[rbp], 1
.L6:
	cmp	DWORD PTR -12[rbp], 9999
	jle	.L7
	call	clock@PLT
	mov	QWORD PTR -32[rbp], rax
	cmp	DWORD PTR -4[rbp], 0
	je	.L8
	lea	rdi, .LC2[rip]
	mov	eax, 0
	call	printf@PLT
	jmp	.L9
.L8:
	lea	rdi, .LC3[rip]
	mov	eax, 0
	call	printf@PLT
.L9:
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -32[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	difftime@PLT
	cvttsd2si	eax, xmm0
	movsx	rdx, eax
	imul	rdx, rdx, 274877907
	shr	rdx, 32
	sar	edx, 6
	sar	eax, 31
	sub	edx, eax
	mov	eax, edx
	mov	esi, eax
	lea	rdi, .LC4[rip]
	mov	eax, 0
	call	printf@PLT
	mov	eax, 0
.L10:
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
