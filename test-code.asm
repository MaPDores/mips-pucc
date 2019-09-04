	#.include "database/repository.asm"
	#.include "database/data-manipulator.asm"
	.include "utils.asm"
	.data
	space:		.ascii	" "
	str1:		.asciiz	"abrca"
	str2:		.asciiz	"abrcas"
	.text
	.globl main

main:	
	li $a0, 2018
	jal year_to_peralta
	
	la $a0, ($v0)
	li $v0, 1
	syscall

	end_program 
