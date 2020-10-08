//
// Created by coolder on 10/3/20.
//

#include "itoa.h"

bool isPalinddromeNumber(int number) {
    uint8_t len = get_num_len(number);

    // Convert integer number to string
    // Generate buf to hold string
    char buf[len];
    itoa(number, len, buf);

    // Check if the right number
    for (int i = 0; i < len; i++) {
        if (buf[i] != buf[len - i - 1])
            return false;
    }
    return true;
}
