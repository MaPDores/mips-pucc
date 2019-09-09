	.text
lista_despesa:
	beq $s0, 0, no_list
	push($ra)
	add $t0, $s0, $zero

looper_lista_despesa:
	
	jal print_despesa
	get_next($t0)
	beq $v0, $0, end_lista_despesa

	add $t0, $v0, $zero
	j looper_lista_despesa

end_lista_despesa:
	pop($ra)
  	jr $ra