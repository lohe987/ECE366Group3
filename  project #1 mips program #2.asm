.data
T: .word 10 # my choice of T
best_matching_score: .word -1 # how many best score are ? within [0, 32]
best_matching_count: .word -1 # how many patterns may achieve the best score 
Pattern_Array: .word 0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, -2, -3, -10, -8, 1, 3, 5, 7, 9
.text
# Your code goes here
addi $t0, $zero, 0x2000
addi $t1, $zero, 21

begin:
lw $s0, 0($t0) # to load each number into the array to $s0
slt $s1, $s0, $zero # to compare if numbers <0
bne $s1, $0, convert

_convert:
sw $s0, 0($t0) # to store back the number into the array
addi $t0, $t0, 4 # to increment address by 4
  
  subi $t1, $t1, 1 # to decrement counter
  beq $t1, $zero, exit # to check if we are finish, if yes go to exit
  j begin
  
  convert:
      sub $s0, $zero, $s0
      j _convert
  
  exit: j exit


