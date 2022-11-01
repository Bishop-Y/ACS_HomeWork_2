	.file	"generation.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"\nEnter seed: "
.LC1:
	.string	"%d"
.LC2:
	.string	"\nGenerated string: "
	.text
	.globl	generation
	.type	generation, @function
generation:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 80
	mov	QWORD PTR -72[rbp], rdi # указатель на массив array
	movabs	rax, 5284227956481546065 # начало создания set
	movabs	rdx, 5208208753345777743
	mov	QWORD PTR -48[rbp], rax # указатель на set
	mov	QWORD PTR -40[rbp], rdx
	movabs	rax, 4780082101251492682
	movabs	rdx, 2965664507561004366
	mov	QWORD PTR -32[rbp], rax
	mov	QWORD PTR -24[rbp], rdx
	mov	DWORD PTR -16[rbp], 690563369 # конец создания ыуе
	lea	rdi, .LC0[rip]
	mov	eax, 0
	call	printf@PLT # вызов printf
	lea	rax, -52[rbp]
	mov	rsi, rax
	lea	rdi, .LC1[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT # вызов scanf
	mov	eax, DWORD PTR -52[rbp] # eax = seed
	mov	edi, eax # edi = seed
	call	srand@PLT # вызов srand
	call	rand@PLT # вызов rand
	movsx	rdx, eax
	imul	rdx, rdx, 1374389535
	shr	rdx, 32
	mov	ecx, edx
	sar	ecx, 5
	cdq
	sub	ecx, edx
	mov	edx, ecx
	mov	DWORD PTR -8[rbp], edx
	mov	edx, DWORD PTR -8[rbp]
	imul	edx, edx, 100
	sub	eax, edx
	mov	DWORD PTR -8[rbp], eax # buffer = edx (результат rand() % 100)
	lea	rdi, .LC2[rip]
	mov	eax, 0
	call	printf@PLT # вызов printf
	mov	DWORD PTR -4[rbp], 0 # index = 0
	jmp	.L2 # заход в цикл
.L3:
	call	rand@PLT # вызов rand
	mov	ecx, eax
	movsx	rax, ecx
	imul	rax, rax, 954437177
	shr	rax, 32
	mov	edx, eax
	sar	edx, 3
	mov	eax, ecx
	sar	eax, 31
	sub	edx, eax
	mov	eax, edx
	sal	eax, 3
	add	eax, edx
	sal	eax, 2
	sub	ecx, eax
	mov	edx, ecx
	mov	eax, DWORD PTR -4[rbp] # eax = index
	movsx	rcx, eax
	mov	rax, QWORD PTR -72[rbp] # rax = указатель на array
	add	rcx, rax
	movsx	rax, edx
	movzx	eax, BYTE PTR -48[rbp+rax] # eax = set[rand() & 36]
	mov	BYTE PTR [rcx], al
	mov	eax, DWORD PTR -4[rbp] # eax = index
	movsx	rdx, eax
	mov	rax, QWORD PTR -72[rbp]  # rax = указатель на array
	add	rax, rdx # в array смещаемся на index
	movzx	eax, BYTE PTR [rax]
	movsx	eax, al
	mov	edi, eax # edi = array[index]
	call	putchar@PLT # вызов printf
	add	DWORD PTR -4[rbp], 1 # ++index
.L2:
	mov	eax, DWORD PTR -8[rbp] # eax = buffer
	sub	eax, 1 # eax = buffer - 1
	cmp	DWORD PTR -4[rbp], eax # index < buffer - 1
	jl	.L3 # если index < buffer - 1, то продолжаем цикл
	mov	eax, DWORD PTR -4[rbp] # eax = index
	movsx	rdx, eax
	mov	rax, QWORD PTR -72[rbp]  # rax = указатель на array
	add	rax, rdx # rax = array[index]
	mov	BYTE PTR [rax], 10 # BYTE PTR [rax] = '\n'
	mov	eax, DWORD PTR -4[rbp] # eax = index
	movsx	rdx, eax
	mov	rax, QWORD PTR -72[rbp]  # rax = указатель на array
	add	rax, rdx # rax = array[index]
	movzx	eax, BYTE PTR [rax]
	movsx	eax, al
	mov	edi, eax # edi = array[index]
	call	putchar@PLT # вызов printf
	mov	eax, DWORD PTR -8[rbp] # eax = buffer (return buffer)
	leave
	ret
	.size	generation, .-generation
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
