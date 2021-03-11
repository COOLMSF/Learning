public class TestClass {
    public static void main(String[] args) {
        System.out.println("Hello, I'm main function.");

        System.out.println("Emm, I am now call another function.");
        int result = sum(1, 3);
        System.out.println("Haha, I have called a awesome function, what about you?");
        System.out.printf("I will never tell you that the result is %d\n", result);
    }

    private static int sum(int num1, int num2) {
        return num1 + num2;
    }
}
