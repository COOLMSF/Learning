package com.company;

public class Main {

    static {
        System.loadLibrary("HelloWorld");
    }

    public native void print();

    public static void main(String[] args) {
        new Main().print();
    }

}