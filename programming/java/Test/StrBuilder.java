public class StrBuilder {
    public static void main(String[] args) {
        StringBuilder builder = new StringBuilder();

        builder.append("Hello, coolder.");

        System.out.print(builder.toString());

        builder.append("\nWho is the best hacker in the world.\n");

        System.out.println(builder.toString());

        System.out.println("Sizo of str is " + builder.length());
    }
}