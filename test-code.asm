	.include "database/repository.asm"
	.data
	space:		.ascii	" "

	#-----------------Estrutura do Database-------------------#
	# _____________________1b_________________________________#
	# | 4b |  8b  |  15b |null|   4b  |          4b          |#
	# | id | data | categoria | valor | ponteiro_pro_proximo |#
	#---------------------------------------------------------#
	.text
	.globl main	

print_list:
	la $t9, ($s0)
loop:	li $v0, 2
	l.s $f12, ($t9)
	syscall

	li $v0, 11
	lw $a0, space
	syscall
	
	lw $t9, 32($t9)
	beqz $t9, end
	j loop
end:	jr $ra

main:

	
	jal create_node
	la $s0, ($v0)
	la $t0, ($s0) 
	#--$s0 guarda a lista, $t0 é para percorrê-la--#
	li $v0, 6
  	syscall
 	
	s.s $f0, ($t0)	#t0 => | 123 | null |
	# repeat
	
	jal create_node
	la $t2, ($v0)
	la $t1, ($t2)	#123 em t2
	li $v0, 6
	syscall
	
	s.s $f0, ($t1)
	
	# repeat
	jal create_node
	la $t2, ($v0)
	li $t1, 213	#123 em t2
	sw $t1, ($t2)	#t2 => | 123 | null |
	push_node($t2, $s0)
	la $t0, ($t2)
	# repeat
	jal create_node
	la $t2, ($v0)
	li $t1, 111	#123 em t2
	sw $t1, ($t2)	#t2 => | 123 | null |
	push_node($t2, $s0)
	la $t0, ($t2)
	# repeat
	jal create_node
	la $t2, ($v0)
	li $t1, 1127	#123 em t2
	sw $t1, ($t2)	#t2 => | 123 | null |
	push_node($t2, $s0)
	la $t0, ($t2)
	jal print_list
	
	li $v0, 10
	syscall
