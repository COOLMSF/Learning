package com.company;

public class Animal implements Creature {
    private String  name;
    private Integer age;

    Animal() {
        this.age = 0;
        this.name = "unknown";
    }

    Animal(String name, Integer age) {
        this.age = age;
        this.name = name;
    }

    Animal(Integer age, String name) {
        this.age = age;
        this.name = name;
    }

    @Override
    public Integer getAge() {
        return this.age;
    }

    @Override
    public String getName() {
       return this.name;
    }

    @Override
    public void makeSound() {
        System.out.println("I am making sound");
    }

    @Override
    public void move() {
        System.out.println("I am moving");
    }

    @Override
    public void setAge(Integer age) {
        this.age = age;
    }

    @Override
    public void setName(String name) {
       this.name = name;
    }

    @Override
    public String toString() {
        return this.name + ':' + this.age;
    }
}
