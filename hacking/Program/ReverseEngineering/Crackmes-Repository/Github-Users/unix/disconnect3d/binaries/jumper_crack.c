#include<stdio.h>

int
main(void) {
    int arr[] = { 0x16ff, 0x176a, 0x176a, 0x1773, 0x1767, 0x1777, 0x1761, 0x1778, 0x1764 };

    for (int i = 0; i < sizeof(arr)/sizeof(int); i++) {
        putchar(arr[i] - 0x16ff);
    }
}
