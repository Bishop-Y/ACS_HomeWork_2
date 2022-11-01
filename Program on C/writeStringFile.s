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
	mov	DWORD PTR -20[rbp], edi
	mov	QWORD PTR -32[rbp], rsi
	mov	rax, QWORD PTR -32[rbp]
	lea	rsi, .LC0[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -8[rbp], rax
	cmp	DWORD PTR -20[rbp], 0
	je	.L2
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	mov	edx, 47
	mov	esi, 1
	lea	rdi, .LC1[rip]
	call	fwrite@PLT
	jmp	.L3
.L2:
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	mov	edx, 49
	mov	esi, 1
	lea	rdi, .LC2[rip]
	call	fwrite@PLT
.L3:
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	fclose@PLT
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
