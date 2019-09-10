	.data
	recebeString:		.space		16
	idGenerator:	.word	1

	str1: 			.asciiz 	"1. Registrar Despesa \n"
	str2: 			.asciiz 	"2. Listar Despesas \n"
  	str3: 			.asciiz 	"3. Excluir Despesa \n"
	str4: 			.asciiz 	"4. Exibir gasto mensal \n"
	str5: 			.asciiz 	"5. Exibir gasto por categoria \n"
	str6: 			.asciiz 	"6. Exibir ranking de despesa \n"
	str7:  			.asciiz 	"7. Sair \n\n"
	
	strOpc:			.asciiz 	"Digite a opcao desejada: "
	
	excluirDespesa: 	.asciiz 	"Digite o ID da despesa que deseja excluir: "
	
	exibMensal: 		.asciiz 	"O valor total de gastos no mes foi: "
	
	exibPorCategoria: 		.asciiz 	"O valor total de gastos por categoria foi: "
	
	exibRanking:		.asciiz		"----------RANKING----------"

	noList:			.asciiz		"\n\nYour List is Empty!\n\n"
	
	.text
	.globl main

no_list:
	li $v0, 4
  	la $a0, noList
  	syscall

main:
	li $v0, 4
  	la $a0, str1
  	syscall
 
  	la $a0, str2
  	syscall
 
  	la $a0, str3
  	syscall
 
  	la $a0, str4
  	syscall
 
  	la $a0, str5
  	syscall

  	la $a0, str6
  	syscall 
  	
  	la $a0, str7
  	syscall
  	
  	la $a0, strOpc
  	syscall
  	
  	li $v0, 5
  	syscall
	
  	beq $v0, 1,   jal_registrar_despesa
  	beq $v0, 2,   jal_lista_despesa
  	beq $v0, 3, jal_exclui_despesa	
  	# beq $v0, 4, jal_exibir_mensal
  	# beq $v0, 5, jal_exibir_categoria
  	# beq $v0, 6, jal_exibir_ranking	
   	beq $v0, 7, Exit
	j main

#---------------------------------------#
jal_registrar_despesa:
	divisor
	jal registrar_despesa
	j main

jal_lista_despesa:
	divisor
	jal lista_despesa
	j main

jal_exclui_despesa:
	divisor
	jal exclui_despesa
	j main

jal_exibir_mensal:
	divisor
	jal exibir_mensal
	j main

jal_exibir_categoria:
	divisor
	jal exibir_categoria
	j main

jal_exibir_ranking:
	divisor
	jal exibir_ranking
	j main

Exit:
  	end_program
