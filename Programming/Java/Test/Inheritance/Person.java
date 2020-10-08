package Inheritance;

public class Person extends Animal {
    public Person() {
        super();
    }

    public Person(String name, int age) {
        super(name, age);
    }

    String getName(String name) {
        String aName;

        aName = "Person:" + name;

        return aName;
    }
}