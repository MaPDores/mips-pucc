exibirMensal:
	
	li $v0, 4
	la $a0, exibMensal
	syscall
	
	j main
	