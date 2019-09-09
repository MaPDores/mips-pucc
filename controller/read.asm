    .include "../database/linked-list.asm"
	.include "../database/despesa-manipulators.asm"

	.data
		strDia:	 		.asciiz		"Digite o dia da despesa: "
		strMes:			.asciiz		"Digite o mes da despesa: "
		strAno:			.asciiz		"Digite o ano da despesa: "
		strCategoria:  	.asciiz 	"Digite a categoria da despesa: "
		strGasto: 		.asciiz 	"Digite o valor gasto em reais: "

	.text
registrarDespesa:

	jal create_node
	add $t0, $v0, $zero

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

	# linefeed
	# linefeed

	# get_id($t0)
	# move $a0, $v0
	# li $v0, 1
	# syscall

	# linefeed

	# get_year($t0)
	# push($v0)
	# get_month($t0)
	# push($v0)
	# get_day($t0)
	# push($v0)
	# jal print_date

	# linefeed

	# get_category($t0)
  	# add $a0, $v0, $zero
 	# li $v0, 4
  	# syscall

	# li $v0, 2
	# get_price($t0)
    # syscall

	# li $v0, 5
  	# syscall


	end_program