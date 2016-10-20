#Start
.data:
	str1: .asciiz "Please enter an integer:"
	str2: .asciiz "Please enter an operator (+, -, *, /):"
.text:
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







#Main

#Do Math

#do_add

#do_subtract

#do_multiply

#do_divide

#Extra Credit Atoi Function

#End
