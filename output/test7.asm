.data
newline: .asciiz "\n"
msg_index_out_of_bound_exception: .asciiz "Index out of bound exception\n"
msg_null_pointer_exception: .asciiz "Null pointer exception\n"

.text

move $fp, $sp
addiu $sp, $sp, -4
addiu $sp, $sp, 0

li $a0, 0xFFFFFFFF
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
li $a0, 0xFFFFFFFF
lw $t1, 4($sp)	  # $t1 = stack top
and $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

beq $a0, $0, else_0

li $a0, 1
jal _print_int        # system call code for print_int 


b end_if_1

else_0:
li $a0, 0
jal _print_int        # system call code for print_int 


end_if_1:

li $a0, 0
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
li $a0, 0xFFFFFFFF
lw $t1, 4($sp)	  # $t1 = stack top
and $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

beq $a0, $0, else_2

li $a0, 1
jal _print_int        # system call code for print_int 


b end_if_3

else_2:
li $a0, 0
jal _print_int        # system call code for print_int 


end_if_3:

li $a0, 0
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
li $a0, 0
lw $t1, 4($sp)	  # $t1 = stack top
and $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

beq $a0, $0, else_4

li $a0, 1
jal _print_int        # system call code for print_int 


b end_if_5

else_4:
li $a0, 0
jal _print_int        # system call code for print_int 


end_if_5:

li $a0, 0xFFFFFFFF
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
li $a0, 0
lw $t1, 4($sp)	  # $t1 = stack top
and $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

beq $a0, $0, else_6

li $a0, 1
jal _print_int        # system call code for print_int 


b end_if_7

else_6:
li $a0, 0
jal _print_int        # system call code for print_int 


end_if_7:

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

