	#.include "database/repository.asm"
	#.include "database/data-manipulator.asm"
	.include "utils.asm"
	.data
	space:		.ascii	" "
	str1:		.asciiz	"abrc"
	str2:		.asciiz	"abrd"
	.text
	.globl main

main:	
	la $a0, str1
	la $a1, str2
	jal compare_string
	
	la $a0, ($v0)
	li $v0, 1
	syscall

	end_program 
