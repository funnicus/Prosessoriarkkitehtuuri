Answer:

.data
input: .word 1996, 1997, 1998, 1900, 1800, 2000	# input years
output; .word   0,    0,    0,    0,    0,    0

.text
runner;
	li t0, 6
	la t1, input
	la t3, output
	
run_test:
	lw a2, 0(t1)	#read input from memory
	jal is_leap_year	# call subroutine under test
	sw a0, 0(t3)
	addi t1, t1, 4
	addi t0, t0, -1
	bgt t0, zero, run_test
	
exit:
	addi a0, x0, 10
	add a1, x0, x0
	ecall
	
is_leap_year:
	addi t6, zero, 4
	rem a0, a2, t6
	sltiu a0, a0, 1
	
	addi t6, zero, 100
	rem t4, a2, t6
	slt t4, zero, t4
	
	addi t6, zero, 400
	rem t5, a2, t6
	sltiu t5, t5, 1
	
	and a0, a0, t4
	or a0, a0, t5
	jr ra # ei toimi