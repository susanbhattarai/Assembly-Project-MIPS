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
	# li $v0, 4
	# la $a0, str2
	# syscall
	
	# #read a character
	# li $v0, 12
	# syscall

	#print the 3rd prompt message
	li $v0, 4
	la $a0, str1
	syscall

	#read another integer
	li $v0, 5
	move $t1, $v0
	syscall
#Moving $t0 and $t1 in argument
move $a0, $t0
move $a1, $t1
jal adder #Calling add function

move $a0, $v0
li $v0, 1
syscall

exit:
	li $v0, 10
	syscall



adder:
	addi $sp, $sp, -12
	sw $ra, 0($sp)
	sw $t0, 4($sp)
	sw $t1, 8($sp)

	xor $t0, $a0, $a1  #Holding the sum
	and $t1, $a0, $a1 #Holding the carry

loop:
	beq $t1, $zero, breakloop
	sll $t1, $t1, 1 #carry << 1
	xor $t2, $t0, $t1 #temp = sum ^ carry
	and $t1, $t0, $t1 #carry = sum & carry
	move $t0, $t2 #sum = temp
	j loop

breakloop:
	move $v0, $t0
	lw $ra, 0($sp)
	lw $t0, 4($sp)
	lw $t1, 8($sp)
	addi $sp, $sp, 12
	jr $ra


#Main

#Do Math

#do_add

#do_subtract

#do_multiply

#do_divide

#Extra Credit Atoi Function

#End
