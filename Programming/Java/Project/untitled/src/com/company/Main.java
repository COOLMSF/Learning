package com.company;
import java.lang.reflect.Array;
import java.net.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        int intBits = Float.floatToIntBits((float)1.0);
        String binaryStr = Integer.toBinaryString(intBits);
        System.out.println(binaryStr);
    }
}