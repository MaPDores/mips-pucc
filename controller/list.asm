	.include "../view/print.asm"

	.text
lista_despesa:
	add $t0, $s0, $zero

looper_lista_despesa:
	jal print_despesa

	get_next($t0)
	beq $v0, $0, end_lista_despesa

	j looper_lista_despesa

end_lista_despesa:
  	jr $ra