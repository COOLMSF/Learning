package com.company;

/*
 * This class returns the sum of this sequence,
 * if i == 3, returns 3 + 33 + 333.
 * if i == 5, returns 5 + 55 + 555 + 5555 + 5555,
 */

public class Compute {
    Long computeSum(Integer i) {
        long sum = 0L;

        for (int j = 1; j <= i; j++) {
            sum += Integer.parseInt(i.toString().repeat(j));
        }

        return sum;
    }
}
