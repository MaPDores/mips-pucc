exclui_despesa:
	beq $s0, 0, no_list

	li $v0, 4
	la $a0, excluirDespesa
	syscall

	li $v0, 5
	syscall

	move $t2, $v0
	move $t0, $s0
	move $t1, $s0

looper_ed:
	get_id($t1)
	beq $t2, $v0, delete_ed

	get_next($t1)
	beq $v0, 0, end_ed
	move $t0, $t1
	move $t1, $v0
	j looper_ed

delete_ed:
	beq $t0, $t1, delete_from_begining
	remove_next_node($t0)
	j end_ed
delete_from_begining:
	get_next($t0)
	move $s0, $v0
end_ed:
	divisor
	jr $ra