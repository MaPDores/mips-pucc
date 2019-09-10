exibir_mensal:
	beq $s0, 0, no_list
	push($ra)
	
	move $t0, $s0
	get_month($t0)
	
	move $t1,$v0
	
	print_month_ec:
	beq $t0,0,end_l
	mtc1 $zero, $f0 
	
	move $a0, $t1
    li $v0, 1
    syscall
	
	li $v0, 4   # printa ": "
    la $a0, two_dots
    syscall

	
	sum_month_ec:
    get_price($t0)
    add.s $f0, $f12, $f0

    get_next($t0)
    move $t0, $v0
    beq $v0, 0, print_value_end

    get_month($t0)
    move $a1, $v0
    move $a0, $t1
    move $t1, $v0
	
	compare_month:
	beq $a0,$0,end_is_null_cm
	beq $a1,$0,end_is_null_cm
	
	sub $vo,$a0,$a1
	beq $a0,$a1,end_cm
	
	end_is_null_cm:
	sub $vo,$a0,$a1
	
	end_cm:
	
	
	
    bne $v0, 0, print_value_end

    j sum_month_ec


print_value_end:
    mov.s $f12, $f0  # printa valor acumulado
    li $v0, 2
    syscall

    linefeed

    j print_month_ec

end_l:
    divisor
    pause
	pop($ra)
	jr $ra
	
	j main