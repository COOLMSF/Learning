package com.company;

import org.jetbrains.annotations.NotNull;

import java.util.*;

public class GCD implements Factorable {
    private int gcd = 1;
    private int number;

    GCD(int number) {
        this.number = number;
    }

    int getGCD(int a, int b) {

        // Get factors
        List<Integer> factorsOfA = getFactor();
        List<Integer> factorsOfB = getFactor();

        // Get bingji, sorry for my english, _^_^_
        List<Integer> bingji;
        bingji = factorsOfA;
        bingji.retainAll(factorsOfB);

        // Compute gcd
        for (Integer i :
                bingji) {
            gcd *= i;
        }

        return gcd;
    }

    public ArrayList<Integer> getFactor() {

        var arrayList = new ArrayList<Integer>();

        // 1 is always the factor
        arrayList.add(1);

        for (int i = 2; i <= number;) {
            if (number % i == 0) {
                arrayList.add(i);
                number /= i;
            }
            else i++;
        }

        return arrayList;
    }

}
