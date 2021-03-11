package com.company;

public class OverRide extends Animal{
    @Override
    public String toString() {
        return super.toString() + "I have override it";
    }

    OverRide(String name, Integer age) {
        super(name, age);
    }

    OverRide(Integer age, String name) {
        super(name, age);
    }
}
