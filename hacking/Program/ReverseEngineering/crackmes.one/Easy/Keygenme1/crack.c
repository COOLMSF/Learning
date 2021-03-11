#include<stdio.h>
#include<string.h>

int ret_sum_of_string(char *);

int
main(int argc, char *argv[]) {
    int v4 = 0;

    v4 = 3 * *argv[1] ^ ret_sum_of_string(argv[1]);

    int v5 = v4 << strlen("./keygenme1");

    printf("%d", v5);
}

int
ret_sum_of_string(char *str) {
    int sum = 0;

    for (int i = 0; i < strlen(str); i++) {
        sum += str[i];
    }

    return sum;
}
