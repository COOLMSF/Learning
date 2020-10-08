package com.company;

import javax.lang.model.element.Element;
import javax.lang.model.element.TypeElement;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Scanner;

public class Test {
    public static void main(String[] args) {
        var a = new ArrayList<>();

        a.add(1);
        a.add("123string");
        a.add(1.234);

        a.forEach(n -> { System.out.print(n);});
    }
}