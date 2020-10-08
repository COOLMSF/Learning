#include<stdio.h>

#define BUF_LEN 16

int
main(void) {

    char buf[BUF_LEN];

    for(unsigned int i=2;i<BUF_LEN-1;i++)
    {
        printf("%c", 'A' + (i % (BUF_LEN * 2)));
    }
}
