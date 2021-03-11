package com.company;

public class Main {

    public static void main(String[] args) {
        var a = new InnerClass();

        var b = new InnerClass.Test();
        System.out.println(a.getString());
        System.out.println(b.getString());
    }
}
