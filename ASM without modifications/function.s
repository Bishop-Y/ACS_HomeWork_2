	.file	"function.c"
	.intel_syntax noprefix
	.text
	.globl	function
	.type	function, @function
function:
	endbr64	
	push	rbp	#
	mov	rbp, rsp	#,
	mov	QWORD PTR -24[rbp], rdi	# array = rdi
	mov	DWORD PTR -28[rbp], esi	# size = esi
# ./function.c:3:     int counter = 0;
	mov	DWORD PTR -8[rbp], 0	# counter = 0
# ./function.c:4:     for (index = 0; index < size; ++index) {
	mov	DWORD PTR -4[rbp], 0	# index = 0
# ./function.c:4:     for (index = 0; index < size; ++index) {
	jmp	.L2
.L7:
# ./function.c:5:        if (array[index] == 40) {
	mov	eax, DWORD PTR -4[rbp]	# eax = index
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp]	# rax = array
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
# ./function.c:5:        if (array[index] == 40) {
	cmp	al, 40	# array[index] == 40
	jne	.L3
# ./function.c:6:            ++counter;
	add	DWORD PTR -8[rbp], 1	# ++counter
	jmp	.L4
.L3:
# ./function.c:7:        } else if (array[index] == 41) {
	mov	eax, DWORD PTR -4[rbp]	# eax = index
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp]	# rax = array
	add	rax, rdx	# rax = array[index]
	movzx	eax, BYTE PTR [rax]
# ./function.c:7:        } else if (array[index] == 41) {
	cmp	al, 41	# array[index] == 41
	jne	.L4
# ./function.c:8:            --counter;
	sub	DWORD PTR -8[rbp], 1	# --counter
.L4:
# ./function.c:10:        if (counter < 0) {
	cmp	DWORD PTR -8[rbp], 0	# counter < 0
	jns	.L5
# ./function.c:11:            return 0;
	mov	eax, 0
	jmp	.L6	# в конец функции
.L5:
# ./function.c:4:     for (index = 0; index < size; ++index) {
	add	DWORD PTR -4[rbp], 1	# ++index
.L2:
# ./function.c:4:     for (index = 0; index < size; ++index) {
	mov	eax, DWORD PTR -4[rbp]	# eax = index
	cmp	eax, DWORD PTR -28[rbp]	# eax <  size
	jl	.L7
# ./function.c:14:     if (counter == 0) {
	cmp	DWORD PTR -8[rbp], 0	# counter == 0
	jne	.L8
# ./function.c:15:         return 1;
	mov	eax, 1
	jmp	.L6	# в конец функции
.L8:
# ./function.c:17:         return 0;
	mov	eax, 0
.L6:
# ./function.c:19: }
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
