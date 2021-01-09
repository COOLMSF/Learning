package com.company;

public class Main {

    public static void main(String[] args) {
        var a = new Cel2Far();

        for (int i = 0; i < 250; i++) {
            System.out.println(a.getFar((double)i));
        }
    }
}
