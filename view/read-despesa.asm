	.data
		strCategoria:  	.asciiz 	"-------------------------\nDigite a categoria da despesa: "
		strDia:	 		.asciiz		"Digite o dia da despesa: "
		strMes:			.asciiz		"Digite o mes da despesa: "
		strAno:			.asciiz		"Digite o ano da despesa: "
		strPreco: 		.asciiz 	"Digite o valor gasto em reais: "

	.text
read_category:
   	li $v0, 4
  	la $a0, strCategoria
  	syscall

    jr $ra

read_day:
    li $v0, 4
  	la $a0, strDia
  	syscall

    jr $ra

read_month:
   	li $v0, 4
  	la $a0, strMes
  	syscall

    jr $ra

read_year:
 	li $v0, 4
  	la $a0, strAno
  	syscall

    jr $ra

read_price:
 	li $v0, 4
  	la $a0, strPreco
  	syscall

    jr $ra