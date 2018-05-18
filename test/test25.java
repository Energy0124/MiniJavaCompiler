// Test
//   Class and method
class test25 {
    public static void main(String[] _str) {
        Foo5 f;
        int a;
        int b;
        {
            f = new Foo5();
            a = f.m1().m2();
            System.out.println(a);
        }
    }
}

class Foo5 {
    public Foo5 m1() {
        return new Foo5();
    }

    public int m2() {
        System.out.println(456);
        return 1;
    }

}

