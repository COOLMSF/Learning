package com.company;

public class InnerClass {

    private String string = "This is outter class";

    public static class Test {
        private int a = 100;
        private String string = "This is a inner class";

        public int getA() {
            return a;
        }

        public String getString() {
            return string;
        }
    }

    public String getString() {
        return string;
    }
}
