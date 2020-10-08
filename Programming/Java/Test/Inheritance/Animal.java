package Inheritance;

public class Animal {
    private int age;
    private String name;

    public Animal() {
        this.age = 0;
        this.name = "";
    }

    public Animal(String name, int age) {
        this.age = age;
        this.name = name;
    }

    public String getName() {
        return this.name;
    }

    public int getAge() {
        return this.age;
    }

    public void modifyName(String new_name) {
        this.name = new_name;
    }

    public void modifyAge(int new_age) {
        this.age = new_age;
    }
}