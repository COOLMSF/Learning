#include "allheaders.h"

int main() {
    int pfd[2];
    pid_t pid;

    if (-1 == pipe(pfd)) {
        perror("pipe");
        exit(EXIT_FAILURE);
    }


    pid = fork();

    if (-1 == pid) {
        perror("fork");
        exit(EXIT_FAILURE);
    } else if (0 == pid) {  // Child

        // Redirect stdout
        dup2(pfd[1], 1);

        // Close pfd
       // close(pfd[0]);
        //write(pfd[1], "hello from child", 100);
        puts("Hello from child");

    } else {    // Parent
        char message_from_child[100];

        // close(pfd[1]);

        if (-1 == read(pfd[0], message_from_child, 100)) {
            perror("read");
            exit(EXIT_FAILURE);
        }

        puts(message_from_child);
    }
}