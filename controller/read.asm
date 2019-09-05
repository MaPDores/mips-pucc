    .include "../database/linked-list.asm"
	.include "../database/despesa-manipulators.asm"

    .text
registrarDespesa:

 	li $v0, 4
  	la $a0, strTipoDespesa
  	syscall
 	#Leitura do tipo da Despesa

	jal create_node

	add $t0, $zero, $v0
	
	sw $zero, ($t0)
	sw $zero, 8($t0)

	li $v0,8
	la $a0, 4($t0)
	li $a1,16
	
	syscall

    j main