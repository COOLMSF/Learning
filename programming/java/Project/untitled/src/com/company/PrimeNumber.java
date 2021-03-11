package com.company;

import java.util.ArrayList;

public class PrimeNumber {

    long a, b;

    boolean isPrimeNumber(long number) {
        for (int i = 2; i < Math.sqrt(number) + 1; i++) {
            if (number % i == 0) {
                return false;
            }
        }
        return true;
    }

    void becauseOf() {
        System.out.printf("%d %% %d == 0", a, b);
    }

    ArrayList<Integer> findPrimeNumber(int start, int end) {
        var primeNumberList = new ArrayList<Integer>();
        for (int i = start; i < end; i++) {
            if (this.isPrimeNumber(i)) {
                primeNumberList.add(i);
            }
        }

        if (primeNumberList.isEmpty()) {
            return null;
        } else {
            return primeNumberList;
        }
    }
}