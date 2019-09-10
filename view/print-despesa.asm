	.data
	exibID:				.asciiz		"ID: "			
	exibData: 			.asciiz 	"data: "
	exibCategoria:		.asciiz 	"categoria: "
	exibPreco:			.asciiz		"valor: "
	
	.text
print_id:
	li $v0, 4
  	la $a0, exibID
  	syscall

	move $a0, $a1
	li $v0, 1
	syscall

	linefeed

	jr $ra


print_category:
	li $v0, 4
  	la $a0, exibCategoria
  	syscall

	move $a0, $a1
	li $v0, 4
	syscall

	linefeed

	jr $ra


print_price:
	li $v0, 4
  	la $a0, exibPreco
  	syscall

	li $v0, 2
	syscall

	linefeed
	divisor

	jr $ra


# Pega os 3 valores da pilha e printa com '/' entre eles #
print_date:
	li $v0, 4
  	la $a0, exibData
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

	li $v0, 4
	la $a0, bar
	syscall
	
	pop($t7)
	add $a0, $t7, $zero
	li $v0, 1
	syscall

	linefeed

	jr $ra
# ------------------------------------------------------ #
