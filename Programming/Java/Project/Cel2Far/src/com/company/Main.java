package com.company;
import java.lang.Math;
import java.util.Scanner;

public class Main {

    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);

        scanner.next();
        int u = scanner.nextInt();
        var a = new Cel2Far();
        boolean boo = true;

        for (int i = 0; i < 250; i++) {
            System.out.println(a.getFar((double)i));
        }
    }
}
