.data
P: .word 11
R: .word -1 #R will be stored here

.text
addi $15,$15,0x2000
lw $8,0($15)	#P <- M[0x2000]
addi $10,$0,0	#counter = 0
addi $12,$0,6	#b = 6

beq $8,$0,zero	#if P = 0  branch
addi $10,$0,1	#counter = 1
beq $10,$8,one	#if P = 1 branch 

loop:	
	addi $11,$0,0		#a = 0
	addu $11,$11,$12	#a = a+b
	addu $11,$11,$12	#a = a+b
	addu $11,$11,$12	#a = a+b
	addu $11,$11,$12	#a = a+b
	addu $11,$11,$12	#a = a+b
	addu $11,$11,$12	#a = a+b
	addi $10,$10,1		#counter++
	addu $12,$11,$0		#b= a
	beq $10,$8,next		#when counter = p go to next  	
	j loop
zero:
	addi $11,$0,1	#a = 1
	sw $11,4($15)	#a -> M[0x2004]
	j out
one: 
	addi $11,$0,6	#a = 6	
	sw $11,4($15)	#a -> M[0x2004]
	j out
next:
	addi $13,$0,17		#c = 17
	sub $11,$11,$13		#a = a-c
	slt $14,$11,$13		#if a < c set a= 1 else a = 0
	beq $14,$0,next
	sw $11,4($15)		#a -> M[0x2004]
	j out
out: 
	j out
