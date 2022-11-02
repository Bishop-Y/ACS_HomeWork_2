	.file	"fillStringManual.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"\nType your string: "
	.text
	.globl	fillStringManual
	.type	fillStringManual, @function
fillStringManual:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi # указатель на array = rdi
	mov	DWORD PTR -4[rbp], 0 # buffer = 0
	lea	rdi, .LC0[rip]
	mov	eax, 0
	call	printf@PLT # вызов printf
	call	getchar@PLT # вызов getchar
	mov	rdx, QWORD PTR stdin[rip]
	mov	rax, QWORD PTR -24[rbp] # rax = указатель на array
	mov	esi, 100000 # передача 100000 в fgets
	mov	rdi, rax # передача rax в fgets
	call	fgets@PLT # вызов fgets
	jmp	.L2 # заход в while
.L4:
	add	DWORD PTR -4[rbp], 1 # ++buffer
.L2:
	mov	eax, DWORD PTR -4[rbp] # eax = buffer
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp] # rax = указатель на array
	add	rax, rdx # смещение в array на значение buffer
	movzx	eax, BYTE PTR [rax]
	test	al, al
	je	.L3 # выход из while
	cmp	DWORD PTR -4[rbp], 99999 # buffer < 100000
	jle	.L4 # если buffer < 100000, то продолжаем while
.L3: # конец отработки функции
	mov	eax, DWORD PTR -4[rbp] # eax = buffer (return buffer)
	leave
	ret
	.size	fillStringManual, .-fillStringManual
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
