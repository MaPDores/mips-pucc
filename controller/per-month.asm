exibir_mensal:
	beq $s0, 0, no_list

	li $v0, 4
	la $a0, exibMensal
	syscall
	
	j main
	