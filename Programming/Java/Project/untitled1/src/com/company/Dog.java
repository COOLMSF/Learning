package com.company;

public class Dog extends Pet {
    private String strain;

    Dog(String name, int health, int love, String strain) {
        super(name, health, love);
        this.strain = strain;
    }

    public String getStrain() {
        return strain;
    }
}
