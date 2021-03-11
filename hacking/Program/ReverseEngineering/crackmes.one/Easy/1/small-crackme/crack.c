#include<stdio.h>

#define MAX 10

int
main(void) {
    char decrypt_method1[MAX] = { 0 };
    char decrypt_method2[MAX] = { 0 };

    // solution 1
    // find how many solutions through brute force attack
    int count = 0;
    for (int i = 1; i <= 0x10000; i++) {
        int j = i;

        j ^= 0x1a;
        j |= 0xa;
        j ^= 0x1987;

        if (j == 0x1998) {
            // store the solution
            decrypt_method1[count] = i;
            count++;
        }
    }

    // solution 2
    count = 0;
    for (int i = 1; i <= 0x10000; i++) {

        int j = i;
        int j1;

        j1 = j;
        j ^= 0xdead;
        j &= 0xbabe;
        j >>= 4;
        j += j1;

        // find the solution
        if (j == 0x1998) {
            decrypt_method2[count] = i;
            count++;
        }
    }

    puts("Solution 1");
    for (int i = 0; i < MAX; i++) {
        printf("%d ", decrypt_method1[i]);
    }

    puts("\nSolution 2");
    for (int i = 0; i < MAX; i++) {
        if (decrypt_method2[i] < 0) {
            puts("Overflowed");
            break;
        }
        else
            printf("%d ", decrypt_method2[i]);
    }
}
