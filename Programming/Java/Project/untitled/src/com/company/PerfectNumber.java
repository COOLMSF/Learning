package com.company;

import java.util.ArrayList;

public class PerfectNumber extends TrueFactor {

    boolean isPerfectNumber(int number) {
        int sum = 0;

        ArrayList<Integer> arrayList = super.getTrueFactor(number);

        for (int i :
                arrayList) {
            sum += i;
        }

        return sum == number;
    }

    ArrayList<Integer> findPerfectNumber(int start, int end) {

        ArrayList<Integer> arrayList = new ArrayList<>();

        for (int i = start; i < end; i++) {
            if (isPerfectNumber(i)) {
                arrayList.add(i);
            }
        }

        return arrayList.isEmpty() ? null : arrayList;
    }
}
