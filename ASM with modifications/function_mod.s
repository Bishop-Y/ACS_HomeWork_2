	.file	"function.c"
	.intel_syntax noprefix
	.text
	.globl	function
	.type	function, @function
function:
	push	rbp
	mov	rbp, rsp
	mov QWORD PTR -24[rbp], rdi # array
	# mov DWORD PTR -28[rbp], esi # size
    mov r13d, esi # size
	# mov DWORD PTR -4[rbp], 0 # counter
    mov r11d, 0 # counter
	# mov DWORD PTR -8[rbp], 0 # index
    mov r12d, 0 # index
	jmp	.L2
.L7:
	# mov eax, DWORD PTR -8[rbp]
    mov eax, r12d
	movsx	rdx, eax
	mov rax, QWORD PTR -24[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	cmp	al, 40
	jne	.L3
	# add DWORD PTR -4[rbp], 1
    add r11d, 1 #
	jmp	.L4
.L3:
	# mov eax, DWORD PTR -8[rbp]
    mov eax, r12d
	movsx	rdx, eax
	mov rax, QWORD PTR -24[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	cmp	al, 41
	jne	.L4
	# sub DWORD PTR -4[rbp], 1
    sub r11d, 1 #
.L4:
	# cmp DWORD PTR -4[rbp], 0
    cmp r11d, 0 #
	jns	.L5
	mov	eax, 0
	jmp	.L6
.L5:
	# add DWORD PTR -8[rbp], 1
    add r12d, 1 #
.L2:
	# mov eax, DWORD PTR -8[rbp]
	# cmp eax, DWORD PTR -28[rbp]
    cmp r12d, r13d #
	jl	.L7
	# cmp DWORD PTR -4[rbp], 0
    cmp r11d, 0 #
	jne	.L8
	mov	eax, 1
	jmp	.L6
.L8:
	mov	eax, 0
.L6:
	pop	rbp
	ret
	.size	function, .-function
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
