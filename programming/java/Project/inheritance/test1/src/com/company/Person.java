package com.company;

public class Person extends Animal {

    // Initialize constructor
    Person() {
        super.setAge(0);
        super.setName("noname");
        setPersonTrue();
    }

    // Initialize constructor
    Person(int age, String name) {
        super.setAge(age);
        super.setName(name);
        setPersonTrue();
    }

    // Overload getName method
    String getName() {
        return "Person:" + super.getName();
    }

    void theSameMethod() {
        System.out.println("I have the same method to my father.");
    }


}
