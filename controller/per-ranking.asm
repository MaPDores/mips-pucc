exibir_ranking:
	beq $s0, 0, no_list
		push($ra)

    jal decrescente_bubble_sort


    move $t0, $s0

    get_category($t0)
    move $t1, $v0   #salva categoria em $t1

print_category_ranking:
    beq $t0, 0, end_ranking  # final da lista pula para o end_ranking
    mtc1 $zero, $f0    # limpa $f0

    move $a0, $t1
    li $v0, 4
    syscall

    li $v0, 4   # printa ": "
    la $a0, two_dots
    syscall

sum_category_ranking:
    get_price($t0)
    add.s $f0, $f12, $f0

    get_next($t0)
    move $t0, $v0
    beq $v0, 0, print_value_ec

    get_category($t0)
    move $a1, $v0
    move $a0, $t1
    move $t1, $v0
    jal compare_string
    bne $v0, 0, print_value_ranking

    j sum_category_ranking
    # pega proxima
    # compara se é a mesma categoria
    # se for: soma e compara a proxima até não ser
    # se não for: printa o valor somado
    # printa a proxima categoria


print_value_ranking:
    mov.s $f12, $f0  # printa valor acumulado
    li $v0, 2
    syscall

    linefeed

    j print_category_ranking

end_ranking:
    divisor
    pause
	pop($ra)
	jr $ra

#--------------

decrescente_bubble_sort:		# $t0 = looper # $a0 = endereço do ultimo
	push($ra)
	move $t0, $s0            # t0 recebe inicio da lista
   	move $t1, $s0
	li $a2, 0 				# Salva o final da lista (null) em a0
	j sort_loop_bs			# Pula pro bubble

next_step_bs:
	beq $t0, $s0, end_bs	# se t0 ainda é a base (ou seja, não saiu do lugar), termina o bubble
	move $a2, $t0           # passa novo final para a0

	move $t0, $s0
    move $t1, $s0

sort_loop_bs:
	get_next($t0)			    # Pega o proximo
	beq $v0, $a2, next_step_bs  # se for igual ao final, vai pra next step
    move $t2, $v0

	get_category($t2)
	add $a1, $v0, $zero
	get_category($t0)
	add $a0, $v0, $zero

	jal compare_string      # compara

	bge $v0, $zero, continue_bs

	slt $v0, $v0, $zero
	beq $v0, $zero, swap_bs

continue_bs:
    move $t1, $t0
    move $t0, $t2

	j sort_loop_bs

swap_bs:
    beq $t0, $t1, swap_first_element_bs
	remove_next_node($t0)
    add_node($t0, $t2)
    set_next($t1, $t2)
    j continue_bs

swap_first_element_bs:
	remove_next_node($t0)
    push_node($t2, $s0)
    j continue_bs    

end_bs:
	pop($ra)
 	jr $ra
