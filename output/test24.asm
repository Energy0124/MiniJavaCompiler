.data
newline: .asciiz "\n"
msg_index_out_of_bound_exception: .asciiz "Index out of bound exception\n"
msg_null_pointer_exception: .asciiz "Null pointer exception\n"

.text

move $fp, $sp
addiu $sp, $sp, -4
addiu $sp, $sp, -8

li $a0, 3

sll $a0, $a0, 2   # multiple by 4 bytes
li $v0, 9         # allocate space
syscall
li $t1, 0
sw $t1, 0($v0)
li $t1, 3
sw $t1, 4($v0)
move $a0, $v0
sw $a0, -4($fp)     #save f
li $a0, 5
sw $a0, -8($fp)     #save b
sw $fp, 0($sp)		# push $fp
addiu $sp, $sp, -4
lw $a0, -4($fp)     #load f
beq $a0, $0, _null_pointer_exception
sw $a0, 0 ($sp)		#push caller param
addiu $sp, $sp, -4
sw $fp, 0($sp)		# push $fp
addiu $sp, $sp, -4
lw $a0, -4($fp)     #load f
beq $a0, $0, _null_pointer_exception
sw $a0, 0 ($sp)		#push caller param
addiu $sp, $sp, -4
li $a0, 100
sw $a0, 0 ($sp)		#push param
addiu $sp, $sp, -4
jal Foo4__m2
sw $a0, 0 ($sp)		#push param
addiu $sp, $sp, -4
sw $fp, 0($sp)		# push $fp
addiu $sp, $sp, -4
lw $a0, -4($fp)     #load f
beq $a0, $0, _null_pointer_exception
sw $a0, 0 ($sp)		#push caller param
addiu $sp, $sp, -4
li $a0, 1
sw $a0, 0 ($sp)		#push param
addiu $sp, $sp, -4
jal Foo4__m2
sw $a0, 0 ($sp)		#push param
addiu $sp, $sp, -4
jal Foo4__m1
sw $a0, -8($fp)     #save b
lw $a0, -8($fp)     #load b
jal _print_int        # system call code for print_int 

# exit
li $v0, 10
syscall

Foo4__m1:
move $fp, $sp
sw $ra, 0($sp) # push $ra
addiu $sp, $sp, -4
addiu $sp, $sp, 0
lw $a0, 4($fp)        #load a
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
lw $a0, 8($fp)        #load b
lw $t1, 4($sp)	  # $t1 = stack top
add $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

addiu $sp, $sp, 0
lw $ra, 4($sp) # restore $ra
addiu $sp, $sp, 20
lw $fp, 0($sp)# restore $fp
jr $ra

Foo4__m2:
move $fp, $sp
sw $ra, 0($sp) # push $ra
addiu $sp, $sp, -4
addiu $sp, $sp, -4
lw $a0, 4($fp)        #load x
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
lw $a0, 4($fp)        #load x
lw $t1, 4($sp)	  # $t1 = stack top
add $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

sw $a0, -4($fp)     #save y
lw $a0, -4($fp)     #load y
addiu $sp, $sp, 4
lw $ra, 4($sp) # restore $ra
addiu $sp, $sp, 16
lw $fp, 0($sp)# restore $fp
jr $ra

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

