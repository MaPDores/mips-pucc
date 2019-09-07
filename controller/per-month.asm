	.text
exibir_mensal:
	
	li $v0, 4
	la $a0, exibPorMes
	syscall
	
	j main
	