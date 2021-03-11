#include "allheaders.h"

int main(int argc, char *argv[]) {
    int fifo_fd;

    if (argc != 2) {
        fprintf(stdout, "Usage:./a.out fifoname\n");
        exit(EXIT_FAILURE);
    }

    // If file already exist
    if (access(argv[1], F_OK) == 0) {
        fprintf(stderr, "File already exist\n");
        exit(EXIT_FAILURE);
    } else {
        // Create FIFO
        if ((fifo_fd = mkfifo(argv[1], 0666)) == -1) {
            err(EXIT_FAILURE, "mkfifo");
        }
    }

    // Fork another process
    pid_t pid;

    if ((pid = fork()) < 0)
        err(EXIT_FAILURE, "fork");
    else if (pid == 0) {
        int child_fd;
        char buf[1024];

        if ((child_fd = open(argv[1], O_RDONLY)) < 0)
            err(EXIT_FAILURE, "open in child");

        if (read(child_fd, buf, sizeof(buf)) < 0)
            err(EXIT_FAILURE, "read in child");

        puts(buf);
    } else {
        int parent_fd;
        char *msg = "Hello, from the other side.";

        if ((parent_fd = open(argv[1], O_WRONLY)) < 0)
            err(EXIT_FAILURE, "open in parent");

        if (write(parent_fd, msg, strlen(msg)) < 0)
            err(EXIT_FAILURE, "write in parent");

        wait(NULL);
    }
}
