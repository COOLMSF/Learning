package com.company;

public class Main {

    public static void main(String[] args) {
        var a = new Cel2Far(100.0);

        for (int i = 0; i < 250; i++) {
            System.out.println(new Cel2Far(i).getFar());
        }
    }
}
