// Test
//  Multiple classes with fields and this
class test28 {
    public static void main(String[] args) {
        Foo8 foo;
        Bar8 bar;
        int dummy;
        {
            foo = new Foo8();
            bar = new Bar8();

            dummy = foo.init(1000, 2000);
            dummy = foo.f();
            dummy = foo.f();
            dummy = foo.g();
            dummy = foo.g();
            dummy = bar.setFoo(foo);
            System.out.println(bar.f());
            System.out.println(bar.g());
        }
    }
}

class Foo8 {
    int x;
    int y;

    public int init(int _x, int _y) {
        int temp;
        temp = this.setX(_x);
        temp = this.setY(_y);
        return 0;
    }

    public int f() {
        x = x + 1;
        return 0;
    }

    public int g() {
        y = y + 10;
        return 0;
    }

    public int setX(int _x) {
        x = _x;
        return 0;

    }

    public int setY(int _y) {
        y = _y;
        return 0;

    }

    public int getX() {
        return x;
    }

    public int getY() {
        return y;
    }

}

class Bar8 {
    Foo8 foo;

    public int setFoo(Foo8 _foo) {
        foo = _foo;
        return 0;
    }

    public int f() {
        int dummy;
        dummy = foo.f();
        return foo.getX();
    }

    public int g() {
        int dummy;
        dummy = foo.g();
        return foo.getY();
    }
}

