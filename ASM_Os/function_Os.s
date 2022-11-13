	.file	"function.c"
	.intel_syntax noprefix
	.text
	.globl	function
	.type	function, @function
function:
	xor	edx, edx
	xor	eax, eax
.L2:
	cmp	esi, edx
	jle	.L9
	mov	cl, BYTE PTR [rdi+rdx]
	cmp	cl, 40
	jne	.L3
	inc	eax
	jmp	.L4
.L3:
	cmp	cl, 41
	jne	.L4
	dec	eax
	cmp	eax, -1
	je	.L7
.L4:
	inc	rdx
	jmp	.L2
.L9:
	test	eax, eax
	sete	al
	movzx	eax, al
	ret
.L7:
	xor	eax, eax
	ret
	.size	function, .-function
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
