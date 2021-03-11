package com.company;

public class Animal {
    private int age;
    private String name;
    private boolean a_person = false;

    Animal() {
        this.setName("noname");
        this.setAge(0);
    }

    Animal(String name, int age) {
        this.setAge(age);
        this.setName(name);
    }

    void setName(String name) {
        this.name = name;
    }

    void setAge(int age) {
        this.age = age;
    }

    String getName() {
        return this.name;
    }

    int getAge() {
        return this.age;
    }

    void modifyName(String new_name) {
        this.name = new_name;
    }

    void animalMethod() {
        System.out.println("This is only animal method");
    }

    void modifyAge(int new_age) {
        this.age = new_age;
    }

    void theSameMethod() {
        System.out.println("I have a method");
    }

    Boolean isPerson() {
        return a_person;
    }

    void setPersonTrue() {
        a_person = true;
    }

    void setPersonFalse() {
        a_person = false;
    }
}