print_despesa:  # Usa os registradores $v0, $a0, $t0
	push($ra)

	get_id($t0)
    move $a1, $v0
    jal print_id

	get_year($t0)
	push($v0)
	get_month($t0)
	push($v0)
	get_day($t0)
	push($v0)
	jal print_date

	get_category($t0)
    move $a1, $v0
    jal print_category

	get_price($t0)
    jal print_price

	pop($ra)
	jr $ra