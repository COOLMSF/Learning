package com.company;

public class GenericClass<T> implements Printable {
    private T name;
    private T data;

    GenericClass(T data) {
        this.data = data;
    }

    T returnData() {
        return this.data;
    }

    @Override
    public void printMessage(Object str) {
    }
}
