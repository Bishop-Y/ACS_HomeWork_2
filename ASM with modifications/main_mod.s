	.file	"main.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"r"
.LC1:
	.string	"File does not exist"
.LC2:
	.string	"w"
	.align 8
.LC3:
	.string	"The nested sequence of parentheses is correct.\n"
	.align 8
.LC4:
	.string	"The nested sequence of parentheses is incorrect.\n"
	.align 8
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
	push	rbp
	mov	rbp, rsp
	sub	rsp, 288
	mov	DWORD PTR -276[rbp], edi # argc
	mov	QWORD PTR -288[rbp], rsi # argv
	# mov rax, QWORD PTR fs:40
	# mov QWORD PTR -8[rbp], rax
	# xor eax, eax
	# mov DWORD PTR -256[rbp], 0 # size
	mov r13d, 0 #
	cmp	DWORD PTR -276[rbp], 3
	jne	.L2
	mov	rax, QWORD PTR -288[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC0[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -224[rbp], rax # input
	cmp	QWORD PTR -224[rbp], 0
	jne	.L3
	lea	rdi, .LC1[rip]
	mov	eax, 0
	call	printf@PLT
	mov	eax, 0
	# jmp .L19
	jmp .L20
.L3:
	mov	rax, QWORD PTR -224[rbp]
	mov	rdi, rax
	call	fgetc@PLT
	mov	DWORD PTR -244[rbp], eax # ch
	# mov eax, DWORD PTR -256[rbp]
	mov eax, r13d #
	lea	edx, 1[rax]
	# mov DWORD PTR -256[rbp], edx
	mov r13d, edx #
	mov	edx, DWORD PTR -244[rbp]
	# cdqe
	mov	BYTE PTR -208[rbp+rax], dl
	cmp	DWORD PTR -244[rbp], -1
	je	.L5
	# cmp DWORD PTR -256[rbp], 199
	cmp r13d, 199 #
	jle	.L3
.L5:
	# mov eax, DWORD PTR -256[rbp]
	mov eax, r13d #
	sub	eax, 1
	# cdqe
	mov	BYTE PTR -208[rbp+rax], 0
	mov	rax, QWORD PTR -224[rbp]
	mov	rdi, rax
	call	fclose@PLT
	# mov edx, DWORD PTR -256[rbp]
	mov edx, r13d #
	lea	rax, -208[rbp] # string
	mov	esi, edx
	mov	rdi, rax
	call	function@PLT
	# mov DWORD PTR -252[rbp], eax # result
	mov r14d, eax #
	mov	rax, QWORD PTR -288[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC2[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -216[rbp], rax # output
	# cmp DWORD PTR -252[rbp], 0
	cmp r14d, 0 #
	je	.L6
	mov	rax, QWORD PTR -216[rbp]
	mov	rcx, rax
	mov	edx, 47
	mov	esi, 1
	lea	rdi, .LC3[rip]
	call	fwrite@PLT
	jmp	.L7
.L6:
	mov	rax, QWORD PTR -216[rbp]
	mov	rcx, rax
	mov	edx, 49
	mov	esi, 1
	lea	rdi, .LC4[rip]
	call	fwrite@PLT
.L7:
	mov	rax, QWORD PTR -216[rbp]
	mov	rdi, rax
	call	fclose@PLT
	mov	eax, 0
	# jmp .L19
	jmp .L20
.L2:
	lea	rdi, .LC5[rip]
	mov	eax, 0
	call	printf@PLT
	lea	rax, -264[rbp] # seed
	mov	rsi, rax
	lea	rdi, .LC6[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	# mov DWORD PTR -248[rbp], 0 # index
	mov r15d, 0 # index
	mov	eax, DWORD PTR -264[rbp]
	cmp	eax, 1
	jne	.L8
	lea	rdi, .LC7[rip]
	mov	eax, 0
	call	printf@PLT
.L10:
	mov	rax, QWORD PTR stdin[rip]
	mov	rdi, rax
	call	fgetc@PLT
	mov	DWORD PTR -244[rbp], eax
	# mov eax, DWORD PTR -256[rbp]
	mov eax, r13d #
	lea	edx, 1[rax]
	# mov DWORD PTR -256[rbp], edx
	mov r13d, edx #
	mov	edx, DWORD PTR -244[rbp]
	# cdqe
	mov	BYTE PTR -208[rbp+rax], dl
	cmp	DWORD PTR -244[rbp], -1
	je	.L9
	# cmp DWORD PTR -256[rbp], 199
	cmp r13d, 199 #
	jle	.L10
.L9:
	# mov eax, DWORD PTR -256[rbp]
	mov eax, r13d #
	sub	eax, 1
	# cdqe
	mov	BYTE PTR -208[rbp+rax], 0
	jmp	.L11
.L8:
	lea	rdi, .LC8[rip]
	mov	eax, 0
	call	printf@PLT
	lea	rax, -260[rbp]
	mov	rsi, rax
	lea	rdi, .LC6[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	eax, DWORD PTR -260[rbp]
	mov	edi, eax
	call	srand@PLT
	call	rand@PLT
	movsx	rdx, eax
	imul	rdx, rdx, 1374389535
	shr	rdx, 32
	mov	ecx, edx
	sar	ecx, 6
	cdq
	sub	ecx, edx
	mov	edx, ecx
	# mov DWORD PTR -256[rbp], edx
	mov r13d, edx #
	# mov edx, DWORD PTR -256[rbp]
	mov edx, r13d #
	imul	edx, edx, 200
	sub	eax, edx
	# mov DWORD PTR -256[rbp], eax
	mov r13d, eax #
	mov	edi, 10
	call	putchar@PLT
.L12:
	call	rand@PLT
	movsx	rdx, eax
	imul	rdx, rdx, -1401515643
	shr	rdx, 32
	add	edx, eax
	mov	ecx, edx
	sar	ecx, 6
	cdq
	sub	ecx, edx
	mov	edx, ecx
	imul	edx, edx, 95
	sub	eax, edx
	mov	edx, eax
	mov	eax, edx
	add	eax, 33
	mov	edx, eax
	# mov eax, DWORD PTR -248[rbp]
	mov eax, r15d #
	# cdqe
	mov	BYTE PTR -208[rbp+rax], dl
	# mov eax, DWORD PTR -248[rbp]
	mov eax, r15d
	# cdqe
	movzx	eax, BYTE PTR -208[rbp+rax]
	movsx	eax, al
	mov	edi, eax
	call	putchar@PLT
	# add DWORD PTR -248[rbp], 1
	add r15d, 1 #
	# mov eax, DWORD PTR -248[rbp]
	mov eax, r15d #
	# cmp eax, DWORD PTR -256[rbp]
	cmp eax, r13d #
	jl	.L12
.L11:
	cmp	DWORD PTR -276[rbp], 2
	jne	.L13
	call	clock@PLT
	mov	QWORD PTR -240[rbp], rax # start_time
	# mov DWORD PTR -248[rbp], 0
	mov r15d, 0 #
	jmp	.L14
.L15:
	# mov edx, DWORD PTR -256[rbp]
	mov edx, r13d #
	lea	rax, -208[rbp]
	mov	esi, edx
	mov	rdi, rax
	call	function@PLT
	# mov DWORD PTR -252[rbp], eax
	mov r14d, eax #
	# add DWORD PTR -248[rbp], 1
	add r15d, 1 #
.L14:
	# cmp DWORD PTR -248[rbp], 19999999
	cmp r15d, 19999999 #
	jle	.L15
	call	clock@PLT
	mov	QWORD PTR -232[rbp], rax # end_time
	mov	rdx, QWORD PTR -240[rbp]
	mov	rax, QWORD PTR -232[rbp]
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
	lea	rdi, .LC9[rip]
	mov	eax, 0
	call	printf@PLT
	jmp	.L16
.L13:
	# mov edx, DWORD PTR -256[rbp]
	mov edx, r13d #
	lea	rax, -208[rbp]
	mov	esi, edx
	mov	rdi, rax
	call	function@PLT
	# mov DWORD PTR -252[rbp], eax
	mov r14d, eax #
.L16:
	# cmp DWORD PTR -252[rbp], 0
	cmp r14d, 0 #
	je	.L17
	lea	rdi, .LC10[rip]
	mov	eax, 0
	call	printf@PLT
	jmp	.L18
.L17:
	lea	rdi, .LC11[rip]
	mov	eax, 0
	call	printf@PLT
.L18:
	mov	eax, 0
# .L19:
	# mov rsi, QWORD PTR -8[rbp]
	# xor rsi, QWORD PTR fs:40
	# je .L20
	# call __stack_chk_fail@PLT
.L20:
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
