.data
newline: .asciiz "\n"
msg_index_out_of_bound_exception: .asciiz "Index out of bound exception\n"
msg_null_pointer_exception: .asciiz "Null pointer exception\n"

.text

move $fp, $sp
addiu $sp, $sp, -12

li $a0, 10
jal _alloc_int_array
move $a0, $v0
sw $a0, 8($fp)
li $a0, 10
sw $a0, 12($fp)
while_start_0:
li $a0, 0
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
lw $a0, 12($fp)
lw $t1, 4($sp)	  # $t1 = stack top
slt $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

beq $a0, $0, while_end_1

lw $a0, 12($fp)
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
li $a0, 1
lw $t1, 4($sp)	  # $t1 = stack top
sub $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

sw $a0, 12($fp)
#start ArrayAssign
#start ArrayAssign e1
lw $a0, 12($fp)
sll $a0, $a0, 2
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
#end ArrayAssign e1
#start ArrayAssign i
lw $a0, 8($fp)
beq $a0, $0, _null_pointer_exception
lw $t2, 0($a0)
sll $t2, $t2, 2
addiu $a0, $a0, 4
lw $t1, 4($sp)	  # $t1 = stack top

bge $t1, $t2, _array_index_out_of_bound_exception
add $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
#end ArrayAssign i
#start ArrayAssign e2
lw $a0, 12($fp)
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
li $a0, 1
lw $t1, 4($sp)	  # $t1 = stack top
add $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

lw $t1, 4($sp)	  # $t1 = stack top
addiu $sp, $sp, 4	  # pop
sw $a0, 0($t1)
#end ArrayAssign e2
#end ArrayAssign

b while_start_0

while_end_1:

#start ArrayAssign
#start ArrayAssign e1
li $a0, 9
sll $a0, $a0, 2
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
#end ArrayAssign e1
#start ArrayAssign i
lw $a0, 8($fp)
beq $a0, $0, _null_pointer_exception
lw $t2, 0($a0)
sll $t2, $t2, 2
addiu $a0, $a0, 4
lw $t1, 4($sp)	  # $t1 = stack top

bge $t1, $t2, _array_index_out_of_bound_exception
add $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
#end ArrayAssign i
#start ArrayAssign e2
li $a0, 0
sll $a0, $a0, 2
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
lw $a0, 8($fp)
beq $a0, $0, _null_pointer_exception
lw $t2, 0($a0)
sll $t2, $t2, 2
addiu $a0, $a0, 4
lw $t1, 4($sp)	  # $t1 = stack top

bge $t1, $t2, _array_index_out_of_bound_exception
add $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop
lw $a0, 0($a0)
sll $a0, $a0, 2
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
lw $a0, 8($fp)
beq $a0, $0, _null_pointer_exception
lw $t2, 0($a0)
sll $t2, $t2, 2
addiu $a0, $a0, 4
lw $t1, 4($sp)	  # $t1 = stack top

bge $t1, $t2, _array_index_out_of_bound_exception
add $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop
lw $a0, 0($a0)
sll $a0, $a0, 2
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
lw $a0, 8($fp)
beq $a0, $0, _null_pointer_exception
lw $t2, 0($a0)
sll $t2, $t2, 2
addiu $a0, $a0, 4
lw $t1, 4($sp)	  # $t1 = stack top

bge $t1, $t2, _array_index_out_of_bound_exception
add $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop
lw $a0, 0($a0)
lw $t1, 4($sp)	  # $t1 = stack top
addiu $sp, $sp, 4	  # pop
sw $a0, 0($t1)
#end ArrayAssign e2
#end ArrayAssign
#start ArrayAssign
#start ArrayAssign e1
li $a0, 8
sll $a0, $a0, 2
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
#end ArrayAssign e1
#start ArrayAssign i
lw $a0, 8($fp)
beq $a0, $0, _null_pointer_exception
lw $t2, 0($a0)
sll $t2, $t2, 2
addiu $a0, $a0, 4
lw $t1, 4($sp)	  # $t1 = stack top

bge $t1, $t2, _array_index_out_of_bound_exception
add $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
#end ArrayAssign i
#start ArrayAssign e2
li $a0, 2
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
li $a0, 2
lw $t1, 4($sp)	  # $t1 = stack top
mult $t1, $a0	  # $a0 = $a0 + stack top
mflo $a0 	  # Moves the value from the LO part of the result register into $a0.
addiu $sp, $sp, 4	  # pop

sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
li $a0, 2
lw $t1, 4($sp)	  # $t1 = stack top
mult $t1, $a0	  # $a0 = $a0 + stack top
mflo $a0 	  # Moves the value from the LO part of the result register into $a0.
addiu $sp, $sp, 4	  # pop

sll $a0, $a0, 2
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
lw $a0, 8($fp)
beq $a0, $0, _null_pointer_exception
lw $t2, 0($a0)
sll $t2, $t2, 2
addiu $a0, $a0, 4
lw $t1, 4($sp)	  # $t1 = stack top

bge $t1, $t2, _array_index_out_of_bound_exception
add $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop
lw $a0, 0($a0)
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
li $a0, 0
sll $a0, $a0, 2
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
lw $a0, 8($fp)
beq $a0, $0, _null_pointer_exception
lw $t2, 0($a0)
sll $t2, $t2, 2
addiu $a0, $a0, 4
lw $t1, 4($sp)	  # $t1 = stack top

bge $t1, $t2, _array_index_out_of_bound_exception
add $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop
lw $a0, 0($a0)
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
li $a0, 30
lw $t1, 4($sp)	  # $t1 = stack top
mult $t1, $a0	  # $a0 = $a0 + stack top
mflo $a0 	  # Moves the value from the LO part of the result register into $a0.
addiu $sp, $sp, 4	  # pop

lw $t1, 4($sp)	  # $t1 = stack top
add $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

lw $t1, 4($sp)	  # $t1 = stack top
addiu $sp, $sp, 4	  # pop
sw $a0, 0($t1)
#end ArrayAssign e2
#end ArrayAssign
li $a0, 0
sw $a0, 12($fp)
while_start_2:
lw $a0, 12($fp)
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
lw $a0, 8($fp)
beq $a0, $0, _null_pointer_exception
lw $a0, 0($a0)
lw $t1, 4($sp)	  # $t1 = stack top
slt $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

beq $a0, $0, while_end_3

lw $a0, 12($fp)
sll $a0, $a0, 2
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
lw $a0, 8($fp)
beq $a0, $0, _null_pointer_exception
lw $t2, 0($a0)
sll $t2, $t2, 2
addiu $a0, $a0, 4
lw $t1, 4($sp)	  # $t1 = stack top

bge $t1, $t2, _array_index_out_of_bound_exception
add $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop
lw $a0, 0($a0)
jal _print_int        # system call code for print_int 

lw $a0, 12($fp)
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
li $a0, 1
lw $t1, 4($sp)	  # $t1 = stack top
add $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

sw $a0, 12($fp)

b while_start_2

while_end_3:

# exit
li $v0, 10
syscall

_print_int: # System.out.println(int)
li $v0, 1
syscall
la $a0, newline
li $a1, 1
li $v0, 4   # print newline
syscall
jr $ra

_null_pointer_exception:
la $a0, msg_null_pointer_exception
li $a1, 23
li $v0, 4
syscall
li $v0, 10
syscall

_array_index_out_of_bound_exception:
la $a0, msg_index_out_of_bound_exception
li $a1, 29
li $v0, 4
syscall
li $v0, 10
syscall

_alloc_int_array: # new int [$a0]
addi $a2, $a0, 0  # Save length in $a2
addi $a0, $a0, 1  # One more word to store the length
sll $a0, $a0, 2   # multiple by 4 bytes
li $v0, 9         # allocate space
syscall

sw $a2, 0($v0)    # Store array length
addi $t1, $v0, 4  # begin address = ($v0 + 4); address of the first element
add $t2, $v0, $a0 # loop until ($v0 + 4*(length+1)), the address after the last element

_alloc_int_array_loop:
beq $t1, $t2, _alloc_int_array_loop_end
sw $0, 0($t1)
addi $t1, $t1, 4
j _alloc_int_array_loop
_alloc_int_array_loop_end:

jr $ra

