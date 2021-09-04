import Inheritance.b.A;

public class B extends A {

    // Consturctor
    public B() {
    }

    private final String privateStringFromSubclass = "Some strings from private Subclass";

    public void printSubclass() {
        System.out.println("Hello, this is subclass");
    }

    public void printAnotherSubclass() {
        System.out.println("Hello, this is another subclass");
    }

    public void printString() {
        System.out.println(privateStringFromSubclass);
    }
}
