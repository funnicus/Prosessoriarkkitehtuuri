#int fib(int n){if(n ==0){
#	return 0;
#}else if(n ==1){
#	return 1;
#}
#return fib(n-1)+fib(n-2);
#}

Answer:

.data
fibs: .word 0,0,0,0,0,0,0,0,0,0,0,0	# "array" of 12 words to contain fib values
size: .word 12				# size of "array"

.text
	la t0, fibs	# load address of array
	la t5, size	# load address of size variable
	lw t5, 0(t5)	# load array size
	li t2, 1	# 1 is first and second fib number
	sw t2, 0(t0)	# F[0] = 0
	sw t2, 4(t0)	# F[1] = 1
	addi t1, t5, -2	#counter for loop, will execute (size-2) times
	
loop:
	lw t3, 0(t0)	# get value from array F[n]
	lw t4, 4(t0)	# get value from array F[n+1]. Offset 4 32-bit eli yksi eteenpäin
	add t2, t3, t4	# $t2 = F[n] + F[n+1]
	sw t2, 8(t0)	# Store F[n+2] = F[n] + F[n+1] in array. 32-bit = 8 eli kaski eteenpäin
	addi t0, t0, 4 	# increment address of Fib. number source
	addi, t, t1, -1	# decrement loop counter
	bgtz t1, loop	# repeat if not finished
	
exit:
	li a0, 10	# system call for exit
	ecall		# bye bye