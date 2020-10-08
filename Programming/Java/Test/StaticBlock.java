public class StaticBlock {
    public static void main(String[] args) {
        for(int i = 0; i < 10; i++) {
            System.out.println("Hello, me");
        }

        var a = new AnotherClass();
        a.printMessage();

        var b = new AnotherClass();
        b.printMessage();
    }
}

class AnotherClass {
    static {
        System.out.println("Only call once");
    }

    void printMessage() {
        System.out.println("printMessage called");
    }
}
