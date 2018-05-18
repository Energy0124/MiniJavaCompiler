package visitor;

import syntaxtree.*;

public interface TypeVisitor {
    Type visit(Program n);

    Type visit(MainClass n);

    Type visit(ClassDeclSimple n);

    Type visit(ClassDeclExtends n);

    Type visit(VarDecl n);

    Type visit(MethodDecl n);

    Type visit(Formal n);

    Type visit(IntArrayType n);

    Type visit(BooleanType n);

    Type visit(IntegerType n);

    Type visit(IdentifierType n);

    Type visit(Block n);

    Type visit(If n);

    Type visit(While n);

    Type visit(Print n);

    Type visit(Assign n);

    Type visit(ArrayAssign n);

    Type visit(And n);

    Type visit(LessThan n);

    Type visit(Plus n);

    Type visit(Minus n);

    Type visit(Times n);

    Type visit(ArrayLookup n);

    Type visit(ArrayLength n);

    Type visit(Call n);

    Type visit(IntegerLiteral n);

    Type visit(True n);

    Type visit(False n);

    Type visit(IdentifierExp n);

    Type visit(This n);

    Type visit(NewArray n);

    Type visit(NewObject n);

    Type visit(Not n);

    Type visit(Identifier n);
}
