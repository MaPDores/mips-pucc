    .include "../database/linked-list.asm"
	.include "../database/despesa-manipulators.asm"

	.data
		strDia:	 		.asciiz		"Digite o dia da despesa: "
		strMes:			.asciiz		"Digite o mes da despesa: "
		strAno:			.asciiz		"Digite o ano da despesa: "
		strCategoria:  	.asciiz 	"Digite a categoria da despesa: "
		strGasto: 		.asciiz 	"Digite o valor gasto em reais: "
		strDelete:      .asciiz     "Digite o ID da despesa que deseja excluir: "
		Encontrado:		.asciiz		"Node encontrada!"
		naoEncontrado:	.asciiz		"Node nao encontrada!"

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

 	# Leitura e Set do M?s #
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

	# Leitura e Set do Pre?o #
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

	j main

excluiDespesa:

        li $v0, 4
        la $a0, strDelete
        syscall

        li $v0, 5
        syscall

		add $t1, $zero, $v0

		li $t2, 0
Procura:

		beq $t0, $0, nodeNaoEncontrada
		lw $t3, 0($t0)	
		beq $t1, $t3, nodeEncontrada
		add $t2, , $zero, $t0
		lw $t0, 8($t0)
		j Procura

		nodeEncontrada:
			li $v0, 4
			la $a0, Encontrado
			syscall
			beq $t2, $zero, Delete


		Delete:
			lw $t2, 8($t0)				
			add $s1, $zero, $t2			
			j main

		nodeNaoEncontrada:
				
			li $v0, 4
			la $a0, naoEncontrado					
			syscall				
			j main


		#percorrer todas as nodes procurando o id
		#loop
		#acha uma node
		#eh esse o ID digitado?
		#exclui
		#senao, prossegue

	    end_program