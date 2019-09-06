create_node: # Aloca memoria e salva em $v0
	li $a0, 28
	li $v0, 9
	syscall
	sw $zero, 24($v0)
	jr $ra

.macro add_node (%register_with_new, %register_with_current)
	lw $a0, 24(%register_with_current) 		# a0 = current->next 
	beqz $a0, add_node_L1				# se next for null, pula pra label
	sw $a0, 24(%register_with_new)			# new_node->next = a0
add_node_L1:
	sw %register_with_new, 24(%register_with_current)	# current->next = endere�o de new_node
end_macro:
.end_macro

.macro remove_next_node (%register_with_current)
	lw $a0, 24(%register_with_current) 
	beqz $a0, end_macro
	lw $a0, 24($a0)
	sw $a0, 24(%register_with_current)
end_macro:
.end_macro

.macro push_node (%register_with_new, %base_pointer)
	la $a1, (%base_pointer)
loop:	addi $a0, $a1, 24
	lw $a1, ($a0)
	bnez $a1, loop
	sw %register_with_new, ($a0)
.end_macro
