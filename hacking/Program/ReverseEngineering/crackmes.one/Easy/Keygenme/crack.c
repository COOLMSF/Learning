#include<stdio.h>
#include<string.h>
#include<stdlib.h>

int
main(void) {
    char username[] = "coolder";

    int v6, v12;
    char v10 = username[2];
    int v11 = username[strlen(username) - 1];

    if (v10 <= v11) {
        v6 = v10 / strlen(username) - v11 + username[1];
    }

    v12 = 0x255a8 -  v6 * username[1];

    printf("%d\n", v12 / 25);
}
