.data
T: .word 11  
best_matching_score: .word -1 # best score = ? within [0, 32]
best_matching_count: .word -1 # how many patterns achieve the best score?
Pattern_Array: .word  1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20
.text
	addi $t0, $0, 0		
	addi $t1, $0, 0x200c	
	lw $t2, 0x2000($0)	
	
begin:	
	beq $t0, 20, exit	
	addi $t3, $0, 32	
	lw $t4, ($t1)		
	addi $t1, $t1, 4	
	addi $t0, $t0, 1	
	xor $t5, $t2, $t4	
	
count: 
	beq $t5, $zero, check	
	andi $t6, $t5, 1	
	sub $t3, $t3, $t6	
	srl $t5, $t5, 1		
	j count			

check:	
	lw $s0, 0x2004($zero)	
	slt $s1, $s0, $t3	
	bne $s1, $zero, store
	sub $s1, $s0, $t3	
	beq $s1, $zero, count2	
	j begin
	
count2:	
	lw $s3, 0x2008($zero)	
	addi $s3, $s3, 1 	
	sw $s3, 0x2008($zero)	
	j begin
	
store:	
	sw $t3, 0x2004($zero)	
  	addi $s2, $zero, 1		
	sw $s4, 0x2008($1)      	
	j begin
	
exit:
