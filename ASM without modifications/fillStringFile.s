	.file	"fillStringFile.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"r"
.LC1:
	.string	"%c"
	.text
	.globl	fillStringFile
	.type	fillStringFile, @function
fillStringFile:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi # указатель на array
	mov	QWORD PTR -32[rbp], rsi # inputFile
	mov	rax, QWORD PTR -32[rbp] # rax = указатель на inputFile
	lea	rsi, .LC0[rip] # rsi = "r"
	mov	rdi, rax # rdi = rax (rax = указатель на inputFile)
	call	fopen@PLT # вызов fopen
	mov	QWORD PTR -16[rbp], rax # input = результат вызова fopen
	mov	DWORD PTR -4[rbp], 0 # buffer = 0
	mov	eax, DWORD PTR -4[rbp] # eax = buffer
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp] # rax = указатель на array
	add	rdx, rax
	mov	rax, QWORD PTR -16[rbp] # rax = указатель на input
	lea	rsi, .LC1[rip]
	mov	rdi, rax # rdi = rax (rax = указатель на input)
	mov	eax, 0 # eax = 0
	call	__isoc99_fscanf@PLT # вызов fscanf
	jmp	.L2 # заходим в while
.L4:
	add	DWORD PTR -4[rbp], 1 # ++buffer
	mov	eax, DWORD PTR -4[rbp] # eax = buffer
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp] # rax = указатель на array
	add	rdx, rax
	mov	rax, QWORD PTR -16[rbp] # rax = указатель на input
	lea	rsi, .LC1[rip]
	mov	rdi, rax # rdi = rax (rax = указатель на input)
	mov	eax, 0 # eax = 0
	call	__isoc99_fscanf@PLT # вызов fscanf
.L2:
	mov	eax, DWORD PTR -4[rbp] # eax = buffer
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp] # rax = указатель на array
	add	rax, rdx # смещаемся на значение buffer в array
	movzx	eax, BYTE PTR [rax]
	test	al, al
	je	.L3 # выход в конец программы
	cmp	DWORD PTR -4[rbp], 99999 # buffer < 100000
	jle	.L4 # если buffer < 100000, то продолжаем while
.L3:
	mov	rax, QWORD PTR -16[rbp] # rax = указатель на input
	mov	rdi, rax # rdi = rax
	call	fclose@PLT # вызов fclose
	mov	eax, DWORD PTR -4[rbp] # eax = buffer (return buffer)
	leave
	ret
	.size	fillStringFile, .-fillStringFile
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
