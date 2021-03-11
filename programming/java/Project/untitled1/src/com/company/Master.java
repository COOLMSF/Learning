package com.company;

public class Master {
    public void playDisk(Pet pet) {
        pet.setHealth(pet.getHealth() - 10);
        pet.setLove(pet.getLove() + 5);
    }

    public void swim(Pet pet) {
        pet.setHealth(pet.getHealth() - 10);
        pet.setLove(pet.getLove() + 5);
    }
}
