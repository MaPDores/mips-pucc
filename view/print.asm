	.include "../utils.asm"

	.data
	exibID:				.asciiz		"ID: "			
	exibData: 			.asciiz 	"data: "
	exibCategoria:		.asciiz 	"categoria: "
	exibValor:			.asciiz		"valor: "
	
	.text
print_despesa:  # Usa os registradores $v0, $a0, $t0

	li $v0, 4
  	la $a0, exibID
  	syscall

	get_id($t0)
	move $a0, $v0
	li $v0, 1
	syscall

	linefeed


  	li $v0, 4
  	la $a0, exibData
  	syscall

	get_year($t0)
	push($v0)
	get_month($t0)
	push($v0)
	get_day($t0)
	push($v0)
	jal print_date

	linefeed


  	li $v0, 4
  	la $a0, exibCategoria
  	syscall

	get_category($t0)
  	add $a0, $v0, $zero
 	li $v0, 4
  	syscall


  	li $v0, 4
  	la $a0, exibValor
  	syscall  	

	li $v0, 2
	get_price($t0)
    syscall

  	li $v0, 4
  	la $a0, divisor
  	syscall  	

    jr $ra

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
