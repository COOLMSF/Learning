#include "allheaders.h"

int main() {
    int socket_fd;
    struct sockaddr_in sa_in;

    // Set family
    sa_in.sin_family = AF_INET;

    // Set ip address
    if (inet_pton(AF_INET, "127.0.0.1", &sa_in.sin_addr.s_addr) == -1)
        err(EXIT_FAILURE, "inet_pton");

    // Set port
    sa_in.sin_port = htons(1232);

    socket_fd = socket(AF_INET, SOCK_STREAM, 0);

    if (socket_fd == -1)
        err(EXIT_FAILURE, "socket");

    if (bind(socket_fd, &sa_in, sizeof(sa_in)) == -1)
        err(EXIT_FAILURE, "bind");

    if (listen(socket_fd, 1) == -1)
        err(EXIT_FAILURE, "listen");

    for (;;) {
        int connfd;
        pid_t pid;
        struct sockaddr_in structsockaddr_in;
        socklen_t socklen = sizeof(structsockaddr_in);

        connfd = Accept(socket_fd, (struct sockaddr *) &structsockaddr_in, &socklen);

        pid = fork();

        if (pid == 0) {
            int n;
            char buf[MAXLINE] = {0};

            while ( (Readline(connfd, buf, MAXLINE) ) > 0 ) {
                fputs(buf, stdout);
            }

            if (n == 0)
                err_quit("EOF");

            if (n < 0)
                err(EXIT_FAILURE, "read");
        }
    }
}