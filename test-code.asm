	.include "database/repository.asm"
	.data
	#Codigo apenas para testes...
	
	space:		.ascii		" "
	out_string: 	.asciiz 	"\nDigite o dia: "
	out_string2: 	.asciiz 	"\nDigite o mes: "
	out_string3: 	.asciiz 	"\nDigite o ano: "
	
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
	
	li $v0, 4 # system call code for printing string = 4
	la $a0, out_string # load address of string to be printed into $a0
	syscall
	#? s.s $f0, 100($t2) =  store word from $f0 into address $t2+100
	jal create_node
	la $s0, ($v0)
	la $t0, ($s0) 
	#--$s0 guarda a lista, $t0 é para percorrê-la--#

	li $v0, 6
  	syscall
  	push_node($t2, $s0)
	s.s $f0, ($t0)	#t0 => | 123 | null |
	
	


	# repeat
	li $v0, 4 
	la $a0, out_string2 
	syscall
	jal create_node
	la $t2, ($v0)
	

	
	li $v0, 6
  	syscall
  	push_node($t2, $s0)
	s.s $f0, ($t2)
	

	# repeat
	li $v0, 4
	la $a0, out_string3
	syscall
	jal create_node
	la $t2, ($v0)

	li $v0, 6
  	syscall
	push_node($t2, $s0)
	s.s $f0, ($t2)
	
	#print apenas para teste de saida
	jal print_list
	
	li $v0, 10
	syscall
