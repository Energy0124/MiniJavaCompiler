// Test
//   Class and method
class test24 {
    public static void main(String[] a) {
        Foo4 f;
        int b;
        {
            f = new Foo4();
            b = 5;
            b = f.m1(f.m2(1), f.m2(100));
            System.out.println(b);
        }
    }
}

class Foo4 {
    public int m1(int a, int b) {
        return a + b;
    }

    public int m2(int x) {
        int y;
        y = x + x;
        return y;
    }
}

