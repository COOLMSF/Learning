#include<stdio.h>
#define TRUE 1
#define FALSE 0

int sockMerchant(int n, int* ar) {
    int count = 0;

    for (int i = 0; i < n; i++) {
        if (ar[i] != 0)
        for (int j = i + 1; j < n; j++) {
            if (ar[i] == ar[j]) {
                ar[j] = 0;
                count++;
                printf("Found %d\n", ar[i]);
                break;
            }
    }
    }

    return count;
}

int
main(void) {
    int arr[8] = { 11, 22, 11, 33, 33, 99, 99, 99 };
    int result = sockMerchant(8, arr);

    printf("%d", result);
}
