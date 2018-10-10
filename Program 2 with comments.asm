.data
T: .word 11  
best_matching_score: .word -1 # best score = ? within [0, 32]
best_matching_count: .word -1 # how many patterns achieve the best score?
Pattern_Array: .word  1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20
.text
	addi $t0, $0, 0		#counter to stop at 20	
	addi $t1, $0, 0x200c	#memory counter
	lw $t2, 0x2000($0)	#load the given T value
	
begin:	
	beq $t0, 20, exit	#while($t0!=20)
	addi $t3, $0, 32	#set $t3=32 to the max possible points
	lw $t4, ($t1)		#load the first pattern word
	addi $t1, $t1, 4	#+4 memory
	addi $t0, $t0, 1	#$t0++
	xor $t5, $t2, $t4	#xor to check what is different
	
count: 
	beq $t5, $zero, check	#add up all the ones
	andi $t6, $t5, 1	#i & 0x1
	sub $t3, $t3, $t6	#best_matching_score:if 1 is found
	srl $t5, $t5, 1		#Xor >> 1
	j count			

check:	
	lw $s0, 0x2004($zero)	#load best_matching_score
	slt $s1, $s0, $t3	#check if best_matching_score < new matching score
	bne $s1, $zero, count2	#if there is better match; set count to 1 and score
	sub $s1, $s0, $t3	#this is to check if they are the same
	beq $s1, $zero, store	#if they are the same values then count++
	j begin
	
count2:	
	lw $s3, 0x2008($zero)	#store best_matching_score	
	addi $s3, $s3, 1 	#make a new variable to 1 to send to count when new match is found
	sw $s3, 0x2008($zero)	#store best_matching_count
	j begin
	
store:	
	sw $t3, 0x2004($zero)	#load best_matching_count
  	addi $s2, $zero, 1	#count++	
	sw $s4, 0x2008($1)      #put count++ back to memory	
	j begin
	
exit:
