#include "allheaders.h"

int main(int argc, char *argv[]) {
    pid_t pid;
    int pfd[2];
    char command[50];

    if (pipe(pfd) < 0) {
        perror("pipe");
        exit(EXIT_FAILURE);
    }

    pid = fork();

    if (-1 == pid) {
        perror("fork");
        exit(EXIT_FAILURE);
    } else if (pid == 0) {  // Child

        // Close a pipe
        close(pfd[0]);

        // Redirect stdout to pipe
        dup2(pfd[1], 1);
        // close(pfd[0]);

        sprintf(command, "du -sh %s", argv[1]);
        system(command);
    } else { // Parent
        int wstatus;
        char command_result[100];

        close(pfd[1]);
        if (-1 == read(pfd[0], command_result, 100)) {
            perror("read");
            exit(EXIT_FAILURE);
        }
        wait(&wstatus);

        puts(command_result);
    }
}