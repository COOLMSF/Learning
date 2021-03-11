package com.company;

public class CallPerson {
    public static void main(String[] args) {

        // New person without parameters
        var aPerson = new Person();
        System.out.println("New person without parameters");
        System.out.println(aPerson.getName() + ':' + aPerson.getAge());

        // New person with parameters
        var aPerson1 = new Person(22, "coolder");
        System.out.println("New person with parameters");
        System.out.println(aPerson1.getName() + ':' + aPerson1.getAge());

        // Call setName and setAge
        aPerson.setAge(99);
        aPerson.setName("Cracker");
        System.out.println(aPerson.getName() + ':' + aPerson.getAge());

        // Call superclass' method
        aPerson.animalMethod();
        aPerson.theSameMethod();

        var aAnimal = new Animal();
        aAnimal.theSameMethod();

        // Do more hard stuff
        System.out.println("Note!!! I will do more hard stuff now!!!");
        var stuff = new Animal[3];
        stuff[0] = new Animal();
        stuff[1] = new Person(22, "coolder");
        stuff[2] = new Person(30, "Hacker");

        for (Animal e:
             stuff) {
            if (e.isPerson()) {
                System.out.println(e.getName() + ':' + e.getAge());
            } else {
                System.out.println("Not a person but it has the right to own a awesome name and age.");
                System.out.println(e.getName() + ':' + e.getAge());
            }
        }

    }
}