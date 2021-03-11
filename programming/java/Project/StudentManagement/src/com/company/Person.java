package com.company;

public abstract class Person {
    private int age;
    private String name;
    private String gender;

    Person() {
        this.age = 0;
        this.name = "unknown";
        this.gender = "unknown";
    }

    Person(int age, String name, String gender) {
        this.age = age;
        this.name = name;
        this.gender = gender;
    }

    public void setAge(int age) {
        this.age = age;
    }
    public void setName(String name) {
        this.name = name;
    }
    public void setGender(String gender) {
        this.gender = gender;
    }

    public int getAge() {
        return age;
    }
    public String getName() {
        return name;
    }
    public String getGender() {
        return gender;
    }
}