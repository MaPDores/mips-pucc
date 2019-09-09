	.text
registrar_despesa:
	push($ra)

	jal create_node
	add $t0, $v0, $zero

	bne $s0, 0, not_first_node

	add $s0, $v0, $zero
	j first_node

not_first_node:
	push_node($t0, $s0)

first_node:
	# Seta o ID #
	la $t1, idGenerator
	set_id($t0, $t1)
	# --------- #

 	# Leitura e Set da Categoria #
 	li $v0, 4
  	la $a0, strCategoria
  	syscall

	jal instantiate_category
	li $v0, 8
	li $a1, 16
	syscall

	set_category($t0, $a0)
	# -------------------------- #

 	# Leitura e Set do Dia #
 	li $v0, 4
  	la $a0, strDia
  	syscall

	li $v0, 5
  	syscall

	set_day($t0, $v0)
	# -------------------- #

 	# Leitura e Set do Mês #
 	li $v0, 4
  	la $a0, strMes
  	syscall

	li $v0, 5
  	syscall

	set_month($t0, $v0)
	# -------------------- #

	# Leitura e Set do Ano #
 	li $v0, 4
  	la $a0, strAno
  	syscall

	li $v0, 5
  	syscall

	set_year($t0, $v0)
	# -------------------- #

	# Leitura e Set do Preço #
 	li $v0, 4
  	la $a0, strGasto
  	syscall

	li $v0, 6
	syscall

	set_price($t0, $f0)
	# ---------------------- #
	
	divisor

	pop($ra)
	jr $ra
