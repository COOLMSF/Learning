package com.company;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;

/*
 * I think Factor should be an interface named Factorale rather than a class.
 */

public class Factor {
    ArrayList<Integer> getFactor(int number) {

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

        return arrayList.isEmpty() ? null : arrayList;
    }
}
