package com.company;

import java.util.ArrayList;
import java.util.Collection;
import java.util.concurrent.atomic.AtomicInteger;

public class Main {
    public static void main(String[] args) {
        var a = new AtomicInteger();
        a.set(100);

        System.out.println(a);
    }
}