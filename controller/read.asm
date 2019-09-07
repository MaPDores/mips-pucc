    .include "../database/linked-list.asm"
	.include "../database/despesa-manipulators.asm"
	.include "../view/read.asm"

	.text
registrar_despesa:

	jal create_node
	add $t0, $v0, $zero

	# Seta o ID #
	la $t1, idGenerator
	set_id($t0, $t1)
	# --------- #

 	# Leitura e Set da Categoria #

	jal read_category

	jal instantiate_category
	li $v0, 8
	li $a1, 16
	syscall

	set_category($t0, $a0)
	# -------------------------- #

 	# Leitura e Set do Dia #
	jal read_day

	li $v0, 5
  	syscall

	set_day($t0, $v0)
	# -------------------- #

 	# Leitura e Set do Mês #
	jal read_month

	li $v0, 5
  	syscall

	set_month($t0, $v0)
	# -------------------- #

	# Leitura e Set do Ano #
	jal read_year

	li $v0, 5
  	syscall

	set_year($t0, $v0)
	# -------------------- #

	# Leitura e Set do Preço #
	jal read_price

	li $v0, 6
	syscall

	set_price($t0, $f0)
	# ---------------------- #

	jr $ra