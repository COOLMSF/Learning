#include<stdio.h>
#include<stdlib.h>

int
main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "usage:%s filename", argv[0]);
        exit(-1);
    }

    FILE *file;
    int offset = 0;

    if ((file = fopen(argv[1], "r")) == NULL) {
        perror("fopen");
        exit(-1);
    } else {
        if (fseek(file, 0, SEEK_END) == -1) {
            perror("fseek");
            exit(-1);
        } else {
            if ((offset = ftell(file)) == -1) {
                perror("ftell");
                exit(-1);
            } else {
                printf("Current offset is at:%d\n", offset);
            }
        }
    }
}
