package com.company;

import java.lang.reflect.Array;
import java.util.Arrays;

public class Main {

    public static <T> void main(String[] args) {
        int[][][] a = new int[3][2][4];

        System.out.println(a[2][1].length);
    }
}