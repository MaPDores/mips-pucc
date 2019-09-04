.macro	push (%data)
	addi $sp, $sp, -4
	sw %data, ($sp)
.end_macro

.macro	pop (%register)
	lw %register, ($sp)
	addi $sp, $sp, 4
.end_macro

.macro	end_program
	li $v0, 10
	syscall
.end_macro

# Compara strings salvas em $a0 e $a1 e salva em $v0 a comparação
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

# Converte ano (int salvo em a0) para Peralta Timestamp
year_to_peralta:
	li $t7, 365
	mulu $v0, $a0, $t7
	jr $ra
#-----------------------------------------------------#

# Converte mês (int salvo em a0) para Peralta Timestamp
month_to_peralta:
	li $t7, 30,4167
	mul.s $v0, $a0, $t7
	jr $ra
#-----------------------------------------------------#


	