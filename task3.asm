.text
.globl main
main:
# this program prints prime numbers up until the input number
	li	$v0, 4
	la	$a0, prompt1
	syscall
	
	li	$v0, 5	 		#read keyboard into $v0 (number x is number to test)
	syscall
	move	$t0, $v0		#number goes into $t0
	
	li	$t1, 2 			#initialize i to 2
	
loop1:	bge 	$t1, $t0, end		#Is i greater than or equal to the input? If so, end loop.

	li	$t4, 2			#initialize j to 2, the inner loop
	
loop2:	bge	$t4, $t1, endInner	#end the inner loop when j >= i.
	div	$t1, $t4		# i / j. remainder stored in Hi.
	mfhi	$t5			# retrieve the remainder and store in t5.
	beqz	$t5, endOuter		#number isn't prime, just continue loop1.
	addi	$t4, $t4, 1		#increment j.
	j	loop2			# if remainder is not 0, break out of the inner loop.

endInner:
		
	li	$v0, 1
	move	$a0, $t1		# print i.
	syscall
	
	la     $a0, newLine
     	addi   $v0, $0, 4
     	syscall
     
endOuter:	
	addi	$t1, $t1, 1	#i = i + 1
	j	loop1		 
	
end:	li $v0, 10	#exit
	syscall
	
.end

.data
prompt1:
	.asciiz "Enter the limiting number   "
newLine:
	.asciiz "\n"