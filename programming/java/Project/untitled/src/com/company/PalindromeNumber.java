package com.company;

import java.lang.reflect.Array;
import java.util.ArrayList;

public class PalindromeNumber {

    public <T> boolean isPalindromeNumber(T number) {
        String str = number.toString();
        int len = str.length();

        for (int i = 0; i < len/2; i++) {
            if (str.charAt(i) != str.charAt(len-1-i))
                return false;
        }
        return true;
    }

    public ArrayList<Integer> findPalindromeNumber(int start, int end) {
        var arrayList = new ArrayList<Integer>();

        for (int i = 0; i < end; i++) {
            if (isPalindromeNumber(i))
                arrayList.add(i);
        }

        return arrayList.isEmpty() ? null : arrayList;
    }

}
