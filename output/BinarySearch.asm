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
li $a0, 20
sw $a0, 0 ($sp)		#push param
addiu $sp, $sp, -4
jal BS__Start
jal _print_int        # system call code for print_int 

# exit
li $v0, 10
syscall

BS__Start:
move $fp, $sp
sw $ra, 0($sp) # push $ra
addiu $sp, $sp, -4
addiu $sp, $sp, -8
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
jal BS__Init
sw $a0, -4($fp)     #save aux01
sw $fp, 0($sp)		# push $fp
addiu $sp, $sp, -4
lw $a0, 8($fp)  #load caller object (this)
beq $a0, $0, _null_pointer_exception
beq $a0, $0, _null_pointer_exception
sw $a0, 0 ($sp)		#push caller param
addiu $sp, $sp, -4
jal BS__Print
sw $a0, -8($fp)     #save aux02
sw $fp, 0($sp)		# push $fp
addiu $sp, $sp, -4
lw $a0, 8($fp)  #load caller object (this)
beq $a0, $0, _null_pointer_exception
beq $a0, $0, _null_pointer_exception
sw $a0, 0 ($sp)		#push caller param
addiu $sp, $sp, -4
li $a0, 8
sw $a0, 0 ($sp)		#push param
addiu $sp, $sp, -4
jal BS__Search
beq $a0, $0, else_0

li $a0, 1
jal _print_int        # system call code for print_int 


b end_if_1

else_0:
li $a0, 0
jal _print_int        # system call code for print_int 


end_if_1:

sw $fp, 0($sp)		# push $fp
addiu $sp, $sp, -4
lw $a0, 8($fp)  #load caller object (this)
beq $a0, $0, _null_pointer_exception
beq $a0, $0, _null_pointer_exception
sw $a0, 0 ($sp)		#push caller param
addiu $sp, $sp, -4
li $a0, 19
sw $a0, 0 ($sp)		#push param
addiu $sp, $sp, -4
jal BS__Search
beq $a0, $0, else_2

li $a0, 1
jal _print_int        # system call code for print_int 


b end_if_3

else_2:
li $a0, 0
jal _print_int        # system call code for print_int 


end_if_3:

sw $fp, 0($sp)		# push $fp
addiu $sp, $sp, -4
lw $a0, 8($fp)  #load caller object (this)
beq $a0, $0, _null_pointer_exception
beq $a0, $0, _null_pointer_exception
sw $a0, 0 ($sp)		#push caller param
addiu $sp, $sp, -4
li $a0, 20
sw $a0, 0 ($sp)		#push param
addiu $sp, $sp, -4
jal BS__Search
beq $a0, $0, else_4

li $a0, 1
jal _print_int        # system call code for print_int 


b end_if_5

else_4:
li $a0, 0
jal _print_int        # system call code for print_int 


end_if_5:

sw $fp, 0($sp)		# push $fp
addiu $sp, $sp, -4
lw $a0, 8($fp)  #load caller object (this)
beq $a0, $0, _null_pointer_exception
beq $a0, $0, _null_pointer_exception
sw $a0, 0 ($sp)		#push caller param
addiu $sp, $sp, -4
li $a0, 21
sw $a0, 0 ($sp)		#push param
addiu $sp, $sp, -4
jal BS__Search
beq $a0, $0, else_6

li $a0, 1
jal _print_int        # system call code for print_int 


b end_if_7

else_6:
li $a0, 0
jal _print_int        # system call code for print_int 


end_if_7:

sw $fp, 0($sp)		# push $fp
addiu $sp, $sp, -4
lw $a0, 8($fp)  #load caller object (this)
beq $a0, $0, _null_pointer_exception
beq $a0, $0, _null_pointer_exception
sw $a0, 0 ($sp)		#push caller param
addiu $sp, $sp, -4
li $a0, 37
sw $a0, 0 ($sp)		#push param
addiu $sp, $sp, -4
jal BS__Search
beq $a0, $0, else_8

li $a0, 1
jal _print_int        # system call code for print_int 


b end_if_9

else_8:
li $a0, 0
jal _print_int        # system call code for print_int 


end_if_9:

sw $fp, 0($sp)		# push $fp
addiu $sp, $sp, -4
lw $a0, 8($fp)  #load caller object (this)
beq $a0, $0, _null_pointer_exception
beq $a0, $0, _null_pointer_exception
sw $a0, 0 ($sp)		#push caller param
addiu $sp, $sp, -4
li $a0, 38
sw $a0, 0 ($sp)		#push param
addiu $sp, $sp, -4
jal BS__Search
beq $a0, $0, else_10

li $a0, 1
jal _print_int        # system call code for print_int 


b end_if_11

else_10:
li $a0, 0
jal _print_int        # system call code for print_int 


end_if_11:

sw $fp, 0($sp)		# push $fp
addiu $sp, $sp, -4
lw $a0, 8($fp)  #load caller object (this)
beq $a0, $0, _null_pointer_exception
beq $a0, $0, _null_pointer_exception
sw $a0, 0 ($sp)		#push caller param
addiu $sp, $sp, -4
li $a0, 39
sw $a0, 0 ($sp)		#push param
addiu $sp, $sp, -4
jal BS__Search
beq $a0, $0, else_12

li $a0, 1
jal _print_int        # system call code for print_int 


b end_if_13

else_12:
li $a0, 0
jal _print_int        # system call code for print_int 


end_if_13:

sw $fp, 0($sp)		# push $fp
addiu $sp, $sp, -4
lw $a0, 8($fp)  #load caller object (this)
beq $a0, $0, _null_pointer_exception
beq $a0, $0, _null_pointer_exception
sw $a0, 0 ($sp)		#push caller param
addiu $sp, $sp, -4
li $a0, 50
sw $a0, 0 ($sp)		#push param
addiu $sp, $sp, -4
jal BS__Search
beq $a0, $0, else_14

li $a0, 1
jal _print_int        # system call code for print_int 


b end_if_15

else_14:
li $a0, 0
jal _print_int        # system call code for print_int 


end_if_15:

li $a0, 999
addiu $sp, $sp, 8
lw $ra, 4($sp) # restore $ra
addiu $sp, $sp, 16
lw $fp, 0($sp)# restore $fp
jr $ra

BS__Search:
move $fp, $sp
sw $ra, 0($sp) # push $ra
addiu $sp, $sp, -4
addiu $sp, $sp, -28
li $a0, 0
sw $a0, -24($fp)     #save aux01
li $a0, 0
sw $a0, -4($fp)     #save bs01
lw $a0, 8($fp)  #load caller object
beq $a0, $0, _null_pointer_exception
lw $a0, 12($a0)        #save number
beq $a0, $0, _null_pointer_exception
lw $a0, 0($a0)
sw $a0, -8($fp)     #save right
lw $a0, -8($fp)     #load right
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
li $a0, 1
lw $t1, 4($sp)	  # $t1 = stack top
sub $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

sw $a0, -8($fp)     #save right
li $a0, 0
sw $a0, -12($fp)     #save left
li $a0, 0xFFFFFFFF
sw $a0, -16($fp)     #save var_cont
while_start_16:
lw $a0, -16($fp)     #load var_cont
beq $a0, $0, while_end_17

lw $a0, -12($fp)     #load left
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
lw $a0, -8($fp)     #load right
lw $t1, 4($sp)	  # $t1 = stack top
add $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

sw $a0, -20($fp)     #save medium
sw $fp, 0($sp)		# push $fp
addiu $sp, $sp, -4
lw $a0, 8($fp)  #load caller object (this)
beq $a0, $0, _null_pointer_exception
beq $a0, $0, _null_pointer_exception
sw $a0, 0 ($sp)		#push caller param
addiu $sp, $sp, -4
lw $a0, -20($fp)     #load medium
sw $a0, 0 ($sp)		#push param
addiu $sp, $sp, -4
jal BS__Div
sw $a0, -20($fp)     #save medium
lw $a0, -20($fp)     #load medium
sll $a0, $a0, 2
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
lw $a0, 8($fp)  #load caller object
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
sw $a0, -24($fp)     #save aux01
lw $a0, 4($fp)        #load num
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
lw $a0, -24($fp)     #load aux01
lw $t1, 4($sp)	  # $t1 = stack top
slt $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

beq $a0, $0, else_18

lw $a0, -20($fp)     #load medium
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
li $a0, 1
lw $t1, 4($sp)	  # $t1 = stack top
sub $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

sw $a0, -8($fp)     #save right

b end_if_19

else_18:
lw $a0, -20($fp)     #load medium
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
li $a0, 1
lw $t1, 4($sp)	  # $t1 = stack top
add $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

sw $a0, -12($fp)     #save left

end_if_19:

sw $fp, 0($sp)		# push $fp
addiu $sp, $sp, -4
lw $a0, 8($fp)  #load caller object (this)
beq $a0, $0, _null_pointer_exception
beq $a0, $0, _null_pointer_exception
sw $a0, 0 ($sp)		#push caller param
addiu $sp, $sp, -4
lw $a0, 4($fp)        #load num
sw $a0, 0 ($sp)		#push param
addiu $sp, $sp, -4
lw $a0, -24($fp)     #load aux01
sw $a0, 0 ($sp)		#push param
addiu $sp, $sp, -4
jal BS__Compare
beq $a0, $0, else_20

li $a0, 0
sw $a0, -16($fp)     #save var_cont

b end_if_21

else_20:
li $a0, 0xFFFFFFFF
sw $a0, -16($fp)     #save var_cont

end_if_21:

lw $a0, -8($fp)     #load right
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
lw $a0, -12($fp)     #load left
lw $t1, 4($sp)	  # $t1 = stack top
slt $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

beq $a0, $0, else_22

li $a0, 0
sw $a0, -16($fp)     #save var_cont

b end_if_23

else_22:
li $a0, 0
sw $a0, -28($fp)     #save nt

end_if_23:


b while_start_16

while_end_17:

sw $fp, 0($sp)		# push $fp
addiu $sp, $sp, -4
lw $a0, 8($fp)  #load caller object (this)
beq $a0, $0, _null_pointer_exception
beq $a0, $0, _null_pointer_exception
sw $a0, 0 ($sp)		#push caller param
addiu $sp, $sp, -4
lw $a0, 4($fp)        #load num
sw $a0, 0 ($sp)		#push param
addiu $sp, $sp, -4
lw $a0, -24($fp)     #load aux01
sw $a0, 0 ($sp)		#push param
addiu $sp, $sp, -4
jal BS__Compare
beq $a0, $0, else_24

li $a0, 0xFFFFFFFF
sw $a0, -4($fp)     #save bs01

b end_if_25

else_24:
li $a0, 0
sw $a0, -4($fp)     #save bs01

end_if_25:

lw $a0, -4($fp)     #load bs01
addiu $sp, $sp, 28
lw $ra, 4($sp) # restore $ra
addiu $sp, $sp, 16
lw $fp, 0($sp)# restore $fp
jr $ra

BS__Div:
move $fp, $sp
sw $ra, 0($sp) # push $ra
addiu $sp, $sp, -4
addiu $sp, $sp, -12
li $a0, 0
sw $a0, -4($fp)     #save count01
li $a0, 0
sw $a0, -8($fp)     #save count02
lw $a0, 4($fp)        #load num
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
li $a0, 1
lw $t1, 4($sp)	  # $t1 = stack top
sub $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

sw $a0, -12($fp)     #save aux03
while_start_26:
lw $a0, -8($fp)     #load count02
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
lw $a0, -12($fp)     #load aux03
lw $t1, 4($sp)	  # $t1 = stack top
slt $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

beq $a0, $0, while_end_27

lw $a0, -4($fp)     #load count01
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
li $a0, 1
lw $t1, 4($sp)	  # $t1 = stack top
add $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

sw $a0, -4($fp)     #save count01
lw $a0, -8($fp)     #load count02
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
li $a0, 2
lw $t1, 4($sp)	  # $t1 = stack top
add $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

sw $a0, -8($fp)     #save count02

b while_start_26

while_end_27:

lw $a0, -4($fp)     #load count01
addiu $sp, $sp, 12
lw $ra, 4($sp) # restore $ra
addiu $sp, $sp, 16
lw $fp, 0($sp)# restore $fp
jr $ra

BS__Compare:
move $fp, $sp
sw $ra, 0($sp) # push $ra
addiu $sp, $sp, -4
addiu $sp, $sp, -8
li $a0, 0
sw $a0, -4($fp)     #save retval
lw $a0, 8($fp)        #load num2
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
li $a0, 1
lw $t1, 4($sp)	  # $t1 = stack top
add $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

sw $a0, -8($fp)     #save aux02
lw $a0, 4($fp)        #load num1
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
lw $a0, 8($fp)        #load num2
lw $t1, 4($sp)	  # $t1 = stack top
slt $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

beq $a0, $0, else_28

li $a0, 0
sw $a0, -4($fp)     #save retval

b end_if_29

else_28:
lw $a0, 4($fp)        #load num1
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
lw $a0, -8($fp)     #load aux02
lw $t1, 4($sp)	  # $t1 = stack top
slt $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

nor $a0, $a0, $a0 	 #not $a0

beq $a0, $0, else_30

li $a0, 0
sw $a0, -4($fp)     #save retval

b end_if_31

else_30:
li $a0, 0xFFFFFFFF
sw $a0, -4($fp)     #save retval

end_if_31:


end_if_29:

lw $a0, -4($fp)     #load retval
addiu $sp, $sp, 8
lw $ra, 4($sp) # restore $ra
addiu $sp, $sp, 20
lw $fp, 0($sp)# restore $fp
jr $ra

BS__Print:
move $fp, $sp
sw $ra, 0($sp) # push $ra
addiu $sp, $sp, -4
addiu $sp, $sp, -4
li $a0, 1
sw $a0, -4($fp)     #save j
while_start_32:
lw $a0, -4($fp)     #load j
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
lw $a0, 4($fp)  #load caller object
beq $a0, $0, _null_pointer_exception
lw $a0, 16($a0)        #save size
lw $t1, 4($sp)	  # $t1 = stack top
slt $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

beq $a0, $0, while_end_33

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

b while_start_32

while_end_33:

li $a0, 99999
jal _print_int        # system call code for print_int 

li $a0, 0
addiu $sp, $sp, 4
lw $ra, 4($sp) # restore $ra
addiu $sp, $sp, 12
lw $fp, 0($sp)# restore $fp
jr $ra

BS__Init:
move $fp, $sp
sw $ra, 0($sp) # push $ra
addiu $sp, $sp, -4
addiu $sp, $sp, -16
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
li $a0, 1
sw $a0, -4($fp)     #save j
lw $a0, 8($fp)  #load caller object
beq $a0, $0, _null_pointer_exception
lw $a0, 16($a0)        #save size
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
li $a0, 1
lw $t1, 4($sp)	  # $t1 = stack top
add $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

sw $a0, -8($fp)     #save k
while_start_34:
lw $a0, -4($fp)     #load j
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
lw $a0, 8($fp)  #load caller object
beq $a0, $0, _null_pointer_exception
lw $a0, 16($a0)        #save size
lw $t1, 4($sp)	  # $t1 = stack top
slt $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

beq $a0, $0, while_end_35

li $a0, 2
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
lw $a0, -4($fp)     #load j
lw $t1, 4($sp)	  # $t1 = stack top
mult $t1, $a0	  # $a0 = $a0 + stack top
mflo $a0 	  # Moves the value from the LO part of the result register into $a0.
addiu $sp, $sp, 4	  # pop

sw $a0, -16($fp)     #save aux01
lw $a0, -8($fp)     #load k
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
li $a0, 3
lw $t1, 4($sp)	  # $t1 = stack top
sub $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

sw $a0, -12($fp)     #save aux02
#start ArrayAssign
#start ArrayAssign e1
lw $a0, -4($fp)     #load j
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
lw $a0, -16($fp)     #load aux01
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
lw $a0, -12($fp)     #load aux02
lw $t1, 4($sp)	  # $t1 = stack top
add $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

lw $t1, 4($sp)	  # $t1 = stack top
addiu $sp, $sp, 4	  # pop
sw $a0, 0($t1)
#end ArrayAssign e2
#end ArrayAssign
lw $a0, -4($fp)     #load j
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
li $a0, 1
lw $t1, 4($sp)	  # $t1 = stack top
add $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

sw $a0, -4($fp)     #save j
lw $a0, -8($fp)     #load k
sw $a0, 0($sp)	  # push value of e1 to stack
addiu $sp, $sp, -4
li $a0, 1
lw $t1, 4($sp)	  # $t1 = stack top
sub $a0, $t1, $a0	  # $a0 = $a0 + stack top
addiu $sp, $sp, 4	  # pop

sw $a0, -8($fp)     #save k

b while_start_34

while_end_35:

li $a0, 0
addiu $sp, $sp, 16
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
