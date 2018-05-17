package visitor;

import syntaxtree.*;

import java.io.PrintWriter;

public class CodeGenVisitor extends DepthFirstVisitor {
    static int labelId = 0;
    static Class currClass;
    static Method currMethod;
    static SymbolTable symbolTable;
    PrintWriter out;

    public CodeGenVisitor(SymbolTable s, PrintWriter out) {
        symbolTable = s;
        this.out = out;
    }

    // MainClass m;
    // ClassDeclList cl;
    public void visit(Program n) {
        // Data segment
        out.println(
                ".data\n" +
                        "newline: .asciiz \"\\n\"\n" +    // to be used by cgen for "System.out.println()"
                        "msg_index_out_of_bound_exception: .asciiz \"Index out of bound exception\\n\"\n" +
                        "msg_null_pointer_exception: .asciiz \"Null pointer exception\\n\"\n" +
                        "\n" +
                        ".text\n"
        );

        n.m.accept(this);

        out.println(  // Code to terminate the program
                "# exit\n" +
                        "li $v0, 10\n" +
                        "syscall\n"
        );

        // Code for all methods
        for (int i = 0; i < n.cl.size(); i++) {
            n.cl.elementAt(i).accept(this);
        }

        // Code for some utility functions
        cgen_supporting_functions();
    }

    // Identifier i1,i2;
    // VarDeclList vl;
    // Statement s;
    public void visit(MainClass n) {
        String i1 = n.i1.toString();
        currClass = symbolTable.getClass(i1);
        currMethod = currClass.getMethod("main");   // This is a hack (treat main() as instance method.)

        // Can ignore the parameter of main()

        // Info about local variables are kept in "currMethod"

        // Generate code to reserve space for local variables in stack
        // Optionally, generate code to reserve space for temps
        out.println("move $fp, $sp");


        int totalOffset = currMethod.vars.entrySet().size() * 4 + currMethod.params.size() * 4;
        out.println("addiu $sp, $sp, " + -totalOffset);
        out.println();

        n.s.accept(this);
    }

    // Identifier i;
    // VarDeclList vl;
    // MethodDeclList ml;
    public void visit(ClassDeclSimple n) {
    }

    // Type t;
    // Identifier i;
    // FormalList fl;
    // VarDeclList vl;
    // StatementList sl;
    // Exp e;
    // cgen: t i(fl) { vl sl return e; }
    public void visit(MethodDecl n) {
    }

    // Exp e;
    // Statement s1,s2;
    // cgen: if (e) s1 else s2
    public void visit(If n) {
        String elseLabelSuffix = "_" + labelId++;
        String endIfLabelSuffix = "_" + labelId++;

        n.e.accept(this);
        out.println("beq $a0, $0, else" + elseLabelSuffix);
        out.println();

        n.s1.accept(this);
        out.println();

        out.println("b end_if" + endIfLabelSuffix);
        out.println();

        out.println("else" + elseLabelSuffix + ":");
        n.s2.accept(this);
        out.println();

        out.println("end_if" + endIfLabelSuffix + ":");
        out.println();


    }

    // Exp e;
    // Statement s;
    // cgen: while (e) s;
    public void visit(While n) {
        String whileStartLabelSuffix = "_" + labelId++;
        String whileEndLabelSuffix = "_" + labelId++;

        out.println("while_start" + whileStartLabelSuffix + ":");

        n.e.accept(this);

        out.println("beq $a0, $0, while_end" + whileEndLabelSuffix);
        out.println();

        n.s.accept(this);
        out.println();

        out.println("b while_start" + whileStartLabelSuffix);
        out.println();


        out.println("while_end" + whileEndLabelSuffix + ":");
        out.println();
    }

    // Exp e;
    // cgen: System.out.println(e)
    public void visit(Print n) {
        n.e.accept(this);
        out.println(
                "jal _print_int        # system call code for print_int "
        );
        out.println();
    }

    // Identifier i;
    // Exp e;
    // cgen: i = e
    public void visit(Assign n) {
        n.e.accept(this);
        Variable var = null;
        if (null != (var = currMethod.getVar(n.i.s))) {
            out.println("sw $a0, " + var.offset * 4 + "($fp)");
        } else if (null != (var = currMethod.getParam(n.i.s))) {
            out.println("sw $a0, " + var.offset * 4 + "($fp)");
        } else if (null != (var = currClass.getVar(n.i.s))) {
            out.println("sw $a0, " + var.offset * 4 + "($fp)");
        }
    }

    // Identifier i;
    // Exp e1,e2;
    // cgen: i[e1] = e2
    public void visit(ArrayAssign n) {
        out.println("#start ArrayAssign");

        out.println("#start ArrayAssign e1");

        n.e1.accept(this);
        out.println("sll $a0, $a0, 2");
//        out.println("move $s0, $a0");
        out.println("sw $a0, 0($sp)\t  # push value of e1 to stack\n" +
                "addiu $sp, $sp, -4");

        out.println("#end ArrayAssign e1");

        out.println("#start ArrayAssign i");

//        n.i.accept(this);
        Variable var;
        if (null != (var = currMethod.getVar(n.i.s))) {
            out.println("lw $a0, " + var.offset * 4 + "($fp)");
        } else if (null != (var = currMethod.getParam(n.i.s))) {
            out.println("lw $a0, " + var.offset * 4 + "($fp)");
        } else if (null != (var = currClass.getVar(n.i.s))) {
            out.println("lw $a0, " + var.offset * 4 + "($fp)");
        }

        out.println("addiu $a0, $a0, 4");
//        out.println("add $a0, $a0, $s0");
        out.println("lw $t1, 4($sp)\t  # $t1 = stack top\n" +
                "add $a0, $t1, $a0\t  # $a0 = $a0 + stack top\n" +
                "addiu $sp, $sp, 4\t  # pop"
        );
//        out.println("move $s0, $a0");
        out.println("sw $a0, 0($sp)\t  # push value of e1 to stack\n" +
                "addiu $sp, $sp, -4");
        out.println("#end ArrayAssign i");

        out.println("#start ArrayAssign e2");

        n.e2.accept(this);
        out.println("lw $t1, 4($sp)\t  # $t1 = stack top\n" +
                "addiu $sp, $sp, 4\t  # pop"
        );
        out.println("sw $a0, 0($t1)");
        out.println("#end ArrayAssign e2");

        out.println("#end ArrayAssign");

    }

    // Exp e1,e2;
    // cgen: e1 && e2
    public void visit(And n) {
        n.e1.accept(this);
        out.println("sw $a0, 0($sp)\t  # push value of e1 to stack\n" +
                "addiu $sp, $sp, -4");
        n.e2.accept(this);
        out.println("lw $t1, 4($sp)\t  # $t1 = stack top\n" +
                "and $a0, $t1, $a0\t  # $a0 = $a0 + stack top\n" +
                "addiu $sp, $sp, 4\t  # pop"
        );
        out.println();
    }

    // Exp e1,e2;
    // cgen: e1 < e2
    public void visit(LessThan n) {
        n.e1.accept(this);
        out.println("sw $a0, 0($sp)\t  # push value of e1 to stack\n" +
                "addiu $sp, $sp, -4");
        n.e2.accept(this);
        out.println("lw $t1, 4($sp)\t  # $t1 = stack top\n" +
                "slt $a0, $t1, $a0\t  # $a0 = $a0 + stack top\n" +
                "addiu $sp, $sp, 4\t  # pop"
        );
        out.println();
    }

    // Exp e1,e2;
    // cgen: e1 + e2
    public void visit(Plus n) {
        n.e1.accept(this);
        out.println("sw $a0, 0($sp)\t  # push value of e1 to stack\n" +
                "addiu $sp, $sp, -4");
        n.e2.accept(this);
        out.println("lw $t1, 4($sp)\t  # $t1 = stack top\n" +
                "add $a0, $t1, $a0\t  # $a0 = $a0 + stack top\n" +
                "addiu $sp, $sp, 4\t  # pop"
        );
        out.println();

    }

    // Exp e1,e2;
    // cgen: e1 - e2
    public void visit(Minus n) {
        n.e1.accept(this);
        out.println("sw $a0, 0($sp)\t  # push value of e1 to stack\n" +
                "addiu $sp, $sp, -4");
        n.e2.accept(this);
        out.println("lw $t1, 4($sp)\t  # $t1 = stack top\n" +
                "sub $a0, $t1, $a0\t  # $a0 = $a0 + stack top\n" +
                "addiu $sp, $sp, 4\t  # pop"
        );
        out.println();
    }

    // Exp e1,e2;
    // cgen: e1 * e2
    public void visit(Times n) {
        n.e1.accept(this);
        out.println("sw $a0, 0($sp)\t  # push value of e1 to stack\n" +
                "addiu $sp, $sp, -4");
        n.e2.accept(this);
        out.println("lw $t1, 4($sp)\t  # $t1 = stack top\n" +
                "mult $t1, $a0\t  # $a0 = $a0 + stack top\n" +
                "mflo $a0 \t  # Moves the value from the LO part of the result register into $a0.\n" +
                "addiu $sp, $sp, 4\t  # pop"
        );
        out.println();
    }

    // Exp e1,e2;
    // cgen: e1[e2]
    public void visit(ArrayLookup n) {
        n.e2.accept(this);
        out.println("sll $a0, $a0, 2");
//        out.println("move $s0, $a0");
        out.println("sw $a0, 0($sp)\t  # push value of e1 to stack\n" +
                "addiu $sp, $sp, -4");

        n.e1.accept(this);
        out.println("addiu $a0, $a0, 4");
        //        out.println("add $a0, $a0, $s0");
        out.println("lw $t1, 4($sp)\t  # $t1 = stack top\n" +
                "add $a0, $t1, $a0\t  # $a0 = $a0 + stack top\n" +
                "addiu $sp, $sp, 4\t  # pop"
        );
        out.println("lw $a0, 0($a0)");

    }

    // Exp e;
    // cgen: e.length
    public void visit(ArrayLength n) {
        n.e.accept(this);
        out.println("lw $a0, 0($a0)");
    }

    // Exp e;
    // Identifier i;
    // ExpList el;
    // cgen: e.i(el)
    public void visit(Call n) {
    }

    // Exp e;
    // cgen: new int [e]
    public void visit(NewArray n) {
        n.e.accept(this);
        out.println("jal _alloc_int_array");
        out.println("move $a0, $v0");

    }

    // Identifier i;
    // cgen: new n
    public void visit(NewObject n) {
    }

    // Exp e;
    // cgen: !e
    public void visit(Not n) {
        n.e.accept(this);

        out.println(
                "nor $a0, $a0, $a0 \t #not $a0"
        );
        out.println();
    }

    // cgen: this
    public void visit(This n) {
    }

    // int i;
    // cgen: Load immediate the value of n.i
    public void visit(IntegerLiteral n) {
        out.println("li $a0, " + n.i);
    }

    // cgen: Load immeidate the value of "true"
    public void visit(True n) {
        out.println("li $a0, 0xFFFFFFFF");

    }

    // cgen: Load immeidate the value of "false"
    public void visit(False n) {
        out.println("li $a0, 0");

    }

    // String s;
    // cgen: Load the value of the variable n.s (which can be a local variable, parameter, or field)
    public void visit(IdentifierExp n) {
        Variable var;
        if (null != (var = currMethod.getVar(n.s))) {
            out.println("lw $a0, " + var.offset * 4 + "($fp)");
        } else if (null != (var = currMethod.getParam(n.s))) {
            out.println("lw $a0, " + var.offset * 4 + "($fp)");
        } else if (null != (var = currClass.getVar(n.s))) {
            out.println("lw $a0, " + var.offset * 4 + "($fp)");
        }
    }

    void cgen_supporting_functions() {
        out.println(
                "_print_int: # System.out.println(int)\n" +
                        "li $v0, 1\n" +
                        "syscall\n" +
                        "la $a0, newline\n" +
                        "li $a1, 1\n" +
                        "li $v0, 4   # print newline\n" +
                        "syscall\n" +
                        "jr $ra\n"
        );

        out.println(
                "_null_pointer_exception:\n" +
                        "la $a0, msg_null_pointer_exception\n" +
                        "li $a1, 23\n" +
                        "li $v0, 4\n" +
                        "syscall\n" +
                        "li $v0, 10\n" +
                        "syscall\n"
        );

        out.println(
                "_array_index_out_of_bound_exception:\n" +
                        "la $a0, msg_index_out_of_bound_exception\n" +
                        "li $a1, 29\n" +
                        "li $v0, 4\n" +
                        "syscall\n" +
                        "li $v0, 10\n" +
                        "syscall\n"
        );

        out.println(
                "_alloc_int_array: # new int [$a0]\n" +
                        "addi $a2, $a0, 0  # Save length in $a2\n" +
                        "addi $a0, $a0, 1  # One more word to store the length\n" +
                        "sll $a0, $a0, 2   # multiple by 4 bytes\n" +
                        "li $v0, 9         # allocate space\n" +
                        "syscall\n" +
                        "\n" +
                        "sw $a2, 0($v0)    # Store array length\n" +
                        "addi $t1, $v0, 4  # begin address = ($v0 + 4); address of the first element\n" +
                        "add $t2, $v0, $a0 # loop until ($v0 + 4*(length+1)), the address after the last element\n" +
                        "\n" +
                        "_alloc_int_array_loop:\n" +
                        "beq $t1, $t2, _alloc_int_array_loop_end\n" +
                        "sw $0, 0($t1)\n" +
                        "addi $t1, $t1, 4\n" +
                        "j _alloc_int_array_loop\n" +
                        "_alloc_int_array_loop_end:\n" +
                        "\n" +
                        "jr $ra\n"
        );
    }
}

