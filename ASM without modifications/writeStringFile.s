	.file	"writeStringFile.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"w"
	.align 8
.LC1:
	.string	"The nested sequence of parentheses is correct.\n"
	.align 8
.LC2:
	.string	"The nested sequence of parentheses is incorrect.\n"
	.text
	.globl	writeStringFile
	.type	writeStringFile, @function
writeStringFile:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	DWORD PTR -20[rbp], edi # result
	mov	QWORD PTR -32[rbp], rsi # outputFile
	mov	rax, QWORD PTR -32[rbp] # rax = outputFile
	lea	rsi, .LC0[rip]
	mov	rdi, rax # rdi = rax (rax = outputFile)
	call	fopen@PLT # вызов fopen
	mov	QWORD PTR -8[rbp], rax # output = rax (результат вызова fopen)
	cmp	DWORD PTR -20[rbp], 0 # result == 0
	je	.L2 # если result = 0, то идём в else
	mov	rax, QWORD PTR -8[rbp] # rax = output
	mov	rcx, rax 
	mov	edx, 47
	mov	esi, 1
	lea	rdi, .LC1[rip]
	call	fwrite@PLT # вызов fwrite 
	jmp	.L3 # выход к концу программы
.L2:
	mov	rax, QWORD PTR -8[rbp] # rax = output
	mov	rcx, rax
	mov	edx, 49
	mov	esi, 1
	lea	rdi, .LC2[rip]
	call	fwrite@PLT # вызов fwrite
.L3:
	mov	rax, QWORD PTR -8[rbp] # rax = output
	mov	rdi, rax # rdi = rax
	call	fclose@PLT # вызов fclose
	nop
	leave
	ret
	.size	writeStringFile, .-writeStringFile
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
