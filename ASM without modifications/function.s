	.file	"function.c"
	.intel_syntax noprefix
	.text
	.globl	function
	.type	function, @function
function:
	endbr64
	push	rbp
	mov	rbp, rsp
	mov	QWORD PTR -24[rbp], rdi # указатель на array
	mov	DWORD PTR -28[rbp], esi # buffer
	mov	DWORD PTR -8[rbp], 0 # counter = 0
	mov	DWORD PTR -4[rbp], 0 # index = 0
	jmp	.L2 # заходим в цикл
.L7:
	mov	eax, DWORD PTR -4[rbp] # eax = index
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp] # rax = указатель на array
	add	rax, rdx # смотрим array[index]
	movzx	eax, BYTE PTR [rax]
	cmp	al, 40 # array[index] == '('
	jne	.L3 # если array[index] != '(' то идём в else if
	add	DWORD PTR -8[rbp], 1 # ++counter
	jmp	.L4 # идём в if (counter < 0)
.L3:
	mov	eax, DWORD PTR -4[rbp] # eax = index
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp] # rax = указатель на array
	add	rax, rdx # смотрим array[index]
	movzx	eax, BYTE PTR [rax]
	cmp	al, 41 # array[index] == ')'
	jne	.L4 # если array[index] != ')', то идём в if (counter < 0)
	sub	DWORD PTR -8[rbp], 1 # --counter
.L4:
	cmp	DWORD PTR -8[rbp], 0 # counter < 0
	jns	.L5 # если counter >=, то продолжаем цикл
	mov	eax, 0 # eax = 0 (return 0)
	jmp	.L6 # выход из программы
.L5:
	add	DWORD PTR -4[rbp], 1 # ++index
.L2:
	mov	eax, DWORD PTR -4[rbp] # eax = index
	cmp	eax, DWORD PTR -28[rbp] # index < buffer
	jl	.L7 # если index < buffer,  то идём обратно в цикл
	cmp	DWORD PTR -8[rbp], 0 # counter == 0
	jne	.L8 # идём в else
	mov	eax, 1 # eax = 1 (return 1)
	jmp	.L6 # выход из программы
.L8:
	mov	eax, 0 # eax = 0 (return 0)
.L6:
	pop	rbp
	ret
	.size	function, .-function
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
