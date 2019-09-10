exibir_ranking:
	beq $s0, 0, no_list
	
	li $v0, 4
	la $a0, exibRanking	
	syscall
	
	j main