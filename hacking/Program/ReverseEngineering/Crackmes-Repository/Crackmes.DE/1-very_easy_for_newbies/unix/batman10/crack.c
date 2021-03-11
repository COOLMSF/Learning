#include<stdio.h>
#include<string.h>

int
main(void) {
    char name[] = "AAAA";
    int sum_of_name = 0;

    /*
     * sum = (number ^ 0x47) * 4,
     * sum / 4 = (number ^ 0x47)
     * number = (sum / 4) ^ 0x47
     */

    for (int i = 0; i < strlen(name); i++) {
        sum_of_name += name[i] ^ 0x47;
    }

    int c = sum_of_name / strlen(name);

    for (int i = 0; i < strlen(name); i++) {
        putchar(c ^ 0x42);
    }
}
