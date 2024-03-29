.data
newline: .asciiz "\n"
msg_index_out_of_bound_exception: .asciiz "Index out of bound exception\n"
msg_null_pointer_exception: .asciiz "Null pointer exception\n"

.text

move $fp, $sp
addiu $sp, $sp, -4
addiu $sp, $sp, -64

li $a0, 1
sw $a0, -4($fp)     #save x1
li $a0, 2
sw $a0, -8($fp)     #save x2
li $a0, 3
sw $a0, -12($fp)     #save x3
li $a0, 4
sw $a0, -16($fp)     #save x4
li $a0, 5
sw $a0, -20($fp)     #save x5
li $a0, 6
sw $a0, -24($fp)     #save x6
li $a0, 7
sw $a0, -28($fp)     #save x7
li $a0, 8
sw $a0, -32($fp)     #save x8
li $a0, 9
sw $a0, -36($fp)     #save x9
li $a0, 10
sw $a0, -40($fp)     #save x10
li $a0, 11
sw $a0, -44($fp)     #save x11
li $a0, 12
sw $a0, -48($fp)     #save x12
li $a0, 13
sw $a0, -52($fp)     #save x13
li $a0, 14
sw $a0, -56($fp)     #save x14
li $a0, 15
sw $a0, -60($fp)     #save x15
li $a0, 16
sw $a0, -64($fp)     #save x16
lw $a0, -4($fp)     #load x1
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
lw $a0, -4($fp)     #load x1
lw $t1, 4($sp)	  # $t1 = stack top
add $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

sw $a0, -4($fp)     #save x1
lw $a0, -8($fp)     #load x2
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
lw $a0, -4($fp)     #load x1
lw $t1, 4($sp)	  # $t1 = stack top
add $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

sw $a0, -8($fp)     #save x2
lw $a0, -12($fp)     #load x3
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
lw $a0, -4($fp)     #load x1
lw $t1, 4($sp)	  # $t1 = stack top
add $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

sw $a0, -12($fp)     #save x3
lw $a0, -16($fp)     #load x4
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
lw $a0, -4($fp)     #load x1
lw $t1, 4($sp)	  # $t1 = stack top
add $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

sw $a0, -16($fp)     #save x4
lw $a0, -20($fp)     #load x5
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
lw $a0, -4($fp)     #load x1
lw $t1, 4($sp)	  # $t1 = stack top
add $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

sw $a0, -20($fp)     #save x5
lw $a0, -24($fp)     #load x6
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
lw $a0, -4($fp)     #load x1
lw $t1, 4($sp)	  # $t1 = stack top
add $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

sw $a0, -24($fp)     #save x6
lw $a0, -28($fp)     #load x7
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
lw $a0, -4($fp)     #load x1
lw $t1, 4($sp)	  # $t1 = stack top
add $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

sw $a0, -28($fp)     #save x7
lw $a0, -32($fp)     #load x8
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
lw $a0, -4($fp)     #load x1
lw $t1, 4($sp)	  # $t1 = stack top
add $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

sw $a0, -32($fp)     #save x8
lw $a0, -36($fp)     #load x9
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
lw $a0, -4($fp)     #load x1
lw $t1, 4($sp)	  # $t1 = stack top
add $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

sw $a0, -36($fp)     #save x9
lw $a0, -40($fp)     #load x10
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
lw $a0, -4($fp)     #load x1
lw $t1, 4($sp)	  # $t1 = stack top
add $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
lw $a0, -8($fp)     #load x2
lw $t1, 4($sp)	  # $t1 = stack top
add $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
lw $a0, -12($fp)     #load x3
lw $t1, 4($sp)	  # $t1 = stack top
add $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
lw $a0, -16($fp)     #load x4
lw $t1, 4($sp)	  # $t1 = stack top
add $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

sw $a0, -40($fp)     #save x10
lw $a0, -44($fp)     #load x11
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
lw $a0, -4($fp)     #load x1
lw $t1, 4($sp)	  # $t1 = stack top
sub $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
lw $a0, -8($fp)     #load x2
lw $t1, 4($sp)	  # $t1 = stack top
sub $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
lw $a0, -12($fp)     #load x3
lw $t1, 4($sp)	  # $t1 = stack top
sub $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
lw $a0, -16($fp)     #load x4
lw $t1, 4($sp)	  # $t1 = stack top
sub $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

sw $a0, -44($fp)     #save x11
lw $a0, -48($fp)     #load x12
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
lw $a0, -48($fp)     #load x12
lw $t1, 4($sp)	  # $t1 = stack top
add $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

sw $a0, -48($fp)     #save x12
lw $a0, -52($fp)     #load x13
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
li $a0, 1
lw $t1, 4($sp)	  # $t1 = stack top
add $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
lw $a0, -52($fp)     #load x13
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

sw $a0, -52($fp)     #save x13
lw $a0, -56($fp)     #load x14
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
li $a0, 1
lw $t1, 4($sp)	  # $t1 = stack top
add $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
lw $a0, -56($fp)     #load x14
lw $t1, 4($sp)	  # $t1 = stack top
sub $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
lw $a0, -60($fp)     #load x15
lw $t1, 4($sp)	  # $t1 = stack top
sub $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

sw $a0, -56($fp)     #save x14
lw $a0, -60($fp)     #load x15
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
lw $a0, -60($fp)     #load x15
lw $t1, 4($sp)	  # $t1 = stack top
mult $t1, $a0	  # $a0 = $a0 + stack top
mflo $a0 	  # Moves the value from the LO part of the result register into $a0.
addiu $sp, $sp, 4	  # pop

sw $a0, -60($fp)     #save x15
lw $a0, -64($fp)     #load x16
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

sw $a0, -64($fp)     #save x16
lw $a0, -4($fp)     #load x1
jal _print_int        # system call code for print_int 

lw $a0, -8($fp)     #load x2
jal _print_int        # system call code for print_int 

lw $a0, -12($fp)     #load x3
jal _print_int        # system call code for print_int 

lw $a0, -16($fp)     #load x4
jal _print_int        # system call code for print_int 

lw $a0, -20($fp)     #load x5
jal _print_int        # system call code for print_int 

lw $a0, -24($fp)     #load x6
jal _print_int        # system call code for print_int 

lw $a0, -28($fp)     #load x7
jal _print_int        # system call code for print_int 

lw $a0, -32($fp)     #load x8
jal _print_int        # system call code for print_int 

lw $a0, -36($fp)     #load x9
jal _print_int        # system call code for print_int 

lw $a0, -40($fp)     #load x10
jal _print_int        # system call code for print_int 

lw $a0, -44($fp)     #load x11
jal _print_int        # system call code for print_int 

lw $a0, -48($fp)     #load x12
jal _print_int        # system call code for print_int 

lw $a0, -52($fp)     #load x13
jal _print_int        # system call code for print_int 

lw $a0, -56($fp)     #load x14
jal _print_int        # system call code for print_int 

lw $a0, -60($fp)     #load x15
jal _print_int        # system call code for print_int 

lw $a0, -64($fp)     #load x16
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

