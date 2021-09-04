//
// Created by coolder on 10/3/20.
//

#include <stdint.h>

uint8_t get_num_len(uint32_t number) {
    uint32_t len = 1;

    while (number / 10 != 0) {
        len++;
        number /= 10;
    }

    return len;
}