package com.company;

public class Main {
    public static void main(String[] args) {
        Test a = new Test();
        Test b = (Test)new TestA();

        a.print();
        b.print();
    }
}
