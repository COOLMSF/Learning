package com.company;

public class Penguin extends Pet {
    private String sex;

    Penguin(String name, int health, int love, String sex) {
        super(name, health, love);
        this.sex = sex;
    }

    public String getSex() {
        return sex;
    }
}
