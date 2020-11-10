//
// Created by coolder on 10/11/20.
//
#include "allheaders.h"

void call_mv(int argc, char *argv[]) {
    pid_t pid;
    int wstatus;
    char command[100];

    pid = fork();

    if (-1 == pid) {
        perror("fork");
        exit(EXIT_FAILURE);
    } else if (0 == pid) {  // Child to call /bin/mv command
        strcpy(command, "/bin/cp ");

        for (int i = 1; i < argc; ++i) {
            strcat(command, argv[i]);
            strcat(command, " ");
        }
        strcat(command, "\0");

        system(command);
    } else {    // Parent wait for child
        wait(&wstatus);
    }
}