 	.data

	str1: 		.asciiz 	"1. Registrar Despesa \n"
	str2: 		.asciiz 	"2. Listar Despesas \n"
  	str3: 		.asciiz 	"3. Excluir Despesa \n"
	str4: 		.asciiz 	"4. Exibir gasto mensal \n"
	str5: 		.asciiz 	"5. Exibir gasto por categoria \n"
	str6: 		.asciiz 	"6. Exibir ranking de despesa \n"
	str7:  		.asciiz 	"7. Sair \n\n"
	strOpc:		.asciiz 	"Digite a opcao desejada: "
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
  	
  	beq $v0, 7, Exit
  	
 Exit: 
  	li      $v0, 10              # terminate program run and
    	syscall 
  	
  	
  	
