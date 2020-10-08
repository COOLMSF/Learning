package com.company;

import java.lang.reflect.Array;
import java.lang.Comparable;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.StreamSupport;

public class Main {
    public static void main(String[] args) {
        var a = new OverRide("coolder", 22);

        System.out.println(a.toString());
    }
}
//interface Drawable{  public void print(); }
//
//public class Main {
//    public static void main(String[] args) {
//
//        //with lambda
//        Drawable d2=()-> {
//            System.out.println("Drawing ");
//        };
//        d2.print();
//    }
//}