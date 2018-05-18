.data
newline: .asciiz "\n"
msg_index_out_of_bound_exception: .asciiz "Index out of bound exception\n"
msg_null_pointer_exception: .asciiz "Null pointer exception\n"

.text

move $fp, $sp
addiu $sp, $sp, -4
addiu $sp, $sp, -12

li $a0, 5

sll $a0, $a0, 2   # multiple by 4 bytes
li $v0, 9         # allocate space
syscall
li $t1, 1
sw $t1, 0($v0)
li $t1, 5
sw $t1, 4($v0)
move $a0, $v0
sw $a0, -4($fp)     #save foo
li $a0, 4

sll $a0, $a0, 2   # multiple by 4 bytes
li $v0, 9         # allocate space
syscall
li $t1, 0
sw $t1, 0($v0)
li $t1, 4
sw $t1, 4($v0)
move $a0, $v0
sw $a0, -8($fp)     #save bar
sw $fp, 0($sp)		# push $fp
addiu $sp, $sp, -4
lw $a0, -4($fp)     #load foo
beq $a0, $0, _null_pointer_exception
sw $a0, 0 ($sp)		#push caller param
addiu $sp, $sp, -4
li $a0, 2000
sw $a0, 0 ($sp)		#push param
addiu $sp, $sp, -4
li $a0, 1000
sw $a0, 0 ($sp)		#push param
addiu $sp, $sp, -4
jal Foo6__init
sw $a0, -12($fp)     #save dummy
sw $fp, 0($sp)		# push $fp
addiu $sp, $sp, -4
lw $a0, -4($fp)     #load foo
beq $a0, $0, _null_pointer_exception
sw $a0, 0 ($sp)		#push caller param
addiu $sp, $sp, -4
jal Foo6__f
sw $a0, -12($fp)     #save dummy
sw $fp, 0($sp)		# push $fp
addiu $sp, $sp, -4
lw $a0, -4($fp)     #load foo
beq $a0, $0, _null_pointer_exception
sw $a0, 0 ($sp)		#push caller param
addiu $sp, $sp, -4
jal Foo6__f
sw $a0, -12($fp)     #save dummy
sw $fp, 0($sp)		# push $fp
addiu $sp, $sp, -4
lw $a0, -4($fp)     #load foo
beq $a0, $0, _null_pointer_exception
sw $a0, 0 ($sp)		#push caller param
addiu $sp, $sp, -4
jal Foo6__g
sw $a0, -12($fp)     #save dummy
sw $fp, 0($sp)		# push $fp
addiu $sp, $sp, -4
lw $a0, -4($fp)     #load foo
beq $a0, $0, _null_pointer_exception
sw $a0, 0 ($sp)		#push caller param
addiu $sp, $sp, -4
jal Foo6__g
sw $a0, -12($fp)     #save dummy
sw $fp, 0($sp)		# push $fp
addiu $sp, $sp, -4
lw $a0, -8($fp)     #load bar
beq $a0, $0, _null_pointer_exception
sw $a0, 0 ($sp)		#push caller param
addiu $sp, $sp, -4
lw $a0, -4($fp)     #load foo
sw $a0, 0 ($sp)		#push param
addiu $sp, $sp, -4
jal Bar6__setFoo
sw $a0, -12($fp)     #save dummy
sw $fp, 0($sp)		# push $fp
addiu $sp, $sp, -4
lw $a0, -8($fp)     #load bar
beq $a0, $0, _null_pointer_exception
sw $a0, 0 ($sp)		#push caller param
addiu $sp, $sp, -4
jal Bar6__f
jal _print_int        # system call code for print_int 

sw $fp, 0($sp)		# push $fp
addiu $sp, $sp, -4
lw $a0, -8($fp)     #load bar
beq $a0, $0, _null_pointer_exception
sw $a0, 0 ($sp)		#push caller param
addiu $sp, $sp, -4
jal Bar6__g
jal _print_int        # system call code for print_int 

# exit
li $v0, 10
syscall

Foo6__init:
move $fp, $sp
sw $ra, 0($sp) # push $ra
addiu $sp, $sp, -4
addiu $sp, $sp, 0
lw $a0, 4($fp)        #load _x
lw $t1, 12($fp)    #load caller object
beq $t1, $0, _null_pointer_exception
sw $a0, 12($t1)        #load x
lw $a0, 8($fp)        #load _y
lw $t1, 12($fp)    #load caller object
beq $t1, $0, _null_pointer_exception
sw $a0, 16($t1)        #load y
li $a0, 0
addiu $sp, $sp, 0
lw $ra, 4($sp) # restore $ra
addiu $sp, $sp, 20
lw $fp, 0($sp)# restore $fp
jr $ra

Foo6__f:
move $fp, $sp
sw $ra, 0($sp) # push $ra
addiu $sp, $sp, -4
addiu $sp, $sp, 0
lw $a0, 4($fp)  #load caller object
beq $a0, $0, _null_pointer_exception
lw $a0, 12($a0)        #save x
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
li $a0, 1
lw $t1, 4($sp)	  # $t1 = stack top
add $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

lw $t1, 4($fp)    #load caller object
beq $t1, $0, _null_pointer_exception
sw $a0, 12($t1)        #load x
li $a0, 0
addiu $sp, $sp, 0
lw $ra, 4($sp) # restore $ra
addiu $sp, $sp, 12
lw $fp, 0($sp)# restore $fp
jr $ra

Foo6__g:
move $fp, $sp
sw $ra, 0($sp) # push $ra
addiu $sp, $sp, -4
addiu $sp, $sp, 0
lw $a0, 4($fp)  #load caller object
beq $a0, $0, _null_pointer_exception
lw $a0, 16($a0)        #save y
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
li $a0, 10
lw $t1, 4($sp)	  # $t1 = stack top
add $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

lw $t1, 4($fp)    #load caller object
beq $t1, $0, _null_pointer_exception
sw $a0, 16($t1)        #load y
li $a0, 0
addiu $sp, $sp, 0
lw $ra, 4($sp) # restore $ra
addiu $sp, $sp, 12
lw $fp, 0($sp)# restore $fp
jr $ra

Foo6__getX:
move $fp, $sp
sw $ra, 0($sp) # push $ra
addiu $sp, $sp, -4
addiu $sp, $sp, 0
lw $a0, 4($fp)  #load caller object
beq $a0, $0, _null_pointer_exception
lw $a0, 12($a0)        #save x
addiu $sp, $sp, 0
lw $ra, 4($sp) # restore $ra
addiu $sp, $sp, 12
lw $fp, 0($sp)# restore $fp
jr $ra

Foo6__getY:
move $fp, $sp
sw $ra, 0($sp) # push $ra
addiu $sp, $sp, -4
addiu $sp, $sp, 0
lw $a0, 4($fp)  #load caller object
beq $a0, $0, _null_pointer_exception
lw $a0, 16($a0)        #save y
addiu $sp, $sp, 0
lw $ra, 4($sp) # restore $ra
addiu $sp, $sp, 12
lw $fp, 0($sp)# restore $fp
jr $ra

Bar6__setFoo:
move $fp, $sp
sw $ra, 0($sp) # push $ra
addiu $sp, $sp, -4
addiu $sp, $sp, 0
lw $a0, 4($fp)        #load _foo
lw $t1, 8($fp)    #load caller object
beq $t1, $0, _null_pointer_exception
sw $a0, 12($t1)        #load foo
li $a0, 0
addiu $sp, $sp, 0
lw $ra, 4($sp) # restore $ra
addiu $sp, $sp, 16
lw $fp, 0($sp)# restore $fp
jr $ra

Bar6__f:
move $fp, $sp
sw $ra, 0($sp) # push $ra
addiu $sp, $sp, -4
addiu $sp, $sp, -4
sw $fp, 0($sp)		# push $fp
addiu $sp, $sp, -4
lw $a0, 4($fp)  #load caller object
beq $a0, $0, _null_pointer_exception
lw $a0, 12($a0)        #save foo
beq $a0, $0, _null_pointer_exception
sw $a0, 0 ($sp)		#push caller param
addiu $sp, $sp, -4
jal Foo6__f
sw $a0, -4($fp)     #save dummy
sw $fp, 0($sp)		# push $fp
addiu $sp, $sp, -4
lw $a0, 4($fp)  #load caller object
beq $a0, $0, _null_pointer_exception
lw $a0, 12($a0)        #save foo
beq $a0, $0, _null_pointer_exception
sw $a0, 0 ($sp)		#push caller param
addiu $sp, $sp, -4
jal Foo6__getX
addiu $sp, $sp, 4
lw $ra, 4($sp) # restore $ra
addiu $sp, $sp, 12
lw $fp, 0($sp)# restore $fp
jr $ra

Bar6__g:
move $fp, $sp
sw $ra, 0($sp) # push $ra
addiu $sp, $sp, -4
addiu $sp, $sp, -4
sw $fp, 0($sp)		# push $fp
addiu $sp, $sp, -4
lw $a0, 4($fp)  #load caller object
beq $a0, $0, _null_pointer_exception
lw $a0, 12($a0)        #save foo
beq $a0, $0, _null_pointer_exception
sw $a0, 0 ($sp)		#push caller param
addiu $sp, $sp, -4
jal Foo6__g
sw $a0, -4($fp)     #save dummy
sw $fp, 0($sp)		# push $fp
addiu $sp, $sp, -4
lw $a0, 4($fp)  #load caller object
beq $a0, $0, _null_pointer_exception
lw $a0, 12($a0)        #save foo
beq $a0, $0, _null_pointer_exception
sw $a0, 0 ($sp)		#push caller param
addiu $sp, $sp, -4
jal Foo6__getY
addiu $sp, $sp, 4
lw $ra, 4($sp) # restore $ra
addiu $sp, $sp, 12
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

