package com.company;

public class GenericClass<T> implements Printable {
    private T name;
    private T data;
    private int i;

    GenericClass(T data) {
        this.data = data;
    }

    int getI() {
        return this.i;
    }

    T returnData() {
        return this.data;
    }

    @Override
    public void printMessage(Object str) {
    }
}
