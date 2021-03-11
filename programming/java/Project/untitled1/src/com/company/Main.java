package com.company;

public class Main {
    public static void main(String[] args) {
        var ouou = new Dog("ouou", 100, 0, "xueruina");
        var nannan = new Penguin("nannan", 100, 0, "Qmei");

        System.out.println("Befor play with them");

        ouou.print();
        nannan.print();

        System.out.println("After play with them");

        var master = new Master();

        master.playDisk(ouou);
        ouou.print();

        master.swim(nannan);
        nannan.print();
    }
}
