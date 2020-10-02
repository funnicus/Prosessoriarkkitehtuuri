.text 
	 add x0, zero, zero 	# nollaa rekisteri
	 add t0, a0, zero	#
	 addi t1, zero, 8	# add immidiate t1 = zero + 8 !!Silmukalla on kahdeksan kierrosta eli i = 8!!
loop:   
	 lw t2, 0(t0)   	# load word from location t0 into t2
	 sub x0, x0, t2   	# substract x0 = x0 - t2, x0:llaan ei saa laittaa mit‰‰n joten t‰m‰ k‰sky on virheellinen
	 addi t0, t0, 4   	# add immidiate t0 = t0 + 4, 34 bittisess‰ pit‰‰ menn‰ 4 eteenp‰in
	 addi t1, t1, -1   	# add immidiate t1 = t1 -1 !!Sama kuin vaikkapa while loopin i--!!s
	 bne t1, zero, loop  	# t1 == 0 ? loop : break, eli branch if not equal to loop
exit:  
	 addi a0, x0, 10  	# add a0 = 0 + 10
	 add a1, x0, x0  	# add a1 = 0 + 0