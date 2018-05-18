MiniJava (Variant) Compiler
By Ling Leong
SID: 1155062557
For CSCI3120 Programming Assignment #4

a.	Instructions to run your programs. (if your programs need to be executed in some specific way)
    The makefile is same as the default one, so the build instruction is the same. Just type "make" to build the project.

b.	The assumptions you make, if any.
    The same assumptions as mentioned by others in piazza.

c.	Describe which cases (1-15, 16) your program can and cannot handles.
    My program can handle case 1 - 15, but cannot handles case 16.

d.	Acknowledgement of third party code, files, and library
    The official template

e.	Any additional information that could help us understand your implementation.


----------------------------------------------------------
Below is the original readme from the template
----------------------------------------------------------

Update: May 3
  - Fix a bug in the ArrayLookup() production in minijava.jj.
  - Fix a bug in the PrimaryExpressionWithSuffix in minijava.jj.
  - Added a visitor method in CodeGenerator.java for ClassDeclSimple.
  - Added few more test cases for testing arrays, objects, and methods.

Update: May 2
  - Fix a major bug in the MIPS code (in CodeGenVisitor.java) for allocating
    array ("_alloc_int_array").

  - Fix a bug with the Not operator in minijava.jj to properly enforce
    operator precedence.

  - Rewrite PrimaryExpressionWithSuffix() in minijava.jj to improve performance.

  - Added many test cases in folder /test.

  - Included also the Mars4_5.jar in the folder /test.

  - Added a Makefile in /test to help testing the correctness of your
    code generator.


----------------------------------------------------------------------------------
Main.java:
  1) Use visitor/BuildSymbolTableVisitor to build a symbol table
  2) Use visitor/TypeCheckVisitor to perform type check
  3) Use visitor/CodeGenVisitor to generate MIPS code

MainPrettyPrint.java:
  Use visitor/PrettyPrintVisitor to reproduce the source
  (to help verify correctness of AST).

visitor/CodeGenVisitor.java:
  Added to support code generation (MiniJava to MIPS)
  Able to generate the initial "skeleton" of the program

  [Updated on 2 May]:
  - Fix a bug in the MIPS code for allocating array ("_alloc_int_array:") in
    which the size of the allocated space was assigned to $a1 instead of $a0.

  - Included also the visitor methods for This, IntegerLiteral, True, False, IdentifierExp.

  [Updated on 3 May]
  - Included the visitor method for ClassDeclSimple

test/:
  Contain some test cases

input/:
  Contain some valid MiniJava source files (for more comprehensive testing)


Files that are modified:
------------------------
minijava.jj:
  Modified to allow declaration of local variables in "public static void main()"

  [Updated on 2 May]:
   - Rewrote PrimaryExpressionWithSuffix() to improve performance (less lookhead).
     ArrayLookup(), ArrayLength(), and MessageSend() were modified to accomodate the
     change. The resulting AST is still the same.

   - Fix a bug in NotExpression() to properly enforce the precedence of the Not operator.
       Before: NotExpression() ::= "!" Expression()
       After: NotExpression() ::= "!" PrimaryExpression()

  [Updated on 3 May]:
  - Fix a bug in ArrayLookup().
     Before: ArrayLookup() ::= "[" PrimeExpression() "]"
     After: ArrayLookup() ::= "[" Expression() "]"

  - Fix a bug in PrimaryExpressionWithSuffix().
    Now "." and "[]" are treated as operators with highest precedence so that
    the following expressions are accepted

      x.f1().f2().f3()
      x.f4()[10]
      x.f4().length


syntaxtree/MainClass.java:
  Modified to include "VarDeclList" (for local variables declared in main().

visitor/BuildSymbolTableVisitor.java:
  Modified to add "main()" as an INSTANCE method to the main class (a hack).
  Declared local variables are attached to the main() method.

visitor/DepthFirstVisitor.java:
visitor/TypeDepthFirstVisitor.java:
  (Both) Modified to also visit the local variables declared in main()

visitor/PrettyPrintVisitor.java:
  Modified to also visit the local variables declared in main()

visitor/TypeCheckExpVisitor.java:
  Fixed some error messages

visitor/TypeCheckVisitor.java:
  Modified to also visit the local variables declared in main()
  Fixed a bug (visit(ArrayAssign))



Note:
Most of Java source files in visitor/ and syntaxtree/ were originally obtained from
http://www.cambridge.org/resources/052182060X/

minijava.jj was originally obtained from
http://www.cambridge.org/resources/052182060X/lecturers/default.htm


