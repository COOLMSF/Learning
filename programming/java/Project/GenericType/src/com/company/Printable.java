package com.company;

public interface Printable<T> {
    default T returnSomething(T sth) {
        return sth;
    }
    void printMessage(T str);
}
