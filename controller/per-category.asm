exibir_categoria:
	beq $s0, 0, no_list
# 	push($ra)

# 	add $t0, $s0, $0
# 	jal alphabetic_sort

# 	pop($ra)
# 	jr $ra

# #--------------

# alphabetic_bubble_sort:		# $t0 = looper # $t3 = endereço do ultimo
# 	li $t3, 0 				# Salva o final da lista (null) em t3
# 	j sort_loop_as			# Pula pro bubble

# walk_loop_as:
# 	beq $t0, $s0, end_as	# se t0 ainda é a base (ou seja, não saiu do lugar), termina o bubble
# 	move $t3, $t0
# 	move $t0, $s0

# sort_loop_as:
# 	get_next($t0)			# Pega o proximo
# 	beq $v0, $t3, walk_loop_as # se for igual ao final, vai pra walk loop

# 	add $t1, $v0, $0		# 

# 	get_category($t3)
# 	add $a1, $v0, $0
# 	get_category($t0)
# 	add $a0, $v0, $0

# 	jal compare_string

# 	slt $v0, $v0, $0
# 	beq $v0, $0, swap_as
	

# 	j sort_loop_as

# swap_as:
# 	get_next(%current)
# 	move $a0, $v0
# 	remove_next_node(

# end_as:
 	jr $ra