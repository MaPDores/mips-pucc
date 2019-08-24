.data
	
	str1: 			.asciiz 	"1. Registrar Despesa \n"
	str2: 			.asciiz 	"2. Listar Despesas \n"
  	str3: 			.asciiz 	"3. Excluir Despesa \n"
	str4: 			.asciiz 	"4. Exibir gasto mensal \n"
	str5: 			.asciiz 	"5. Exibir gasto por categoria \n"
	str6: 			.asciiz 	"6. Exibir ranking de despesa \n"
	str7:  			.asciiz 	"7. Sair \n\n"
	
	strOpc:			.asciiz 	"Digite a opcao desejada: "
	strDia:	 		.asciiz		"Digite o dia da despesa: "
	strMes:			.asciiz		"Digite o mes da despesa: "
	strAno:			.asciiz		"Digite o ano da despesa: "
	srtTipoDespesa:  	.asciiz 	"Digite o tipo de despesa: "
	strGasto: 		.asciiz 	"Digite o valor gasto em reais: "
	
	
	exibID:			.asciiz		"O ID da despesa é: "			
	exibData: 		.asciiz 	"A data da despesa é: "
	exibTipo:		.asciiz 	"O tipo da despesa é: "
	exibValor:		.asciiz		"O valor gasto é: "
	
	excluirDespesa: 	.asciiz 	"Digite o ID da despesa que deseja excluir: "
	
	exibMensal: 		.asciiz 	"O valor total de gastos no mes foi: "
	
	exibCategoria: 		.asciiz 	"O valor total de gastos por categoria foi: "
	
	exibRanking:		.asciiz		"----------RANKING----------"
	
	
	
	.text
	.globl main
	
main:

	li $v0, 4
  	la $a0, str1
  	syscall
 
  	li $v0, 4
  	la $a0, str2
  	syscall
 
  	li $v0, 4
  	la $a0, str3
  	syscall
 
  	li $v0, 4
  	la $a0, str4
  	syscall
 
  	li $v0, 4
  	la $a0, str5
  	syscall

 	li $v0, 4
  	la $a0, str6
  	syscall 
  	
  	li $v0, 4
  	la $a0, str7
  	syscall
  	
  	li $v0, 4
  	la $a0, strOpc
  	syscall
  	
  	li $v0, 5
  	syscall
  	
  	beq $v0, 1, registrarDespesa
  	beq $v0, 2, listaDespesa
  	beq $v0, 3, excluiDespesa	
  	beq $v0, 4, exibirMensal
  	beq $v0, 5, exibirCategoria
  	beq $v0, 6, exibirRanking	
   	beq $v0, 7, Exit
  	
 
 registrarDespesa:
 
 	li $v0, 4
  	la $a0, strDia
  	syscall
  	
  	li $v0, 5
  	syscall
  	
  	li $v0, 4
  	la $v0, strMes
  	syscall
  	
  	li $v0, 5
  	syscall
  	
	li $v0, 4
	la $v0, strAno
	syscall
	
	li $v0, 5
	syscall
	
	li $v0, 4
	la $v0, srtTipoDespesa
	syscall 
	
	li $v0, 5
	syscall
	
	li $v0, 4
	la $v0, strGasto
	syscall
	
	li $v0, 6 #v0, 6 le em float; v0, 2(printa float)
	syscall
	
	j main

listaDespesa: 

	li $v0, 4
  	la $a0, exibID
  	syscall
  	
  	li $v0, 4
  	la $a0, exibData
  	syscall
  	
  	li $v0, 4
  	la $a0, exibTipo
  	syscall
  	
  	li $v0, 4
  	la $a0, exibValor
  	syscall
  	
  	j main
  	
excluiDespesa:
	
	li $v0, 4
	la $a0, excluirDespesa
	syscall
	
	j main
	
exibirMensal:
	
	li $v0, 4
	la $a0, exibMensal
	syscall
	
	j main
	
exibirCategoria:

	li $v0, 4
	la $a0, exibCategoria
	syscall
	
	j main
	
exibirRanking:
	
	li $v0, 4
	la $a0, exibRanking	
	syscall
	
	j main
 	
 Exit: 
  	li      $v0, 10              # terminate program run and
    	syscall 
  	
  	
