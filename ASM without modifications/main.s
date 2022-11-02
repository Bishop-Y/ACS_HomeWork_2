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
	mov	DWORD PTR -100052[rbp], edi # argc = edi
	mov	QWORD PTR -100064[rbp], rsi # argv = rsi
	cmp	DWORD PTR -100052[rbp], 3 # argc == 3
	jne	.L2 # выход если argc != 3
	mov	rax, QWORD PTR -100064[rbp] # rax = указатель на начало argv
	add	rax, 8 # сместились на argv[1]
	mov	rdx, QWORD PTR [rax] 
	lea	rax, -100032[rbp] # выделение памяти под массив string
	mov	rsi, rdx # rsi = rdx (rdx = argv[1])
	mov	rdi, rax # rdi = rax (rax = указатель на string)
	call	fillStringFile@PLT # вызов fillStringFile
	mov	DWORD PTR -8[rbp], eax # buffer = результат вызова fillStringFile
	mov	edx, DWORD PTR -8[rbp] # edx = buffer
	lea	rax, -100032[rbp]
	mov	esi, edx # esi = buffer
	mov	rdi, rax # rdi = rax (rax = указатель на string)
	call	function@PLT # вызов function
	mov	DWORD PTR -4[rbp], eax # result = eax
	mov	rax, QWORD PTR -100064[rbp] # rax = указатель на начало argv
	add	rax, 16 # сместились на argv[2]
	mov	rdx, QWORD PTR [rax] # rdx = argv[2]
	mov	eax, DWORD PTR -4[rbp] # eax = result
	mov	rsi, rdx # rsi = rdx (rdx = argv[2])
	mov	edi, eax # edi = eax (eax = result)
	call	writeStringFile@PLT # вызов writeStringFile
	mov	eax, 0 # eax = 0
	jmp	.L10 # выход из программы (return 0)
.L2:
	lea	rdi, .LC0[rip]
	mov	eax, 0 # eax = 0
	call	printf@PLT # вызов printf
	lea	rax, -100036[rbp]
	mov	rsi, rax
	lea	rdi, .LC1[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	eax, DWORD PTR -100036[rbp] # eax = input type
	cmp	eax, 1 # input type == 1
	jne	.L4 # если input type != 1, то переход в else
	lea	rax, -100032[rbp]
	mov	rdi, rax # rdi = rax (rax = указатель на string)
	call	fillStringManual@PLT # вызов fillStringManual
	mov	DWORD PTR -8[rbp], eax # buffer = eax (реузультат вызова fillStringManual)
	jmp	.L5 # пропуск else
.L4:
	lea	rax, -100032[rbp]
	mov	rdi, rax # rdi = rax (rax = указатель на string)
	call	generation@PLT # вызов generation
	mov	DWORD PTR -8[rbp], eax # buffer = eax (реузультат вызова generation)
.L5:
	call	clock@PLT
	mov	QWORD PTR -24[rbp], rax # start_time = rax (rax = резульатт вызова clock)
	mov	DWORD PTR -12[rbp], 0 # i = 0 (итерируемая переменная)
	jmp	.L6 # заходим в цикл
.L7:
	mov	edx, DWORD PTR -8[rbp] # edx = buffer
	lea	rax, -100032[rbp]
	mov	esi, edx # esi = edx (edx = buffer)
	mov	rdi, rax # rdi = rax (rax = указатель на string)
	call	function@PLT # вызов function
	mov	DWORD PTR -4[rbp], eax # result = eax (реузультат вызова function)
	add	DWORD PTR -12[rbp], 1 # ++i
.L6:
	cmp	DWORD PTR -12[rbp], 999999 # i < 1000000
	jle	.L7 # если i < 1000000, то возвращаемся в цикл
	call	clock@PLT # вызов clock
	mov	QWORD PTR -32[rbp], rax # end_time = rax (rax = результат вызова clock)
	cmp	DWORD PTR -4[rbp], 0 # result == 0
	je	.L8 # если result = 0, то уходим в else
	lea	rdi, .LC2[rip]
	mov	eax, 0
	call	printf@PLT # вызов printf
	jmp	.L9 # идём к выводу времени
.L8: # отработка else
	lea	rdi, .LC3[rip]
	mov	eax, 0
	call	printf@PLT # вызов printf
.L9:
	mov	rdx, QWORD PTR -24[rbp] # rdx = start_time
	mov	rax, QWORD PTR -32[rbp] # rax = end_time
	mov	rsi, rdx # rsi = rdx (rdx = start_time)
	mov	rdi, rax # rdi = rax (rax = end_time)
	call	difftime@PLT # вызов difftime
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
	call	printf@PLT # вызов printf
	mov	eax, 0
.L10: # конец программы
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
