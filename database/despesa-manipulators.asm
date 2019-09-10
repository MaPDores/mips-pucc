#-----Instantiate category string-----#

instantiate_category: # Salva em $v0 o endere�o guardado pra string de categoria
	li $v0, 9
	li $a0, 16
	syscall
	add $a0, $v0, $zero
	jr $ra

#-----Getter functions-----#

.macro get_id (%node) 		# Salva o ID em $v0
	lw $v0, (%node)
.end_macro

.macro get_day (%node)		# Salva o dia em $v0
	lw $v0, 4(%node)
.end_macro

.macro get_month (%node)		# Salva o mes em $v0
	lw $v0, 8(%node)
.end_macro

.macro get_year (%node)		# Salva o ano em $v0
	lw $v0, 12(%node)
.end_macro

.macro get_category (%node)	# Salva endere�o da categoria em $v0
	lw $v0, 16(%node)
.end_macro

.macro get_price (%node)
	l.s $f12, 20(%node)	# Salva pre�o em $f12
.end_macro

.macro get_next (%node)
	lw $v0, 24(%node)
.end_macro

#--------Setters functions----------


.macro set_id (%node, %value)		# Salva o ID em $v0
	lw $t7, (%value)
	sw $t7, (%node)
	addi $t7, $t7, 1
	sw $t7, (%value)
.end_macro

.macro set_day (%node, %value)		# Salva a data (epoch) em $v0
	sw %value, 4(%node)
.end_macro

.macro set_month (%node, %value)		# Salva a data (epoch) em $v0
	sw %value, 8(%node)
.end_macro

.macro set_year (%node, %value)		# Salva a data (epoch) em $v0
	sw %value, 12(%node)
.end_macro

.macro set_category (%node, %value)	# Salva endere�o da categoria em $v0
	sw %value, 16(%node)
.end_macro

.macro set_price (%node, %value)
	s.s %value, 20(%node)	# Salva pre�o em $f12
.end_macro

.macro set_next (%node, %value)
	sw %value, 24(%node)	# Salva proxima
.end_macro
