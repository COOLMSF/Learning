#define _GNU_SOURCE

#include<stdio.h>
#include<sys/types.h>
#include<dirent.h>
#include<stdlib.h>
#include<string.h>
#include<unistd.h>

struct dirent *readall(DIR *dir);

int
main(int argc, char *argv[]) {

    if (argc != 2) {
        fprintf(stderr, "Argument error\n");
        exit(-1);
    }

    DIR *dir;
    struct dirent *d;

    if (NULL == (dir = opendir(argv[1]))) {
        perror("opendir");
        exit(-1);
    }

    readall(dir);

/*
    while (NULL != (d = readdir(dir))) {
        if (DT_DIR != d->d_type) {
            printf("Found file:%s\n", d->d_name);
        } else {
            readall(dir);
        }
    }
*/
}

struct dirent *
readall(DIR *dir) {
    struct dirent *d;

    while (NULL != (d = readdir(dir))) {
        if (DT_DIR != d->d_type) {
            printf("Found file:%s\n", d->d_name);
        } else {
            if (NULL == opendir(strcat(get_current_dir_name(), d->d_name))) {
                perror("opendir");
            } else {
                readall(dir);
            }
        }
    }
}
