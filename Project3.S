#Start
.data
	str1: .asciiz "Please enter an integer:\n"
	str2: .asciiz "Please enter an operator (+, -, *, /):\n"


.text
main:
	#print the 1st prompt message
	li $v0, 4
	la $a0, str1
	syscall

	#read an integer
	li $v0, 5
	move $t0, $v0
	syscall

	#print the 2st prompt message
	li $v0, 4
	la $a0, str2
	syscall
	
	#read a character
	li $v0, 12
	syscall

	#print the 3rd prompt message
	li $v0, 4
	la $a0, str1
	syscall

	#read another integer
	li $v0, 5
	move $t1, $v0
	syscall

move $a0, $t0
move $a1, $t1
jal adder

move $a0, $v0
li $v0, 1
syscall


adder:
	addi $sp, $sp, -12
	sw $ra, 0($sp)
	sw $s0, 4($sp)
	sw $s1, 8($sp)

	xor $s0, $a0, $a1  #Holding the sum
	and $s1, $a0, $a1 #Holding the carry

loop:
	beq $s1, $zero, breakloop
	sll $s1, $s1, 1 #carry << 1
	xor $t0, $s0, $s1 #temp = temp ^ carry
	and $s1, $s0, $s1 #carry = sum & carry
	move $s0, $t0
	j loop

breakloop:
	move $v0, $s0
	lw $ra, 0($sp)
	lw $s0, 4($sp)
	lw $s1, 8($sp)
	addi $sp, $sp, 12
	jr $ra


exit:
	li $v0, 10
	syscall






#Main

#Do Math

#do_add

#do_subtract

#do_multiply

#do_divide

#Extra Credit Atoi Function

#End
