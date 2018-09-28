.data
P: .word 201  # Mem [0x2000] 
R: .word -1 # Mem [0x2004]  # R will be stored here

.text
	addi $t1, $zero, 6  
	addi $t2, $zero, 17 
	lw $s1, 0x2000($0) 
	subi $s1, $s1, 1
	addi $t6, $zero, 170000000
	addi $t7, $zero, 1700000
	addi $t8, $zero, 17000
	
loop2:
	beq $s1, $zero, loop
	subi $s1, $s1, 1
	sll $t4, $t1, 1
	sll $t5, $t1, 2
	add $t1, $t4, $t5
	j loop2
loop: 
	slt $t3, $t1, $t2
	beq $t3, 1, done

	
	slt $s0, $t6, $t1    
	beq $s0, 1, loop3 
	subi $t1, $t1, 17
	j loop 
	
	slt $s0, $t7, $t1    
	beq $s0, 1, loop4 
	subi $t1, $t1, 17
	j loop 

	slt $s0, $t8, $t1    
	beq $s0, 1, loop5 
	subi $t1, $t1, 17
	j loop 

loop3:
	sub $t1, $t1, $t6
	j loop
	
loop4:
	sub $t1, $t1, $t7
	j loop
	
loop5:
	sub $t1, $t1, $t8
	j loop	
	
done:
	sw $t1, 0x2004($zero) # R is stored in Mem [0x2004]
	
exit:
	
