package com.company;

public class Pet {
    private String name;
    private int health;
    private int love;

    Pet(String name, int health, int love) {
        this.name = name;
        this.health = health;
        this.love = love;
    }

    public void print() {
        System.out.println("chonudezibai");
        System.out.println("Pet name " + name + ", my health is " + health + " love is " + love);
    }

    public String getName() {
        return name;
    }

    public int getLove() {
        return love;
    }

    public int getHealth() {
        return health;
    }

    public void setHealth(int health) {
        this.health = health;
    }

    public void setLove(int love) {
        this.love = love;
    }
}
