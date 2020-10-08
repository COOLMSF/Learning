package com.company;

import org.jetbrains.annotations.NotNull;

import java.util.ArrayList;

public class NarcissisticNumber {
    
    final int NarcissisticNumberConstant = 3;

    boolean isNarcissisticNumber(@NotNull Integer number) {
        int originalNumber = number;
        int sum = 0;
        int i = 0 ;

        // Length not acceptable
        if (number.toString().length() != NarcissisticNumberConstant) {
            return false;
        }

        // Assume the number is 123;
        for (int length = number.toString().length() - 1; length >= 0; length--) {

            // Find 1 of 123
            i = number / (int) Math.pow(10, length);
            
            // Compute Narci number
            // sum += 1**3;
            //sum += Math.pow(i, 3);
            sum += Math.pow(i, NarcissisticNumberConstant);
            
            // Get left number value
            // number = 123 - 1 * pow(10, 2);
            number -= i * (int) Math.pow(10, length);
        }
        return sum == originalNumber;
    }
    
    ArrayList<Integer> findNarcissisticNumber(int start, int end) {
        var arrayList = new ArrayList<Integer>();

        for (int i = start; i < end; i++) {
            if (isNarcissisticNumber(i))
                arrayList.add(i);
        }

        return arrayList.isEmpty() ? null : arrayList;
    }
}