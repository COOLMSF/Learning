#include<stdio.h>

#define MAX 5

void swap(int *a, int *b);
void swap_1(int *a, int *b);
void reverse_array(int a[], int cnt);

int
main(void) {
    int a = 10;
    int b = 20;
    int array[MAX] = { 1, 2, 3, 4, 5 };

    /*
    printf("Before swap:a=%d, b=%d\n", a, b);

    swap_1(&a, &b);

    printf("After swap:a=%d, b=%d\n", a, b);
    */

    printf("Before reverse_array\n");
    for (int i=0; i<MAX; i++) {
        printf("%d ", array[i]);
    }

    printf("\n");

    reverse_array(array, 5);

    printf("After reverse_array\n");
    for (int i=0; i<MAX; i++) {
        printf("%d ", array[i]);
    }
}

/*
 * This swap function is evil when it comes to odd index of an array,
 * because swap(&a, &a) sets a to zero.
 */

void
swap(int *a, int *b) {
    *a = *a ^ *b;
    *b = *a ^ *b;
    *a = *a ^ *b; }

void
swap_1(int *a, int *b) {
    int c;

    c = *a;
    *a = *b;
    *b = c;
}

void
reverse_array(int a[], int cnt) {
    int first, last;

    for (first = 0 ,last = cnt -1; first < last; first++, last--) {
        swap(&a[first], &a[last]);
    }
}
