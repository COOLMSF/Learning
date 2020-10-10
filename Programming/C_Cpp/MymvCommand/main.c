#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/wait.h>
#include <sys/stat.h>
#include <sys/types.h>

/*
 * This program is aim to replace mv command, to show progress
 * bar while moving file, it call "/bin/progress" waiting child and fork
 * another process to call "/bin/mv" command.
 */

int call_mv();
int call_progress();

int main(int argc, char *argv[]) {

    if (argc < 3) {
        fprintf(stderr, "man mv to see usage");
        exit(EXIT_FAILURE);
    }

    struct stat statbuf;
    pid_t pid;
    pid_t child_pid;
    int wstatus;

    // Get file status
    if (-1 == stat(argv[1], &statbuf)) {
        perror("stat");
        exit(EXIT_FAILURE);
    }

    // Get size of src directory, using du -s


    pid = fork();

    // progress is an another program which progress bar
    call_progress();

    // Child
    if (pid == 0) {
        child_pid = getpid();
        call_mv();
    }

    if (-1 == wait(&wstatus)) {
        perror("wait");
        exit(EXIT_FAILURE);
    }
}