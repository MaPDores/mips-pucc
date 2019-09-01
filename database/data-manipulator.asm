#-----Instantiate category string-----#

instantiate_category: # Salva em $v0 o endereço guardado pra string de categoria
	li $v0, 9
	li $a0, 16
	syscall
	jr $ra

#-----Getter functions-----#

.macro get_id (%node) 		# Salva o ID em $v0
	lw $a0, (%node)
.end_macro

.macro get_date (%node)		# Salva a data (epoch) em $v0
	lw $a0, 4(%node)
.end_macro

.macro get_category (%node)	# Salva endereço da categoria em $v0
	la $a0, 8(%node)
.end_macro

.macro get_price (%node)
	l.s $f12, 24(%node)	# Salva preço em $f12
.end_macro

.macro get_next (%node)
	lw $a0, 32(%node)
.end_macro

#--------Setters functions----------

.macro set_id (%node, %value) 		# Salva o ID em $v0
	sw %value, (%node)
	addi %node, %node, 1
.end_macro

.macro set_date (%node, %value)		# Salva a data (epoch) em $v0
	sw %value, 4(%node)
.end_macro

.macro set_category (%node, %value)	# Salva endereço da categoria em $v0
	sw %value, 8(%node)
.end_macro

.macro set_price (%node, %value)
	s.s %value, 12(%node)	# Salva preço em $f12
.end_macro
