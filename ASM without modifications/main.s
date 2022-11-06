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
	endbr64	
	push	rbp
	mov	rbp, rsp
	sub	rsp, 288
	mov	DWORD PTR -276[rbp], edi	# argc = edi
	mov	QWORD PTR -288[rbp], rsi	# argv = rsi
	mov	DWORD PTR -4[rbp], 0	# size = 0
	cmp	DWORD PTR -276[rbp], 3	# if (argc == 3)
	jne	.L2
# ./main.c:15:         input = fopen(argv[1], "r");
	mov	rax, QWORD PTR -288[rbp]	# rax = argv
	add	rax, 8	# rax = argv[1]
# ./main.c:15:         input = fopen(argv[1], "r");
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC0[rip]
	mov	rdi, rax
	call	fopen@PLT	# вызов fopen
	mov	QWORD PTR -40[rbp], rax	# input = результат fopen
# ./main.c:16:         if (input == NULL) {
	cmp	QWORD PTR -40[rbp], 0
	jne	.L3
# ./main.c:17:             printf("File does not exist");
	lea	rdi, .LC1[rip]
	mov	eax, 0
	call	printf@PLT # вызов printf
# ./main.c:18:             return 0;
	mov	eax, 0
	jmp	.L19	# в конец программы
.L3:
# ./main.c:21:                 ch = fgetc(input);
	mov	rax, QWORD PTR -40[rbp]	# rax = input
	mov	rdi, rax # rdi = rax = input
	call	fgetc@PLT	# вызов fgetc
	mov	DWORD PTR -16[rbp], eax	# ch = результат fgetc
# ./main.c:22:                 string[size++] = ch;
	mov	eax, DWORD PTR -4[rbp]	# eax =  size
	lea	edx, 1[rax]	# tmp113,
	mov	DWORD PTR -4[rbp], edx	# size =  edx
# ./main.c:22:                 string[size++] = ch;
	mov	edx, DWORD PTR -16[rbp]	# edx = ch
	cdqe
	mov	BYTE PTR -256[rbp+rax], dl
# ./main.c:23:             } while (ch != -1 && size < 200);
	cmp	DWORD PTR -16[rbp], -1	# ch != -1
	je	.L5
# ./main.c:23:             } while (ch != -1 && size < 200);
	cmp	DWORD PTR -4[rbp], 199	# size < 200
	jle	.L3
.L5:
# ./main.c:24:             string[size - 1] = '\0';
	mov	eax, DWORD PTR -4[rbp]	# eax = size
	sub	eax, 1	# eax -= 1 (size - 1)
# ./main.c:24:             string[size - 1] = '\0';
	cdqe
	mov	BYTE PTR -256[rbp+rax], 0	# string[size- 1] = '\0'
# ./main.c:26:         fclose(input);
	mov	rax, QWORD PTR -40[rbp]	# rax = input
	mov	rdi, rax	# rdi =  rax = input
	call	fclose@PLT	# вызов fclose
# ./main.c:28:         result = function(string, size);
	mov	edx, DWORD PTR -4[rbp]	# tmp119, size
	lea	rax, -256[rbp]
	mov	esi, edx	# esi = edx = size
	mov	rdi, rax	# rdi = rax = string
	call	function@PLT	# вызов function
	mov	DWORD PTR -8[rbp], eax	# result = eax (результат function)
# ./main.c:31:         output = fopen(argv[2], "w");
	mov	rax, QWORD PTR -288[rbp]	# rax =  argv
	add	rax, 16	# rax = argv[2]
# ./main.c:31:         output = fopen(argv[2], "w");
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC2[rip]
	mov	rdi, rax
	call	fopen@PLT	# вызов fopen
	mov	QWORD PTR -48[rbp], rax	# output = rax (результат fopen)
# ./main.c:32:         if (result) {
	cmp	DWORD PTR -8[rbp], 0	# result == 0
	je	.L6
# ./main.c:33:             fprintf(output, "The nested sequence of parentheses is correct.\n");
	mov	rax, QWORD PTR -48[rbp]	# rax = output
	mov	rcx, rax
	mov	edx, 47
	mov	esi, 1
	lea	rdi, .LC3[rip]
	call	fwrite@PLT	# вызов fwrite
	jmp	.L7
.L6:
# ./main.c:35:             fprintf(output, "The nested sequence of parentheses is incorrect.\n");
	mov	rax, QWORD PTR -48[rbp]	# rax = output
	mov	rcx, rax
	mov	edx, 49
	mov	esi, 1
	lea	rdi, .LC4[rip]
	call	fwrite@PLT	# вызов fwrite
.L7:
# ./main.c:37:         fclose(output);
	mov	rax, QWORD PTR -48[rbp]	# rax =  output
	mov	rdi, rax	# rdi = rax = output
	call	fclose@PLT	# вызов fclose
# ./main.c:38:         return 0;
	mov	eax, 0	# _33,
	jmp	.L19	# в конец программы
.L2:
# ./main.c:41:     printf("Enter type of filling: manual (1) or random (number != 1): ");
	lea	rdi, .LC5[rip]
	mov	eax, 0	#,
	call	printf@PLT	# вызов printf
# ./main.c:43:     scanf("%d", &inputType);
	lea	rax, -260[rbp]
	mov	rsi, rax
	lea	rdi, .LC6[rip]
	mov	eax, 0	#,
	call	__isoc99_scanf@PLT	# вызов scanf
# ./main.c:45:     int index = 0;
	mov	DWORD PTR -12[rbp], 0	# index = 0
# ./main.c:46:     if (inputType == 1) {
	mov	eax, DWORD PTR -260[rbp]	# eax = inputType
# ./main.c:46:     if (inputType == 1) {
	cmp	eax, 1	# inputType == 1
	jne	.L8
# ./main.c:47:         printf("\nType your string: ");
	lea	rdi, .LC7[rip]
	mov	eax, 0	#,
	call	printf@PLT	# вызов printf
.L10:
# ./main.c:49:             ch = fgetc(stdin);
	mov	rax, QWORD PTR stdin[rip]
	mov	rdi, rax
	call	fgetc@PLT	# вызов fgetc
	mov	DWORD PTR -16[rbp], eax	# ch = eax (результат fgetc)
# ./main.c:50:             string[size++] = ch;
	mov	eax, DWORD PTR -4[rbp]	# eax = size
	lea	edx, 1[rax]
	mov	DWORD PTR -4[rbp], edx	# size = edx
# ./main.c:50:             string[size++] = ch;
	mov	edx, DWORD PTR -16[rbp]	# edx = ch
	cdqe
	mov	BYTE PTR -256[rbp+rax], dl
# ./main.c:51:         } while (ch != -1 && size < 200);
	cmp	DWORD PTR -16[rbp], -1	# ch != -1
	je	.L9
# ./main.c:51:         } while (ch != -1 && size < 200);
	cmp	DWORD PTR -4[rbp], 199	# size < 200
	jle	.L10
.L9:
# ./main.c:52:         string[size - 1] = '\0';
	mov	eax, DWORD PTR -4[rbp]	# eax = size
	sub	eax, 1	# eax -= 1 (size - 1)
# ./main.c:52:         string[size - 1] = '\0';
	cdqe
	mov	BYTE PTR -256[rbp+rax], 0
	jmp	.L11
.L8:
# ./main.c:55:         printf("\nEnter seed: ");
	lea	rdi, .LC8[rip]
	mov	eax, 0
	call	printf@PLT	# вызов printf
# ./main.c:56:         scanf("%d", &seed);
	lea	rax, -264[rbp]
	mov	rsi, rax
	lea	rdi, .LC6[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT	# вызов scanf
# ./main.c:57:         srand(seed);
	mov	eax, DWORD PTR -264[rbp]	# eax = seed
	mov	edi, eax	# edi = eax
	call	srand@PLT	# вызов srand
# ./main.c:58:         size = rand() % 200;
	call	rand@PLT	# вызов rand
# ./main.c:58:         size = rand() % 200;
	movsx	rdx, eax
	imul	rdx, rdx, 1374389535
	shr	rdx, 32
	mov	ecx, edx
	sar	ecx, 6
	cdq
	sub	ecx, edx
	mov	edx, ecx
	mov	DWORD PTR -4[rbp], edx	# size = edx
	mov	edx, DWORD PTR -4[rbp]	# edx =  size
	imul	edx, edx, 200
	sub	eax, edx
	mov	DWORD PTR -4[rbp], eax	# size = eax
# ./main.c:59:         printf("\n");
	mov	edi, 10 # edi = '\n'
	call	putchar@PLT	# вызов printf
.L12:
# ./main.c:61:             string[index] = 33 + rand() % 95;
	call	rand@PLT	# вызов rand
# ./main.c:61:             string[index] = 33 + rand() % 95;
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
# ./main.c:61:             string[index] = 33 + rand() % 95;
	mov	eax, edx
	add	eax, 33
	mov	edx, eax
# ./main.c:61:             string[index] = 33 + rand() % 95;
	mov	eax, DWORD PTR -12[rbp]	# eax = index
	cdqe
	mov	BYTE PTR -256[rbp+rax], dl
# ./main.c:62:             printf("%c", string[index]);
	mov	eax, DWORD PTR -12[rbp]	# eax = index
	cdqe
	movzx	eax, BYTE PTR -256[rbp+rax]	# eax = string
# ./main.c:62:             printf("%c", string[index]);
	movsx	eax, al
	mov	edi, eax
	call	putchar@PLT	# вызов printf
# ./main.c:63:             ++index;
	add	DWORD PTR -12[rbp], 1	# ++index
# ./main.c:64:         } while (index < size);
	mov	eax, DWORD PTR -12[rbp] # eax = index
	cmp	eax, DWORD PTR -4[rbp] # eax < size (index < size)
	jl	.L12
.L11:
# ./main.c:67:     if (argc == 2) {
	cmp	DWORD PTR -276[rbp], 2	# argc == 2
	jne	.L13
# ./main.c:68:         time_t start_time = clock();
	call	clock@PLT	# вызов clock
	mov	QWORD PTR -24[rbp], rax	# start_time = rax (результат clock)
# ./main.c:69:         for (index = 0; index < 20000000; ++index) {
	mov	DWORD PTR -12[rbp], 0	# index = 0
# ./main.c:69:         for (index = 0; index < 20000000; ++index) {
	jmp	.L14 # заход в цикл
.L15:
# ./main.c:70:             result = function(string, size);
	mov	edx, DWORD PTR -4[rbp]	# edx = size
	lea	rax, -256[rbp]
	mov	esi, edx	# esi = edx = size
	mov	rdi, rax	# rdi = rax = string
	call	function@PLT	# вызов function
	mov	DWORD PTR -8[rbp], eax	# result = eax (результат function)
# ./main.c:69:         for (index = 0; index < 20000000; ++index) {
	add	DWORD PTR -12[rbp], 1	# ++index
.L14:
# ./main.c:69:         for (index = 0; index < 20000000; ++index) {
	cmp	DWORD PTR -12[rbp], 19999999	# index < 20000000
	jle	.L15
# ./main.c:72:         time_t end_time = clock();
	call	clock@PLT	# вызов clock
	mov	QWORD PTR -32[rbp], rax	# end_time = rax (результат clock)
# ./main.c:73:         printf("\nTime: %d\n", (int) difftime(end_time, start_time) / 1000);
	mov	rdx, QWORD PTR -24[rbp]	# rdx = start_time
	mov	rax, QWORD PTR -32[rbp]	# rax = end_time
	mov	rsi, rdx	# rsi = rdx = start_time
	mov	rdi, rax	# rdi = rax = end_time
	call	difftime@PLT	# вызов difftime
# ./main.c:73:         printf("\nTime: %d\n", (int) difftime(end_time, start_time) / 1000);
	cvttsd2si	eax, xmm0
# ./main.c:73:         printf("\nTime: %d\n", (int) difftime(end_time, start_time) / 1000);
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
	call	printf@PLT	# вызов printf
	jmp	.L16
.L13:
# ./main.c:75:         result = function(string, size);
	mov	edx, DWORD PTR -4[rbp]	# edx = size
	lea	rax, -256[rbp]
	mov	esi, edx	# esi = edx = size
	mov	rdi, rax	# rdi = rax = string
	call	function@PLT	# вызов function
	mov	DWORD PTR -8[rbp], eax	# result = eax (результат function)
.L16:
# ./main.c:78:     if (result) {
	cmp	DWORD PTR -8[rbp], 0	# result == 0
	je	.L17
# ./main.c:79:         printf("\n\nThe nested sequence of parentheses is correct\n.");
	lea	rdi, .LC10[rip]	
	mov	eax, 0
	call	printf@PLT	# вызов printf
	jmp	.L18
.L17:
# ./main.c:81:         printf("\n\nThe nested sequence of parentheses is incorrect\n.");
	lea	rdi, .LC11[rip]
	mov	eax, 0	#,
	call	printf@PLT	# вызов printf
.L18:
# ./main.c:84:     return 0;
	mov	eax, 0
.L19:
# ./main.c:85: }
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
