#include<stdio.h>

void before_main(void) __attribute__ ((constructor));
void before_main1(void) __attribute__ ((constructor));
void after_main(void) __attribute__ ((destructor));

int
main(void) {
    puts("I am in main");
}

void before_main(void) {
    printf("I before main\n");
}

void before_main1(void) {
    printf("I before main1\n");
}
void after_main(void) {
    printf("I am after main\n");
}
