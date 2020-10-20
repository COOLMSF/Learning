package com.company;

public abstract class Person {
    private String name;
    private int age;
    private String gender;

    // Constructor for no argument
    Person() {
        this.age = 0;
        this.name = "unknown";
        this.gender = "unknown";
    }

    Person(String name, String gender, int age) {
        this.name = name;
        this.gender = gender;
        this.age = age;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public int getAge() {
        return age;
    }

    public String getGender() {
        return gender;
    }

    public String getName() {
        return name;
    }
}