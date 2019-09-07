	.data
	bar:	.asciiz	"/"
	lf:  			.asciiz 	"\n"

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

.macro	end_program
	li $v0, 10
	syscall
.end_macro

# Compara strings salvas em $a0 e $a1 e salva em $v0 a compara��o
compare_string:

# Load char in $t7 and $t6
	lb $t7, ($a0)
	lb $t6, ($a1)

# Compare if it's NULL and if it is, branch to 'end'
	beq $t7, $0, end
	beq $t6, $0, end

# Subtract for char comparison
	sub $t7, $t7, $t6
	beq $t7, $0, looper
	j end

looper:
	addi $a0, $a0, 1
	addi $a1, $a1, 1
	j compare_string
end:
	sub $v0, $t7, $t6
	jr $ra
#---------------------------------------------------------------#

# Pega os 3 valores da pilha e printa com '/' entre eles #
print_date:
	pop($t7)
	add $a0, $t7, $zero
	li $v0, 1
	syscall

	li $v0, 4
	la $a0, bar
	syscall
	
	pop($t7)
	add $a0, $t7, $zero
	li $v0, 1
	syscall

	li $v0, 4
	la $a0, bar
	syscall
	
	pop($t7)
	add $a0, $t7, $zero
	li $v0, 1
	syscall

	jr $ra
# ------------------------------------------------------ #


	
