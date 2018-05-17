.data
newline: .asciiz "\n"
msg_index_out_of_bound_exception: .asciiz "Index out of bound exception\n"
msg_null_pointer_exception: .asciiz "Null pointer exception\n"

.text

move $fp, $sp
addiu $sp, $sp, -16

li $a0, 1
sw $a0, 16($fp)
li $a0, 4
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
li $a0, 8
lw $t1, 4($sp)	  # $t1 = stack top
sub $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

sw $a0, 8($fp)
lw $a0, 16($fp)
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
li $a0, 2
lw $t1, 4($sp)	  # $t1 = stack top
add $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

sw $a0, 12($fp)
lw $a0, 8($fp)
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
li $a0, 1
lw $t1, 4($sp)	  # $t1 = stack top
add $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
lw $a0, 8($fp)
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
li $a0, 1
lw $t1, 4($sp)	  # $t1 = stack top
add $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

lw $t1, 4($sp)	  # $t1 = stack top
mult $t1, $a0	  # $a0 = $a0 + stack top
mflo $a0 	  # Moves the value from the LO part of the result register into $a0.
addiu $sp, $sp, 4	  # pop

sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
lw $a0, 8($fp)
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
li $a0, 1
lw $t1, 4($sp)	  # $t1 = stack top
add $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

lw $t1, 4($sp)	  # $t1 = stack top
mult $t1, $a0	  # $a0 = $a0 + stack top
mflo $a0 	  # Moves the value from the LO part of the result register into $a0.
addiu $sp, $sp, 4	  # pop

sw $a0, 16($fp)
lw $a0, 16($fp)
jal _print_int        # system call code for print_int 

lw $a0, 12($fp)
jal _print_int        # system call code for print_int 

lw $a0, 8($fp)
jal _print_int        # system call code for print_int 

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

