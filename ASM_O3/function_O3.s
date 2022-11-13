	.file	"function.c"
	.intel_syntax noprefix
	.text
	.p2align 4
	.globl	function
	.type	function, @function
function:
	test	esi, esi
	jle	.L7
	lea	eax, -1[rsi]
	xor	edx, edx
	lea	rcx, 1[rdi+rax]
	jmp	.L6
	.p2align 4,,10
	.p2align 3
.L3:
	cmp	al, 41
	je	.L11
.L4:
	add	rdi, 1
	cmp	rcx, rdi
	je	.L12
.L6:
	movzx	eax, BYTE PTR [rdi]
	cmp	al, 40
	jne	.L3
	add	rdi, 1
	add	edx, 1
	cmp	rcx, rdi
	jne	.L6
.L12:
	xor	eax, eax
	test	edx, edx
	sete	al
	ret
	.p2align 4,,10
	.p2align 3
.L11:
	sub	edx, 1
	cmp	edx, -1
	jne	.L4
	xor	eax, eax
	ret
.L7:
	mov	eax, 1
	ret
	.size	function, .-function
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
