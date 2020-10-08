#include<stdio.h>
#include<pwd.h>
#include<sys/types.h>
#include<unistd.h>
#include<stdlib.h>

int
main(void) {
    struct passwd *pw;

    pw = getpwnam("coolder");

    if (NULL == pw) {
        perror("getpwnam");
        exit(EXIT_FAILURE);
    }

    printf("dir:%s\n", pw->pw_dir);
    printf("name:%s\n", pw->pw_name);
}