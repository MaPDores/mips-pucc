	.data
	bar:	.asciiz		"/"
	lf:  	.asciiz 	"\n"
    divisor_bar:          .asciiz     "---------------------\n"
	
	.text
.macro	push (%data)
	addi $sp, $sp, -4
	sw %data, ($sp)
.end_macro

.macro	pop (%register)
	lw %register, ($sp)
	addi $sp, $sp, 4
.end_macro

.macro print(%data)
	li $v0, 4
  	la $a0, %data
  	syscall
.end_macro

.macro	linefeed
	li $v0, 4
  	la $a0, lf
  	syscall
.end_macro

.macro	divisor
	li $v0, 4
  	la $a0, divisor_bar
  	syscall
.end_macro

.macro	end_program
	li $v0, 10
	syscall
.end_macro

# Compara strings salvas em $a0 e $a1 e salva em $v0 a comparação #
compare_string:

	# Load char in $t7 and $t6
	lb $t7, ($a0)
	lb $t6, ($a1)

	# Compare if it's NULL and if it is, branch to 'end_strcmp'
	beq $t7, $0, end_strcmp
	beq $t6, $0, end_strcmp

	# Subtract for char comparison
	sub $t7, $t7, $t6
	beq $t7, $0, looper_strcmp
	j end_strcmp

looper_strcmp:
	addi $a0, $a0, 1
	addi $a1, $a1, 1
	j compare_string
end_strcmp:
	sub $v0, $t7, $t6
	jr $ra
#-----------------------------------------------------------------#
