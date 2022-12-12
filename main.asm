	.file	"main.c"
	.text
	.globl	Pessoa
	.bss
	.align 32
	.type	Pessoa, @object
	.size	Pessoa, 130
Pessoa:
	.zero	130
	.globl	pFile
	.align 8
	.type	pFile, @object
	.size	pFile, 8
pFile:
	.zero	8
	.section	.rodata
.LC0:
	.string	"\n\t\t\tAGENDA DE CONTATOS\n"
.LC1:
	.string	"\n\t1-Cadastrar"
.LC2:
	.string	"\n\t2-Consultar"
.LC3:
	.string	"\n\t3-Editar"
.LC4:
	.string	"\n\t4-Excluir"
.LC5:
	.string	"\n\t5-Listar"
.LC6:
	.string	"\n\t0-Sair"
.LC7:
	.string	"\n\tOpcao.: "
.LC8:
	.string	"%d"
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, -12(%rbp)
	call	abre_arquivo
.L10:
	call	limpar_tela
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-12(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-12(%rbp), %eax
	testl	%eax, %eax
	je	.L2
	movl	-12(%rbp), %eax
	cmpl	$5, %eax
	ja	.L13
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L5(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L5(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L5:
	.long	.L13-.L5
	.long	.L9-.L5
	.long	.L8-.L5
	.long	.L7-.L5
	.long	.L6-.L5
	.long	.L4-.L5
	.text
.L9:
	call	cadastrar
	jmp	.L2
.L8:
	call	consultar
	jmp	.L2
.L7:
	movl	$0, %eax
	call	editar
	jmp	.L2
.L6:
	call	excluir
	jmp	.L2
.L4:
	call	listar
	jmp	.L2
.L13:
	nop
.L2:
	movl	-12(%rbp), %eax
	testl	%eax, %eax
	jne	.L10
	call	fecha_arquivo
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L12
	call	__stack_chk_fail@PLT
.L12:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.section	.rodata
.LC9:
	.string	"a+b"
.LC10:
	.string	"BancoDados.bin"
	.text
	.globl	abre_arquivo
	.type	abre_arquivo, @function
abre_arquivo:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	.LC9(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, pFile(%rip)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	abre_arquivo, .-abre_arquivo
	.section	.rodata
.LC11:
	.string	"\n\t\t\tNOVO CADASTRO\n"
.LC12:
	.string	"\n\tDigite o nome.....: "
.LC13:
	.string	"\n\tDigite o e-mail...: "
.LC14:
	.string	"\n\tDigite o telefone.: "
.LC15:
	.string	"\n\tDigite o celular..: "
	.align 8
.LC16:
	.string	"\n\n\tDeseja efetuar outro cadastro? (1-Sim / 0-Nao).: "
	.text
	.globl	cadastrar
	.type	cadastrar, @function
cadastrar:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, -12(%rbp)
.L16:
	call	limpar_tela
	leaq	.LC11(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC12(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	call	limpar_buffer
	movq	stdin(%rip), %rax
	movq	%rax, %rdx
	movl	$40, %esi
	leaq	Pessoa(%rip), %rax
	movq	%rax, %rdi
	call	fgets@PLT
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	call	limpar_buffer
	movq	stdin(%rip), %rax
	movq	%rax, %rdx
	movl	$50, %esi
	leaq	40+Pessoa(%rip), %rax
	movq	%rax, %rdi
	call	fgets@PLT
	leaq	.LC14(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	call	limpar_buffer
	movq	stdin(%rip), %rax
	movq	%rax, %rdx
	movl	$20, %esi
	leaq	90+Pessoa(%rip), %rax
	movq	%rax, %rdi
	call	fgets@PLT
	leaq	.LC15(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	call	limpar_buffer
	movq	stdin(%rip), %rax
	movq	%rax, %rdx
	movl	$20, %esi
	leaq	110+Pessoa(%rip), %rax
	movq	%rax, %rdi
	call	fgets@PLT
	movq	pFile(%rip), %rax
	movl	$2, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	fseek@PLT
	movq	pFile(%rip), %rax
	movq	%rax, %rcx
	movl	$1, %edx
	movl	$130, %esi
	leaq	Pessoa(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
	leaq	.LC16(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-12(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-12(%rbp), %eax
	cmpl	$1, %eax
	je	.L16
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L17
	call	__stack_chk_fail@PLT
.L17:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	cadastrar, .-cadastrar
	.section	.rodata
.LC17:
	.string	"\n\t\t\tCONSULTA DE CONTATOS\n"
.LC18:
	.string	"\n\tDigite o nome.: "
	.align 8
.LC19:
	.string	"\n\t________________________________________________________________"
	.align 8
.LC20:
	.string	"\n\n\tConsultar outro contato? (1-Sim / 0-Nao).: "
	.text
	.globl	consultar
	.type	consultar, @function
consultar:
.LFB9:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, -52(%rbp)
.L19:
	call	limpar_tela
	leaq	.LC17(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC18(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	call	limpar_buffer
	movq	stdin(%rip), %rdx
	leaq	-48(%rbp), %rax
	movl	$40, %esi
	movq	%rax, %rdi
	call	fgets@PLT
	leaq	.LC19(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	procurar
	leaq	.LC19(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC20(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-52(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-52(%rbp), %eax
	cmpl	$1, %eax
	je	.L19
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L20
	call	__stack_chk_fail@PLT
.L20:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	consultar, .-consultar
	.section	.rodata
.LC21:
	.string	"\n\t\t\tEDICAO DE CONTATOS\n"
.LC22:
	.string	"\n\t1-Editar"
.LC23:
	.string	"\n\t2-Voltar ao menu principal"
	.text
	.globl	editar
	.type	editar, @function
editar:
.LFB10:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, -12(%rbp)
.L26:
	call	limpar_tela
	leaq	.LC21(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC22(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC23(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-12(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-12(%rbp), %eax
	cmpl	$1, %eax
	je	.L22
	cmpl	$2, %eax
	je	.L29
	jmp	.L28
.L22:
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	procurar
	jmp	.L25
.L28:
	movl	$1, -12(%rbp)
	jmp	.L25
.L29:
	nop
.L25:
	movl	-12(%rbp), %eax
	cmpl	$1, %eax
	je	.L26
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L27
	call	__stack_chk_fail@PLT
.L27:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	editar, .-editar
	.section	.rodata
.LC24:
	.string	"\n\t\t\tEXCLUSAO DE CONTATOS\n"
.LC25:
	.string	"\n\t1-Um por vez"
.LC26:
	.string	"\n\t2-Todos"
.LC27:
	.string	"\n\t0-Voltar ao menu principal"
	.text
	.globl	excluir
	.type	excluir, @function
excluir:
.LFB11:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, -12(%rbp)
.L35:
	call	limpar_tela
	leaq	.LC24(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC25(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC26(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC27(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-12(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-12(%rbp), %eax
	cmpl	$1, %eax
	je	.L31
	cmpl	$2, %eax
	je	.L37
	jmp	.L34
.L31:
	call	excluir_contato
	jmp	.L34
.L37:
	nop
.L34:
	movl	-12(%rbp), %eax
	testl	%eax, %eax
	jne	.L35
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L36
	call	__stack_chk_fail@PLT
.L36:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	excluir, .-excluir
	.section	.rodata
.LC28:
	.string	"\n\tDigite o nome do contato.: "
.LC29:
	.string	"Temp.bin"
	.text
	.globl	excluir_contato
	.type	excluir_contato, @function
excluir_contato:
.LFB12:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	.LC28(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	call	limpar_buffer
	movq	stdin(%rip), %rdx
	leaq	-48(%rbp), %rax
	movl	$40, %esi
	movq	%rax, %rdi
	call	fgets@PLT
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	procurar
	testl	%eax, %eax
	jne	.L39
	leaq	.LC9(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC29(%rip), %rax
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -56(%rbp)
	movq	pFile(%rip), %rax
	movq	%rax, %rdi
	call	rewind@PLT
	jmp	.L40
.L41:
	movq	pFile(%rip), %rax
	movq	%rax, %rcx
	movl	$1, %edx
	movl	$130, %esi
	leaq	Pessoa(%rip), %rax
	movq	%rax, %rdi
	call	fread@PLT
	leaq	-48(%rbp), %rax
	leaq	Pessoa(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L40
	movq	-56(%rbp), %rax
	movq	%rax, %rcx
	movl	$1, %edx
	movl	$130, %esi
	leaq	Pessoa(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
.L40:
	movq	pFile(%rip), %rax
	movq	%rax, %rdi
	call	feof@PLT
	testl	%eax, %eax
	je	.L41
	leaq	.LC10(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC29(%rip), %rax
	movq	%rax, %rdi
	call	rename@PLT
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	jmp	.L44
.L39:
	call	limpar_buffer
	call	getchar@PLT
.L44:
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L43
	call	__stack_chk_fail@PLT
.L43:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	excluir_contato, .-excluir_contato
	.globl	fecha_arquivo
	.type	fecha_arquivo, @function
fecha_arquivo:
.LFB13:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	pFile(%rip), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	fecha_arquivo, .-fecha_arquivo
	.globl	limpar_buffer
	.type	limpar_buffer, @function
limpar_buffer:
.LFB14:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	stdin(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__fpurge@PLT
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	limpar_buffer, .-limpar_buffer
	.section	.rodata
.LC30:
	.string	"clear"
	.text
	.globl	limpar_tela
	.type	limpar_tela, @function
limpar_tela:
.LFB15:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	.LC30(%rip), %rax
	movq	%rax, %rdi
	call	system@PLT
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	limpar_tela, .-limpar_tela
	.section	.rodata
.LC31:
	.string	"\n\t\t\tRELATORIO DE CONTATOS\n"
	.align 8
.LC32:
	.string	"\n\tTecle enter para voltar ao menu principal"
	.text
	.globl	listar
	.type	listar, @function
listar:
.LFB16:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	pFile(%rip), %rax
	movq	%rax, %rdi
	call	rewind@PLT
	call	limpar_tela
	leaq	.LC31(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC19(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
.L50:
	movq	pFile(%rip), %rax
	movq	%rax, %rcx
	movl	$1, %edx
	movl	$130, %esi
	leaq	Pessoa(%rip), %rax
	movq	%rax, %rdi
	call	fread@PLT
	movq	pFile(%rip), %rax
	movq	%rax, %rdi
	call	feof@PLT
	testl	%eax, %eax
	jne	.L49
	call	mostrar
.L49:
	movq	pFile(%rip), %rax
	movq	%rax, %rdi
	call	feof@PLT
	testl	%eax, %eax
	je	.L50
	leaq	.LC19(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC32(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	call	limpar_buffer
	call	getchar@PLT
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	listar, .-listar
	.section	.rodata
.LC33:
	.string	"\n\tNome.....: %s"
.LC34:
	.string	"\n\tE-mail...: %s"
.LC35:
	.string	"\n\tTelefone.: %s"
.LC36:
	.string	"\n\tCelular..: %s\n"
	.text
	.globl	mostrar
	.type	mostrar, @function
mostrar:
.LFB17:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	Pessoa(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC33(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	40+Pessoa(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC34(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	90+Pessoa(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC35(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	110+Pessoa(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC36(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE17:
	.size	mostrar, .-mostrar
	.section	.rodata
.LC37:
	.string	"\n\tContato inexistente!"
	.text
	.globl	procurar
	.type	procurar, @function
procurar:
.LFB18:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	pFile(%rip), %rax
	movq	%rax, %rdi
	call	rewind@PLT
.L55:
	movq	pFile(%rip), %rax
	movq	%rax, %rcx
	movl	$1, %edx
	movl	$130, %esi
	leaq	Pessoa(%rip), %rax
	movq	%rax, %rdi
	call	fread@PLT
	movq	-8(%rbp), %rax
	leaq	Pessoa(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L53
	call	mostrar
.L53:
	movq	pFile(%rip), %rax
	movq	%rax, %rdi
	call	feof@PLT
	testl	%eax, %eax
	jne	.L54
	movq	-8(%rbp), %rax
	leaq	Pessoa(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L55
.L54:
	movq	-8(%rbp), %rax
	leaq	Pessoa(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L56
	leaq	.LC37(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$1, %eax
	jmp	.L57
.L56:
	movl	$0, %eax
.L57:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE18:
	.size	procurar, .-procurar
	.ident	"GCC: (GNU) 12.2.0"
	.section	.note.GNU-stack,"",@progbits
