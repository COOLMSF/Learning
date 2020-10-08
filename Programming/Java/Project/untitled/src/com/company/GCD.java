package com.company;

import org.jetbrains.annotations.NotNull;

import java.util.*;

public class GCD extends Factor {
    private int gcd = 1;

    int getGCD(int a, int b) {

        // Get factors
        List<Integer> factorsOfA = super.getFactor(a);
        List<Integer> factorsOfB = super.getFactor(b);

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

}
