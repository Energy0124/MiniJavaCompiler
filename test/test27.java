// Test
//   Passing array via parameter
//   Returning an array from a method
class test27 {
  public static void main(String[] args) {
    Foo7 foo;
    int [] B;
    int i;
    {
      foo = new Foo7();
      B = new int [10];
      i = 0;
      while (i < B.length) {
        B[i] = i+1;
        i = i + 1;
      }

      System.out.println(foo.bar(B)[1]);
      System.out.println(foo.bar(B)[4]);
    }
  }
}

class Foo7 {

  public int [] bar(int [] A) {
    int i;

    i = 0;
    while (i < A.length) {
      A[i] = A[i] * 2;
      i = i + 1;
    }

    return A;
  }
}
