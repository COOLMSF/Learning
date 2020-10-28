package com.company;
import java.lang.reflect.Array;
import java.net.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        var a = new Factor(100);

        a.getFactor().forEach(System.out::println);
    }
}