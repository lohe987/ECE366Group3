.data
T: .word 7
best_matching_score: .word -1	# best score = ? within [0,32]

best_matching_count: .word -1 	# how many patterns achieve the best score?

Pattern_Array: .word 0,1,2,3,4,5,6,7,8,9,10,11,13,14,15,16,17,18,19,20

.text
addi $8,$0,0x2000	#$8 = 0x2000 were T starts
addi $9,$0,0x200C	#$9 = 0x200C were Pattern_Array starts
addi $10,$0,0		#counter1 = 0 for best matching count
addi $11,$0,20		#counter2 = 20 to indicate 
lw $12,0($8)		#T <- M[0x2000]

loop:
	lw $13,0($9)		#Pattern_Array <- M[0x200C]
	beq $12,$13,increment 	#if T == Pattern_Array[i] go to increment branch
	addi $9,$9,4		#increments address by PC + 4 (2004,2008,200c,etc.)
	subi $11,$11,1		#counter2--
	beq $11,$0,result	#if counter2 == 0 stores the best_match_count
	j loop
	
increment:
	addi $10,$10,1	#counter1++
	addi $9,$9,4	#increments address by PC + 4 (2004,2008,200c,etc.)
	subi $11,$11,1	#counter2--
	j loop

result:
	sw $10,8($8)	#counter1 ->M[0x2008]
	j exit

exit:
	j exit
