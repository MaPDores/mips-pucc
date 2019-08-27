.macro	push (%data)
	addi $sp, $sp, -4
	sw %data, ($sp)
.end_macro

.macro	pop (%register)
	lw %register, ($sp)
	addi $sp, $sp, 4
.end_macro

.macro	end_program
	li $v0, 10
	syscall
.end_macro