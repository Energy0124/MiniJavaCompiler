import syntaxtree.*;
import visitor.*;
import myparser.*;
import java.io.*;

public class Main {
   public static void main(String [] args) {
      if(args.length >= 1) {
          try {
              System.setIn(new FileInputStream(args[0]));
          } catch (FileNotFoundException e) {
              e.printStackTrace();
          }
      }
      try {
         Program root = new MiniJavaParser(System.in).Goal();

	 // Build the symbol table
	 BuildSymbolTableVisitor buildSymTab = new BuildSymbolTableVisitor();
         root.accept(buildSymTab);

	 // Type check
	 TypeCheckVisitor typeCheck =
             new TypeCheckVisitor(buildSymTab.getSymTab());
         root.accept(typeCheck);

         PrintWriter out = new PrintWriter(System.out);
         if (args.length >= 2)
           out = new PrintWriter(new BufferedWriter(new FileWriter(args[1])));

         CodeGenVisitor cgen = new CodeGenVisitor(buildSymTab.getSymTab(), out);

         root.accept(cgen);

         out.close();
      }
      catch (ParseException e) {
         System.out.println(e.toString());
      }
      catch (IOException e) {
         System.out.println(e.toString());
      }
   }
}
