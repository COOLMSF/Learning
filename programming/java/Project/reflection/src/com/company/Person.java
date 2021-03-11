package com.company;

import java.util.Objects;

public class Person {
    private String name;
    private Integer age;

    // Constructor for no argument
    Person() {
        name = "unknown";
        age = 0;
    }

    Person(Integer age, String name) {
        this.name = name;
        this.age = age;
    }

    void setName(String name) {
        this.name = name;
    }

    void setAge(Integer age) {
        this.age = age;
    }

    String getName() {
        return this.name;
    }

    int getAge() {
        return this.age;
    }


    @Override
    public String toString() {
        return "Person{" +
                "name='" + name + '\'' +
                ", age=" + age +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Person person = (Person) o;

        if (!name.equals(person.name)) return false;
        return age.equals(person.age);
    }

    @Override
    public int hashCode() {
        int result = name.hashCode();
        result = 31 * result + age.hashCode();
        return result;
    }
}
