.text
.globl main
main:
# this program multiplies two 31 bit numbers "A" and "B" together and displays the result.
	li	$v0, 4
	la	$a0, prompt1
	syscall
	
	li	$v0, 5		#read keyboard input
	syscall
	move	$t0, $v0	# A is stored in t0.
	
	li	$v0, 4
	la	$a0, prompt2
	syscall
	
	li	$v0, 5
	syscall
	move	$t1, $v0	# B is stored in t1.
	
	li	$t7, 1
	li	$t2, 1		# t2 is the loop counter.
loop:
	bge	$t2, 32, print		#repeat 31 times.
					# t3 acts as "E"
	andi	$t3, $t1, 1		# E AND B, store in t3.
	beqz	$t3, skip1
	addu	$t5, $t5, $t0		# acts as register C.
	
	
skip1:
					
	andi	$t3, $t5, 1
	beqz	$t3, skip2
	addu	$t6, $t6, $t7
skip2:
	sll	$t7, $t7, 1
	srl	$t5, $t5, 1
	srl	$t1, $t1, 1
	
	addiu	$t2, $t2, 1	#increment the loop counter
	j	loop
	
		
print:
	li	$v0, 4
	la	$a0, answer
	syscall
	
	li	$v0, 35
	move	$a0, $t5
	syscall
	
	li	$v0, 35
	move	$a0, $t6
	syscall

end:	li $v0, 10		#exit
	syscall

.end
.data
prompt1:
	.asciiz "Enter the first number	 "
prompt2:
	.asciiz "Enter the second number  "
answer:
	.asciiz "The product is "
