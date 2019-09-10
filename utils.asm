	.data
	two_dots:			.asciiz		": "
	bar:				.asciiz		"/"
	lf:  				.asciiz 	"\n"
    divisor_bar:		.asciiz     "---------------------\n"
	blank_space:		.space		4

	.text
.macro	push (%data)
	addi $sp, $sp, -4
	sw %data, ($sp)
.end_macro

.macro	pop (%register)
	lw %register, ($sp)
	addi $sp, $sp, 4
.end_macro

.macro	linefeed
	li $v0, 4
  	la $a0, lf
  	syscall
.end_macro

.macro remove_linefeed (%string_address)
	la $t7, (%string_address)
loop:
	lb $t6, ($t7)
	beq $t6, 10, remove
	beq $t6, 0, end_macro

	addi $t7, $t7, 1
	j loop
remove:
	li $t6, 0
	sb $t6, ($t7)
end_macro:
.end_macro

.macro	divisor
	li $v0, 4
  	la $a0, divisor_bar
  	syscall
.end_macro

.macro	pause
	li $v0, 8
	la $a0, blank_space
	li $a1, 1
	syscall
.end_macro

.macro	end_program
	li $v0, 10
	syscall
.end_macro

# Compara strings salvas em $a0 e $a1 e salva em $v0 a compara��o
compare_string:

# Load char in $t7 and $t6
	lb $t7, ($a0)
	lb $t6, ($a1)

# Compare if it's NULL and if it is, branch to 'end_cs'
	beq $t7, $0, end_is_null_cs
	beq $t6, $0, end_is_null_cs

# Subtract for char comparison
	sub $v0, $t7, $t6
	beq $v0, $0, looper_cs
	j end_cs

looper_cs:
	addi $a0, $a0, 1
	addi $a1, $a1, 1
	j compare_string

end_is_null_cs:
	sub $v0, $t7, $t6
end_cs:
	jr $ra
#---------------------------------------------------------------#
