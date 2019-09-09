exclui_despesa:
	
	li $v0, 4
	la $a0, excluirDespesa
	syscall
	
	j main