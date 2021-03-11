package Inheritance;

public class Test {
    public static void main(String[] args) {
        Person aPerson = new Person("coolder", 22);

        aPerson.getName("Hello");
        System.out.println(aPerson.getName());
    }
}
