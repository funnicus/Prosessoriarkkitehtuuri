.data
  A: .word 5  
  B: .word 4  
  C: .word 0
.text
  .globl main
main:
  la t0, A  		# load address
  lw t0, 0(t0) 		# Read the value of “A” from memory
  la t1, B 		#
  lw t1, 0(t1) 		# Read the value of B from memory to keep track of the value B
  li t3, 1 		# i = 0 (to keep track of the value “B”), load immidiate 6-bit
  li t4, 0 		# C = 0 (initialize the result to 0)
loop:
  beq t3, t1, done 	# while (i is not equal to b) continue adding A to C.
  add t4, t4, t0 	# C= C + A;
  addi t3 t3, 1 	# i = i + 1
  j loop		#
done:
  la t3, C  		#
  sw t4, 0(t3)		#