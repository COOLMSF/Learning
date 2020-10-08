package com.company;

import java.util.ArrayList;
import java.util.List;

public class TrueFactor {
    ArrayList<Integer> getTrueFactor(int number) {
        var trueFactorList = new ArrayList<Integer>();

        for (int i = 1; i < number; i++) {
            if (number % i == 0) {
                trueFactorList.add(i);
            }
        }

        return  trueFactorList;
    }
}
