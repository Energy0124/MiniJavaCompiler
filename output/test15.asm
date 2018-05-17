.data
newline: .asciiz "\n"
msg_index_out_of_bound_exception: .asciiz "Index out of bound exception\n"
msg_null_pointer_exception: .asciiz "Null pointer exception\n"

.text

move $fp, $sp
addiu $sp, $sp, -68

li $a0, 1
sw $a0, 8($fp)
li $a0, 2
sw $a0, 12($fp)
li $a0, 3
sw $a0, 16($fp)
li $a0, 4
sw $a0, 20($fp)
li $a0, 5
sw $a0, 24($fp)
li $a0, 6
sw $a0, 28($fp)
li $a0, 7
sw $a0, 32($fp)
li $a0, 8
sw $a0, 36($fp)
li $a0, 9
sw $a0, 40($fp)
li $a0, 10
sw $a0, 44($fp)
li $a0, 11
sw $a0, 48($fp)
li $a0, 12
sw $a0, 52($fp)
li $a0, 13
sw $a0, 56($fp)
li $a0, 14
sw $a0, 60($fp)
li $a0, 15
sw $a0, 64($fp)
li $a0, 16
sw $a0, 68($fp)
lw $a0, 8($fp)
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
lw $a0, 8($fp)
lw $t1, 4($sp)	  # $t1 = stack top
add $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

sw $a0, 8($fp)
lw $a0, 12($fp)
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
lw $a0, 8($fp)
lw $t1, 4($sp)	  # $t1 = stack top
add $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

sw $a0, 12($fp)
lw $a0, 16($fp)
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
lw $a0, 8($fp)
lw $t1, 4($sp)	  # $t1 = stack top
add $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

sw $a0, 16($fp)
lw $a0, 20($fp)
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
lw $a0, 8($fp)
lw $t1, 4($sp)	  # $t1 = stack top
add $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

sw $a0, 20($fp)
lw $a0, 24($fp)
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
lw $a0, 8($fp)
lw $t1, 4($sp)	  # $t1 = stack top
add $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

sw $a0, 24($fp)
lw $a0, 28($fp)
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
lw $a0, 8($fp)
lw $t1, 4($sp)	  # $t1 = stack top
add $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

sw $a0, 28($fp)
lw $a0, 32($fp)
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
lw $a0, 8($fp)
lw $t1, 4($sp)	  # $t1 = stack top
add $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

sw $a0, 32($fp)
lw $a0, 36($fp)
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
lw $a0, 8($fp)
lw $t1, 4($sp)	  # $t1 = stack top
add $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

sw $a0, 36($fp)
lw $a0, 40($fp)
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
lw $a0, 8($fp)
lw $t1, 4($sp)	  # $t1 = stack top
add $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

sw $a0, 40($fp)
lw $a0, 44($fp)
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
lw $a0, 8($fp)
lw $t1, 4($sp)	  # $t1 = stack top
add $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
lw $a0, 12($fp)
lw $t1, 4($sp)	  # $t1 = stack top
add $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
lw $a0, 16($fp)
lw $t1, 4($sp)	  # $t1 = stack top
add $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
lw $a0, 20($fp)
lw $t1, 4($sp)	  # $t1 = stack top
add $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

sw $a0, 44($fp)
lw $a0, 48($fp)
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
lw $a0, 8($fp)
lw $t1, 4($sp)	  # $t1 = stack top
sub $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
lw $a0, 12($fp)
lw $t1, 4($sp)	  # $t1 = stack top
sub $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
lw $a0, 16($fp)
lw $t1, 4($sp)	  # $t1 = stack top
sub $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
lw $a0, 20($fp)
lw $t1, 4($sp)	  # $t1 = stack top
sub $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

sw $a0, 48($fp)
lw $a0, 52($fp)
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
lw $a0, 52($fp)
lw $t1, 4($sp)	  # $t1 = stack top
add $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

sw $a0, 52($fp)
lw $a0, 56($fp)
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
li $a0, 1
lw $t1, 4($sp)	  # $t1 = stack top
add $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
lw $a0, 56($fp)
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
li $a0, 1
lw $t1, 4($sp)	  # $t1 = stack top
add $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
li $a0, 2
lw $t1, 4($sp)	  # $t1 = stack top
mult $t1, $a0	  # $a0 = $a0 + stack top
mflo $a0 	  # Moves the value from the LO part of the result register into $a0.
addiu $sp, $sp, 4	  # pop

lw $t1, 4($sp)	  # $t1 = stack top
sub $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

sw $a0, 56($fp)
lw $a0, 60($fp)
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
li $a0, 1
lw $t1, 4($sp)	  # $t1 = stack top
add $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
lw $a0, 60($fp)
lw $t1, 4($sp)	  # $t1 = stack top
sub $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
lw $a0, 64($fp)
lw $t1, 4($sp)	  # $t1 = stack top
sub $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

sw $a0, 60($fp)
lw $a0, 64($fp)
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
li $a0, 2
lw $t1, 4($sp)	  # $t1 = stack top
mult $t1, $a0	  # $a0 = $a0 + stack top
mflo $a0 	  # Moves the value from the LO part of the result register into $a0.
addiu $sp, $sp, 4	  # pop

sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
li $a0, 0
lw $t1, 4($sp)	  # $t1 = stack top
mult $t1, $a0	  # $a0 = $a0 + stack top
mflo $a0 	  # Moves the value from the LO part of the result register into $a0.
addiu $sp, $sp, 4	  # pop

sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
lw $a0, 64($fp)
lw $t1, 4($sp)	  # $t1 = stack top
mult $t1, $a0	  # $a0 = $a0 + stack top
mflo $a0 	  # Moves the value from the LO part of the result register into $a0.
addiu $sp, $sp, 4	  # pop

sw $a0, 64($fp)
lw $a0, 68($fp)
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
li $a0, 0
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
li $a0, 1
lw $t1, 4($sp)	  # $t1 = stack top
sub $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

lw $t1, 4($sp)	  # $t1 = stack top
add $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

sw $a0, 68($fp)
lw $a0, 8($fp)
jal _print_int        # system call code for print_int 

lw $a0, 12($fp)
jal _print_int        # system call code for print_int 

lw $a0, 16($fp)
jal _print_int        # system call code for print_int 

lw $a0, 20($fp)
jal _print_int        # system call code for print_int 

lw $a0, 24($fp)
jal _print_int        # system call code for print_int 

lw $a0, 28($fp)
jal _print_int        # system call code for print_int 

lw $a0, 32($fp)
jal _print_int        # system call code for print_int 

lw $a0, 36($fp)
jal _print_int        # system call code for print_int 

lw $a0, 40($fp)
jal _print_int        # system call code for print_int 

lw $a0, 44($fp)
jal _print_int        # system call code for print_int 

lw $a0, 48($fp)
jal _print_int        # system call code for print_int 

lw $a0, 52($fp)
jal _print_int        # system call code for print_int 

lw $a0, 56($fp)
jal _print_int        # system call code for print_int 

lw $a0, 60($fp)
jal _print_int        # system call code for print_int 

lw $a0, 64($fp)
jal _print_int        # system call code for print_int 

lw $a0, 68($fp)
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

