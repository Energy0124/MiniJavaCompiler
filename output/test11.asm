.data
newline: .asciiz "\n"
msg_index_out_of_bound_exception: .asciiz "Index out of bound exception\n"
msg_null_pointer_exception: .asciiz "Null pointer exception\n"

.text

move $fp, $sp
addiu $sp, $sp, -4
addiu $sp, $sp, 0

li $a0, 0xFFFFFFFF
beq $a0, $0, else_0

li $a0, 0xFFFFFFFF
beq $a0, $0, else_2

li $a0, 0xFFFFFFFF
beq $a0, $0, else_4

li $a0, 1
jal _print_int        # system call code for print_int 


b end_if_5

else_4:
li $a0, 2
jal _print_int        # system call code for print_int 


end_if_5:


b end_if_3

else_2:
li $a0, 0xFFFFFFFF
beq $a0, $0, else_6

li $a0, 3
jal _print_int        # system call code for print_int 


b end_if_7

else_6:
li $a0, 4
jal _print_int        # system call code for print_int 


end_if_7:


end_if_3:


b end_if_1

else_0:
li $a0, 0xFFFFFFFF
beq $a0, $0, else_8

li $a0, 0xFFFFFFFF
beq $a0, $0, else_10

li $a0, 5
jal _print_int        # system call code for print_int 


b end_if_11

else_10:
li $a0, 6
jal _print_int        # system call code for print_int 


end_if_11:


b end_if_9

else_8:
li $a0, 0xFFFFFFFF
beq $a0, $0, else_12

li $a0, 7
jal _print_int        # system call code for print_int 


b end_if_13

else_12:
li $a0, 8
jal _print_int        # system call code for print_int 


end_if_13:


end_if_9:


end_if_1:

li $a0, 0xFFFFFFFF
beq $a0, $0, else_14

li $a0, 0xFFFFFFFF
beq $a0, $0, else_16

li $a0, 0
beq $a0, $0, else_18

li $a0, 1
jal _print_int        # system call code for print_int 


b end_if_19

else_18:
li $a0, 2
jal _print_int        # system call code for print_int 


end_if_19:


b end_if_17

else_16:
li $a0, 0xFFFFFFFF
beq $a0, $0, else_20

li $a0, 3
jal _print_int        # system call code for print_int 


b end_if_21

else_20:
li $a0, 4
jal _print_int        # system call code for print_int 


end_if_21:


end_if_17:


b end_if_15

else_14:
li $a0, 0xFFFFFFFF
beq $a0, $0, else_22

li $a0, 0xFFFFFFFF
beq $a0, $0, else_24

li $a0, 5
jal _print_int        # system call code for print_int 


b end_if_25

else_24:
li $a0, 6
jal _print_int        # system call code for print_int 


end_if_25:


b end_if_23

else_22:
li $a0, 0xFFFFFFFF
beq $a0, $0, else_26

li $a0, 7
jal _print_int        # system call code for print_int 


b end_if_27

else_26:
li $a0, 8
jal _print_int        # system call code for print_int 


end_if_27:


end_if_23:


end_if_15:

li $a0, 0xFFFFFFFF
beq $a0, $0, else_28

li $a0, 0
beq $a0, $0, else_30

li $a0, 0xFFFFFFFF
beq $a0, $0, else_32

li $a0, 1
jal _print_int        # system call code for print_int 


b end_if_33

else_32:
li $a0, 2
jal _print_int        # system call code for print_int 


end_if_33:


b end_if_31

else_30:
li $a0, 0xFFFFFFFF
beq $a0, $0, else_34

li $a0, 3
jal _print_int        # system call code for print_int 


b end_if_35

else_34:
li $a0, 4
jal _print_int        # system call code for print_int 


end_if_35:


end_if_31:


b end_if_29

else_28:
li $a0, 0xFFFFFFFF
beq $a0, $0, else_36

li $a0, 0xFFFFFFFF
beq $a0, $0, else_38

li $a0, 5
jal _print_int        # system call code for print_int 


b end_if_39

else_38:
li $a0, 6
jal _print_int        # system call code for print_int 


end_if_39:


b end_if_37

else_36:
li $a0, 0xFFFFFFFF
beq $a0, $0, else_40

li $a0, 7
jal _print_int        # system call code for print_int 


b end_if_41

else_40:
li $a0, 8
jal _print_int        # system call code for print_int 


end_if_41:


end_if_37:


end_if_29:

li $a0, 0xFFFFFFFF
beq $a0, $0, else_42

li $a0, 0
beq $a0, $0, else_44

li $a0, 0xFFFFFFFF
beq $a0, $0, else_46

li $a0, 1
jal _print_int        # system call code for print_int 


b end_if_47

else_46:
li $a0, 2
jal _print_int        # system call code for print_int 


end_if_47:


b end_if_45

else_44:
li $a0, 0
beq $a0, $0, else_48

li $a0, 3
jal _print_int        # system call code for print_int 


b end_if_49

else_48:
li $a0, 4
jal _print_int        # system call code for print_int 


end_if_49:


end_if_45:


b end_if_43

else_42:
li $a0, 0xFFFFFFFF
beq $a0, $0, else_50

li $a0, 0xFFFFFFFF
beq $a0, $0, else_52

li $a0, 5
jal _print_int        # system call code for print_int 


b end_if_53

else_52:
li $a0, 6
jal _print_int        # system call code for print_int 


end_if_53:


b end_if_51

else_50:
li $a0, 0xFFFFFFFF
beq $a0, $0, else_54

li $a0, 7
jal _print_int        # system call code for print_int 


b end_if_55

else_54:
li $a0, 8
jal _print_int        # system call code for print_int 


end_if_55:


end_if_51:


end_if_43:

li $a0, 0
beq $a0, $0, else_56

li $a0, 0xFFFFFFFF
beq $a0, $0, else_58

li $a0, 0xFFFFFFFF
beq $a0, $0, else_60

li $a0, 1
jal _print_int        # system call code for print_int 


b end_if_61

else_60:
li $a0, 2
jal _print_int        # system call code for print_int 


end_if_61:


b end_if_59

else_58:
li $a0, 0xFFFFFFFF
beq $a0, $0, else_62

li $a0, 3
jal _print_int        # system call code for print_int 


b end_if_63

else_62:
li $a0, 4
jal _print_int        # system call code for print_int 


end_if_63:


end_if_59:


b end_if_57

else_56:
li $a0, 0xFFFFFFFF
beq $a0, $0, else_64

li $a0, 0xFFFFFFFF
beq $a0, $0, else_66

li $a0, 5
jal _print_int        # system call code for print_int 


b end_if_67

else_66:
li $a0, 6
jal _print_int        # system call code for print_int 


end_if_67:


b end_if_65

else_64:
li $a0, 0xFFFFFFFF
beq $a0, $0, else_68

li $a0, 7
jal _print_int        # system call code for print_int 


b end_if_69

else_68:
li $a0, 8
jal _print_int        # system call code for print_int 


end_if_69:


end_if_65:


end_if_57:

li $a0, 0
beq $a0, $0, else_70

li $a0, 0xFFFFFFFF
beq $a0, $0, else_72

li $a0, 0xFFFFFFFF
beq $a0, $0, else_74

li $a0, 1
jal _print_int        # system call code for print_int 


b end_if_75

else_74:
li $a0, 2
jal _print_int        # system call code for print_int 


end_if_75:


b end_if_73

else_72:
li $a0, 0xFFFFFFFF
beq $a0, $0, else_76

li $a0, 3
jal _print_int        # system call code for print_int 


b end_if_77

else_76:
li $a0, 4
jal _print_int        # system call code for print_int 


end_if_77:


end_if_73:


b end_if_71

else_70:
li $a0, 0xFFFFFFFF
beq $a0, $0, else_78

li $a0, 0
beq $a0, $0, else_80

li $a0, 5
jal _print_int        # system call code for print_int 


b end_if_81

else_80:
li $a0, 6
jal _print_int        # system call code for print_int 


end_if_81:


b end_if_79

else_78:
li $a0, 0xFFFFFFFF
beq $a0, $0, else_82

li $a0, 7
jal _print_int        # system call code for print_int 


b end_if_83

else_82:
li $a0, 8
jal _print_int        # system call code for print_int 


end_if_83:


end_if_79:


end_if_71:

li $a0, 0
beq $a0, $0, else_84

li $a0, 0xFFFFFFFF
beq $a0, $0, else_86

li $a0, 0xFFFFFFFF
beq $a0, $0, else_88

li $a0, 1
jal _print_int        # system call code for print_int 


b end_if_89

else_88:
li $a0, 2
jal _print_int        # system call code for print_int 


end_if_89:


b end_if_87

else_86:
li $a0, 0xFFFFFFFF
beq $a0, $0, else_90

li $a0, 3
jal _print_int        # system call code for print_int 


b end_if_91

else_90:
li $a0, 4
jal _print_int        # system call code for print_int 


end_if_91:


end_if_87:


b end_if_85

else_84:
li $a0, 0
beq $a0, $0, else_92

li $a0, 0xFFFFFFFF
beq $a0, $0, else_94

li $a0, 5
jal _print_int        # system call code for print_int 


b end_if_95

else_94:
li $a0, 6
jal _print_int        # system call code for print_int 


end_if_95:


b end_if_93

else_92:
li $a0, 0xFFFFFFFF
beq $a0, $0, else_96

li $a0, 7
jal _print_int        # system call code for print_int 


b end_if_97

else_96:
li $a0, 8
jal _print_int        # system call code for print_int 


end_if_97:


end_if_93:


end_if_85:

li $a0, 0
beq $a0, $0, else_98

li $a0, 0xFFFFFFFF
beq $a0, $0, else_100

li $a0, 0xFFFFFFFF
beq $a0, $0, else_102

li $a0, 1
jal _print_int        # system call code for print_int 


b end_if_103

else_102:
li $a0, 2
jal _print_int        # system call code for print_int 


end_if_103:


b end_if_101

else_100:
li $a0, 0xFFFFFFFF
beq $a0, $0, else_104

li $a0, 3
jal _print_int        # system call code for print_int 


b end_if_105

else_104:
li $a0, 4
jal _print_int        # system call code for print_int 


end_if_105:


end_if_101:


b end_if_99

else_98:
li $a0, 0
beq $a0, $0, else_106

li $a0, 0xFFFFFFFF
beq $a0, $0, else_108

li $a0, 5
jal _print_int        # system call code for print_int 


b end_if_109

else_108:
li $a0, 6
jal _print_int        # system call code for print_int 


end_if_109:


b end_if_107

else_106:
li $a0, 0
beq $a0, $0, else_110

li $a0, 7
jal _print_int        # system call code for print_int 


b end_if_111

else_110:
li $a0, 8
jal _print_int        # system call code for print_int 


end_if_111:


end_if_107:


end_if_99:

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

