package com.company;

public interface Creature {
    void setAge(Integer age);
    void setName(String name);
    String getName();
    Integer getAge();

    void move();
    void makeSound();

    String toString();
}
