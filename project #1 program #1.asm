.data
P : .word 8 #save 8 to P
R : .word -1 #save -1 to R

.text
#s2 for loop
li $s2,1 #load 1 to s2
lw $s1,P #get value of P
li $s7,6 #get value of s7


#STEP 1 get 6^P
#s6 store final result
li $s6,1
loop :
mul $s6,$s7,2 #loop for the value of s2
addi $s2,$s2,1
bne $s2,$s1,loop

#STEP 2 get 6^P mod 17
li $t0,17
loop2 :
sub $s6,$s6,$t0
beq $s6,$t0,loop2

#print the result
li $v0,1
add  $a0,$s6, $0
syscall  #if the user wants to uses specific input

#save result to R
sw $s6,R

output:


