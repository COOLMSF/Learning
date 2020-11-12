#include "allheaders.h"

/*
 * This program show that read syscall return 0, when reaches EOF,
 * This is important.
 */

int
main(int argc, char *argv[]) {

    struct sockaddr_un un;

    un.sun_family = AF_UNIX;

    if (argc != 2)
        err_quit("Usage:%s filename\n", argv[0]);

    int fd, n;

    if ( (fd = open(argv[1], O_RDONLY)) < 0)
        err_sys("open");

    char c[MAXLINE];
    while ( (n = read(fd, &c, MAXLINE)) >= 0) {
        if (n == 0) {
            puts("EOF");
            break;
        } else
            puts(c);
    }

    close(fd);
}