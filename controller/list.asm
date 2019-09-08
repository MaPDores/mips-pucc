listaDespesa:			    
	li $v0, 4
  	la $a0, exibID
  	syscall
  	
  	li $v0, 4
  	la $a0, exibData
  	syscall
  	
  	li $v0, 4
  	la $a0, exibTipo
  	syscall
  	
  	li $v0, 4
  	la $a0, exibValor
  	syscall
  	
  	j main