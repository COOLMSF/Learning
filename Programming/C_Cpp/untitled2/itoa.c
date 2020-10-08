//
// Created by coolder on 10/3/20.
//
// This program convert an integer to a string
// Only support positive uint32_t number

#include <stdint.h>
#include <math.h>
#include "itoa.h"

char *itoa(uint32_t number, uint8_t len, char* array) {

    // Save number here, because I will change number
    uint32_t ori_number = number;
    uint32_t num_len = get_num_len(number);

    // Get number length.
    // Eg, the length of number 123 is 3,
    // the length of number 99999 is 5.
    // Implement in another file

    //while (number / 10 != 0) {
    //    num_len++;
    //    number /= 10;
    //}

    // Restore number
    number = ori_number;

    // Number length provided not consistent with the calculated one
    // return NULL
    if (len != num_len)
        return (char *)0;

    // Generate string
    // For example number 123 here
    for (uint8_t i = 0; i < num_len; i++) {
        // Convert number to char, and sign to array
        // For first loop ,i == 0, so
        // array[0] = (123 / pow(10, 3 - 0 - 1)) equals to 1, convert 1 to
        // '1', and sign to array[0];

        // For next loop, i == 2, so
        // array[1] = (23 / pow(10, 3 - 1 - 1)) equals to 2, convert 2 to
        // '2', and sign to array[1];
        //array[i] = (number / pow(10, num_len - i - 1)) + ('1' - 1);
        //number -= number * pow(10, num_len - i - 1);

        // 123 / 100, so quotient == 1;
        uint32_t quotient = (number / pow(10, num_len - i - 1));

        // Convert int to char
        array[i] = quotient + ('1' - 1);

        // number = 123, number -= 1 * 100, number == 23;
        number -= quotient * pow(10, num_len - i - 1);
    }

    return array;
}
