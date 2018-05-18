.data
newline: .asciiz "\n"
msg_index_out_of_bound_exception: .asciiz "Index out of bound exception\n"
msg_null_pointer_exception: .asciiz "Null pointer exception\n"

.text

move $fp, $sp
addiu $sp, $sp, -4
addiu $sp, $sp, 0

sw $fp, 0($sp)		# push $fp
addiu $sp, $sp, -4
li $a0, 5

sll $a0, $a0, 2   # multiple by 4 bytes
li $v0, 9         # allocate space
syscall
li $t1, 0
sw $t1, 0($v0)
li $t1, 5
sw $t1, 4($v0)
move $a0, $v0
beq $a0, $0, _null_pointer_exception
sw $a0, 0 ($sp)		#push caller param
addiu $sp, $sp, -4
li $a0, 10
sw $a0, 0 ($sp)		#push param
addiu $sp, $sp, -4
jal QS__Start
jal _print_int        # system call code for print_int 

# exit
li $v0, 10
syscall

QS__Start:
move $fp, $sp
sw $ra, 0($sp) # push $ra
addiu $sp, $sp, -4
addiu $sp, $sp, -4
sw $fp, 0($sp)		# push $fp
addiu $sp, $sp, -4
lw $a0, 8($fp)  #load caller object (this)
beq $a0, $0, _null_pointer_exception
beq $a0, $0, _null_pointer_exception
sw $a0, 0 ($sp)		#push caller param
addiu $sp, $sp, -4
lw $a0, 4($fp)        #load sz
sw $a0, 0 ($sp)		#push param
addiu $sp, $sp, -4
jal QS__Init
sw $a0, -4($fp)     #save aux01
sw $fp, 0($sp)		# push $fp
addiu $sp, $sp, -4
lw $a0, 8($fp)  #load caller object (this)
beq $a0, $0, _null_pointer_exception
beq $a0, $0, _null_pointer_exception
sw $a0, 0 ($sp)		#push caller param
addiu $sp, $sp, -4
jal QS__Print
sw $a0, -4($fp)     #save aux01
li $a0, 9999
jal _print_int        # system call code for print_int 

lw $a0, 8($fp)  #load caller object
beq $a0, $0, _null_pointer_exception
lw $a0, 16($a0)        #save size
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
li $a0, 1
lw $t1, 4($sp)	  # $t1 = stack top
sub $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

sw $a0, -4($fp)     #save aux01
sw $fp, 0($sp)		# push $fp
addiu $sp, $sp, -4
lw $a0, 8($fp)  #load caller object (this)
beq $a0, $0, _null_pointer_exception
beq $a0, $0, _null_pointer_exception
sw $a0, 0 ($sp)		#push caller param
addiu $sp, $sp, -4
lw $a0, -4($fp)     #load aux01
sw $a0, 0 ($sp)		#push param
addiu $sp, $sp, -4
li $a0, 0
sw $a0, 0 ($sp)		#push param
addiu $sp, $sp, -4
jal QS__Sort
sw $a0, -4($fp)     #save aux01
sw $fp, 0($sp)		# push $fp
addiu $sp, $sp, -4
lw $a0, 8($fp)  #load caller object (this)
beq $a0, $0, _null_pointer_exception
beq $a0, $0, _null_pointer_exception
sw $a0, 0 ($sp)		#push caller param
addiu $sp, $sp, -4
jal QS__Print
sw $a0, -4($fp)     #save aux01
li $a0, 0
addiu $sp, $sp, 4
lw $ra, 4($sp) # restore $ra
addiu $sp, $sp, 16
lw $fp, 0($sp)# restore $fp
jr $ra

QS__Sort:
move $fp, $sp
sw $ra, 0($sp) # push $ra
addiu $sp, $sp, -4
addiu $sp, $sp, -32
li $a0, 0
sw $a0, -20($fp)     #save t
lw $a0, 4($fp)        #load left
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
lw $a0, 8($fp)        #load right
lw $t1, 4($sp)	  # $t1 = stack top
slt $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

beq $a0, $0, else_0

lw $a0, 8($fp)        #load right
sll $a0, $a0, 2
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
lw $a0, 12($fp)  #load caller object
beq $a0, $0, _null_pointer_exception
lw $a0, 12($a0)        #save number
beq $a0, $0, _null_pointer_exception
lw $t2, 0($a0)
sll $t2, $t2, 2
addiu $a0, $a0, 4
lw $t1, 4($sp)	  # $t1 = stack top

bge $t1, $t2, _array_index_out_of_bound_exception
add $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop
lw $a0, 0($a0)
sw $a0, -4($fp)     #save v
lw $a0, 4($fp)        #load left
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
li $a0, 1
lw $t1, 4($sp)	  # $t1 = stack top
sub $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

sw $a0, -8($fp)     #save i
lw $a0, 8($fp)        #load right
sw $a0, -12($fp)     #save j
li $a0, 0xFFFFFFFF
sw $a0, -24($fp)     #save cont01
while_start_2:
lw $a0, -24($fp)     #load cont01
beq $a0, $0, while_end_3

li $a0, 0xFFFFFFFF
sw $a0, -28($fp)     #save cont02
while_start_4:
lw $a0, -28($fp)     #load cont02
beq $a0, $0, while_end_5

lw $a0, -8($fp)     #load i
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
li $a0, 1
lw $t1, 4($sp)	  # $t1 = stack top
add $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

sw $a0, -8($fp)     #save i
lw $a0, -8($fp)     #load i
sll $a0, $a0, 2
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
lw $a0, 12($fp)  #load caller object
beq $a0, $0, _null_pointer_exception
lw $a0, 12($a0)        #save number
beq $a0, $0, _null_pointer_exception
lw $t2, 0($a0)
sll $t2, $t2, 2
addiu $a0, $a0, 4
lw $t1, 4($sp)	  # $t1 = stack top

bge $t1, $t2, _array_index_out_of_bound_exception
add $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop
lw $a0, 0($a0)
sw $a0, -32($fp)     #save aux03
lw $a0, -32($fp)     #load aux03
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
lw $a0, -4($fp)     #load v
lw $t1, 4($sp)	  # $t1 = stack top
slt $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

nor $a0, $a0, $a0 	 #not $a0

beq $a0, $0, else_6

li $a0, 0
sw $a0, -28($fp)     #save cont02

b end_if_7

else_6:
li $a0, 0xFFFFFFFF
sw $a0, -28($fp)     #save cont02

end_if_7:


b while_start_4

while_end_5:

li $a0, 0xFFFFFFFF
sw $a0, -28($fp)     #save cont02
while_start_8:
lw $a0, -28($fp)     #load cont02
beq $a0, $0, while_end_9

lw $a0, -12($fp)     #load j
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
li $a0, 1
lw $t1, 4($sp)	  # $t1 = stack top
sub $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

sw $a0, -12($fp)     #save j
lw $a0, -12($fp)     #load j
sll $a0, $a0, 2
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
lw $a0, 12($fp)  #load caller object
beq $a0, $0, _null_pointer_exception
lw $a0, 12($a0)        #save number
beq $a0, $0, _null_pointer_exception
lw $t2, 0($a0)
sll $t2, $t2, 2
addiu $a0, $a0, 4
lw $t1, 4($sp)	  # $t1 = stack top

bge $t1, $t2, _array_index_out_of_bound_exception
add $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop
lw $a0, 0($a0)
sw $a0, -32($fp)     #save aux03
lw $a0, -4($fp)     #load v
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
lw $a0, -32($fp)     #load aux03
lw $t1, 4($sp)	  # $t1 = stack top
slt $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

nor $a0, $a0, $a0 	 #not $a0

beq $a0, $0, else_10

li $a0, 0
sw $a0, -28($fp)     #save cont02

b end_if_11

else_10:
li $a0, 0xFFFFFFFF
sw $a0, -28($fp)     #save cont02

end_if_11:


b while_start_8

while_end_9:

lw $a0, -8($fp)     #load i
sll $a0, $a0, 2
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
lw $a0, 12($fp)  #load caller object
beq $a0, $0, _null_pointer_exception
lw $a0, 12($a0)        #save number
beq $a0, $0, _null_pointer_exception
lw $t2, 0($a0)
sll $t2, $t2, 2
addiu $a0, $a0, 4
lw $t1, 4($sp)	  # $t1 = stack top

bge $t1, $t2, _array_index_out_of_bound_exception
add $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop
lw $a0, 0($a0)
sw $a0, -20($fp)     #save t
#start ArrayAssign
#start ArrayAssign e1
lw $a0, -8($fp)     #load i
sll $a0, $a0, 2
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
#end ArrayAssign e1
#start ArrayAssign i
lw $a0, 12($fp)  #load caller object
beq $a0, $0, _null_pointer_exception
lw $a0, 12($a0)        #load number
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
lw $a0, -12($fp)     #load j
sll $a0, $a0, 2
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
lw $a0, 12($fp)  #load caller object
beq $a0, $0, _null_pointer_exception
lw $a0, 12($a0)        #save number
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
lw $a0, -12($fp)     #load j
sll $a0, $a0, 2
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
#end ArrayAssign e1
#start ArrayAssign i
lw $a0, 12($fp)  #load caller object
beq $a0, $0, _null_pointer_exception
lw $a0, 12($a0)        #load number
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
lw $a0, -20($fp)     #load t
lw $t1, 4($sp)	  # $t1 = stack top
addiu $sp, $sp, 4	  # pop
sw $a0, 0($t1)
#end ArrayAssign e2
#end ArrayAssign
lw $a0, -12($fp)     #load j
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
lw $a0, -8($fp)     #load i
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
li $a0, 1
lw $t1, 4($sp)	  # $t1 = stack top
add $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

lw $t1, 4($sp)	  # $t1 = stack top
slt $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

beq $a0, $0, else_12

li $a0, 0
sw $a0, -24($fp)     #save cont01

b end_if_13

else_12:
li $a0, 0xFFFFFFFF
sw $a0, -24($fp)     #save cont01

end_if_13:


b while_start_2

while_end_3:

#start ArrayAssign
#start ArrayAssign e1
lw $a0, -12($fp)     #load j
sll $a0, $a0, 2
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
#end ArrayAssign e1
#start ArrayAssign i
lw $a0, 12($fp)  #load caller object
beq $a0, $0, _null_pointer_exception
lw $a0, 12($a0)        #load number
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
lw $a0, -8($fp)     #load i
sll $a0, $a0, 2
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
lw $a0, 12($fp)  #load caller object
beq $a0, $0, _null_pointer_exception
lw $a0, 12($a0)        #save number
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
lw $a0, -8($fp)     #load i
sll $a0, $a0, 2
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
#end ArrayAssign e1
#start ArrayAssign i
lw $a0, 12($fp)  #load caller object
beq $a0, $0, _null_pointer_exception
lw $a0, 12($a0)        #load number
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
lw $a0, 8($fp)        #load right
sll $a0, $a0, 2
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
lw $a0, 12($fp)  #load caller object
beq $a0, $0, _null_pointer_exception
lw $a0, 12($a0)        #save number
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
lw $a0, 8($fp)        #load right
sll $a0, $a0, 2
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
#end ArrayAssign e1
#start ArrayAssign i
lw $a0, 12($fp)  #load caller object
beq $a0, $0, _null_pointer_exception
lw $a0, 12($a0)        #load number
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
lw $a0, -20($fp)     #load t
lw $t1, 4($sp)	  # $t1 = stack top
addiu $sp, $sp, 4	  # pop
sw $a0, 0($t1)
#end ArrayAssign e2
#end ArrayAssign
sw $fp, 0($sp)		# push $fp
addiu $sp, $sp, -4
lw $a0, 12($fp)  #load caller object (this)
beq $a0, $0, _null_pointer_exception
beq $a0, $0, _null_pointer_exception
sw $a0, 0 ($sp)		#push caller param
addiu $sp, $sp, -4
lw $a0, -8($fp)     #load i
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
li $a0, 1
lw $t1, 4($sp)	  # $t1 = stack top
sub $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

sw $a0, 0 ($sp)		#push param
addiu $sp, $sp, -4
lw $a0, 4($fp)        #load left
sw $a0, 0 ($sp)		#push param
addiu $sp, $sp, -4
jal QS__Sort
sw $a0, -16($fp)     #save nt
sw $fp, 0($sp)		# push $fp
addiu $sp, $sp, -4
lw $a0, 12($fp)  #load caller object (this)
beq $a0, $0, _null_pointer_exception
beq $a0, $0, _null_pointer_exception
sw $a0, 0 ($sp)		#push caller param
addiu $sp, $sp, -4
lw $a0, 8($fp)        #load right
sw $a0, 0 ($sp)		#push param
addiu $sp, $sp, -4
lw $a0, -8($fp)     #load i
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
li $a0, 1
lw $t1, 4($sp)	  # $t1 = stack top
add $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

sw $a0, 0 ($sp)		#push param
addiu $sp, $sp, -4
jal QS__Sort
sw $a0, -16($fp)     #save nt

b end_if_1

else_0:
li $a0, 0
sw $a0, -16($fp)     #save nt

end_if_1:

li $a0, 0
addiu $sp, $sp, 32
lw $ra, 4($sp) # restore $ra
addiu $sp, $sp, 20
lw $fp, 0($sp)# restore $fp
jr $ra

QS__Print:
move $fp, $sp
sw $ra, 0($sp) # push $ra
addiu $sp, $sp, -4
addiu $sp, $sp, -4
li $a0, 0
sw $a0, -4($fp)     #save j
while_start_14:
lw $a0, -4($fp)     #load j
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
lw $a0, 4($fp)  #load caller object
beq $a0, $0, _null_pointer_exception
lw $a0, 16($a0)        #save size
lw $t1, 4($sp)	  # $t1 = stack top
slt $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

beq $a0, $0, while_end_15

lw $a0, -4($fp)     #load j
sll $a0, $a0, 2
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
lw $a0, 4($fp)  #load caller object
beq $a0, $0, _null_pointer_exception
lw $a0, 12($a0)        #save number
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

lw $a0, -4($fp)     #load j
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
li $a0, 1
lw $t1, 4($sp)	  # $t1 = stack top
add $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

sw $a0, -4($fp)     #save j

b while_start_14

while_end_15:

li $a0, 0
addiu $sp, $sp, 4
lw $ra, 4($sp) # restore $ra
addiu $sp, $sp, 12
lw $fp, 0($sp)# restore $fp
jr $ra

QS__Init:
move $fp, $sp
sw $ra, 0($sp) # push $ra
addiu $sp, $sp, -4
addiu $sp, $sp, 0
lw $a0, 4($fp)        #load sz
lw $t1, 8($fp)    #load caller object
beq $t1, $0, _null_pointer_exception
sw $a0, 16($t1)        #load size
lw $a0, 4($fp)        #load sz
jal _alloc_int_array
move $a0, $v0
lw $t1, 8($fp)    #load caller object
beq $t1, $0, _null_pointer_exception
sw $a0, 12($t1)        #load number
#start ArrayAssign
#start ArrayAssign e1
li $a0, 0
sll $a0, $a0, 2
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
#end ArrayAssign e1
#start ArrayAssign i
lw $a0, 8($fp)  #load caller object
beq $a0, $0, _null_pointer_exception
lw $a0, 12($a0)        #load number
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
li $a0, 20
lw $t1, 4($sp)	  # $t1 = stack top
addiu $sp, $sp, 4	  # pop
sw $a0, 0($t1)
#end ArrayAssign e2
#end ArrayAssign
#start ArrayAssign
#start ArrayAssign e1
li $a0, 1
sll $a0, $a0, 2
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
#end ArrayAssign e1
#start ArrayAssign i
lw $a0, 8($fp)  #load caller object
beq $a0, $0, _null_pointer_exception
lw $a0, 12($a0)        #load number
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
li $a0, 7
lw $t1, 4($sp)	  # $t1 = stack top
addiu $sp, $sp, 4	  # pop
sw $a0, 0($t1)
#end ArrayAssign e2
#end ArrayAssign
#start ArrayAssign
#start ArrayAssign e1
li $a0, 2
sll $a0, $a0, 2
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
#end ArrayAssign e1
#start ArrayAssign i
lw $a0, 8($fp)  #load caller object
beq $a0, $0, _null_pointer_exception
lw $a0, 12($a0)        #load number
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
li $a0, 12
lw $t1, 4($sp)	  # $t1 = stack top
addiu $sp, $sp, 4	  # pop
sw $a0, 0($t1)
#end ArrayAssign e2
#end ArrayAssign
#start ArrayAssign
#start ArrayAssign e1
li $a0, 3
sll $a0, $a0, 2
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
#end ArrayAssign e1
#start ArrayAssign i
lw $a0, 8($fp)  #load caller object
beq $a0, $0, _null_pointer_exception
lw $a0, 12($a0)        #load number
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
li $a0, 18
lw $t1, 4($sp)	  # $t1 = stack top
addiu $sp, $sp, 4	  # pop
sw $a0, 0($t1)
#end ArrayAssign e2
#end ArrayAssign
#start ArrayAssign
#start ArrayAssign e1
li $a0, 4
sll $a0, $a0, 2
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
#end ArrayAssign e1
#start ArrayAssign i
lw $a0, 8($fp)  #load caller object
beq $a0, $0, _null_pointer_exception
lw $a0, 12($a0)        #load number
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
lw $t1, 4($sp)	  # $t1 = stack top
addiu $sp, $sp, 4	  # pop
sw $a0, 0($t1)
#end ArrayAssign e2
#end ArrayAssign
#start ArrayAssign
#start ArrayAssign e1
li $a0, 5
sll $a0, $a0, 2
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
#end ArrayAssign e1
#start ArrayAssign i
lw $a0, 8($fp)  #load caller object
beq $a0, $0, _null_pointer_exception
lw $a0, 12($a0)        #load number
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
li $a0, 11
lw $t1, 4($sp)	  # $t1 = stack top
addiu $sp, $sp, 4	  # pop
sw $a0, 0($t1)
#end ArrayAssign e2
#end ArrayAssign
#start ArrayAssign
#start ArrayAssign e1
li $a0, 6
sll $a0, $a0, 2
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
#end ArrayAssign e1
#start ArrayAssign i
lw $a0, 8($fp)  #load caller object
beq $a0, $0, _null_pointer_exception
lw $a0, 12($a0)        #load number
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
li $a0, 6
lw $t1, 4($sp)	  # $t1 = stack top
addiu $sp, $sp, 4	  # pop
sw $a0, 0($t1)
#end ArrayAssign e2
#end ArrayAssign
#start ArrayAssign
#start ArrayAssign e1
li $a0, 7
sll $a0, $a0, 2
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
#end ArrayAssign e1
#start ArrayAssign i
lw $a0, 8($fp)  #load caller object
beq $a0, $0, _null_pointer_exception
lw $a0, 12($a0)        #load number
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
li $a0, 9
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
lw $a0, 8($fp)  #load caller object
beq $a0, $0, _null_pointer_exception
lw $a0, 12($a0)        #load number
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
li $a0, 19
lw $t1, 4($sp)	  # $t1 = stack top
addiu $sp, $sp, 4	  # pop
sw $a0, 0($t1)
#end ArrayAssign e2
#end ArrayAssign
#start ArrayAssign
#start ArrayAssign e1
li $a0, 9
sll $a0, $a0, 2
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
#end ArrayAssign e1
#start ArrayAssign i
lw $a0, 8($fp)  #load caller object
beq $a0, $0, _null_pointer_exception
lw $a0, 12($a0)        #load number
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
li $a0, 5
lw $t1, 4($sp)	  # $t1 = stack top
addiu $sp, $sp, 4	  # pop
sw $a0, 0($t1)
#end ArrayAssign e2
#end ArrayAssign
li $a0, 0
addiu $sp, $sp, 0
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

