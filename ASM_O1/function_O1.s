	.file	"function.c"
	.intel_syntax noprefix
	.text
	.globl	function
	.type	function, @function
function:
	test	esi, esi
	jle	.L7
	mov	rax, rdi
	lea	edx, -1[rsi]
	lea	rsi, 1[rdi+rdx]
	mov	edx, 0
	jmp	.L6
.L3:
	cmp	cl, 41
	sete	cl
	movzx	ecx, cl
	sub	edx, ecx
.L4:
	test	edx, edx
	js	.L8
	add	rax, 1
	cmp	rax, rsi
	je	.L2
.L6:
	movzx	ecx, BYTE PTR [rax]
	cmp	cl, 40
	jne	.L3
	add	edx, 1
	jmp	.L4
.L7:
	mov	edx, 0
.L2:
	test	edx, edx
	sete	al
	movzx	eax, al
	ret
.L8:
	mov	eax, 0
	ret
	.size	function, .-function
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
