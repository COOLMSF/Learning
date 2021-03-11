#include "allheaders.h"

int main(int argc, char *argv[]) {

    if (argc != 2)
        err_quit("Usage:%s unix_domain_socket_name\n", argv[0]);

    int sockfd;
    struct sockaddr_un sa_un;

    bzero(&sa_un, sizeof(struct sockaddr_un));

    sockfd = Socket(AF_LOCAL, SOCK_STREAM, 0);

    // Set family
    sa_un.sun_family = AF_LOCAL;

    // Set name of unix domain
    strncpy(sa_un.sun_path, argv[1], strlen(argv[1]));

    Bind(sockfd, (const struct sockaddr *) &sa_un, sizeof(sa_un));

    Listen(sockfd, 1);

    // Wait for client
    for (;;) {
        int connfd;

        if ( (connfd = accept(sockfd, NULL, NULL)) < 0) {

            // If accept is interrupted
            if (errno == EINTR)
                continue;
            else
                err_sys("accept");
        }

        // Handle socket
        int n;
        char recv_buf[MAXLINE];

        while ( (n = read(connfd, recv_buf, MAXLINE)) >= 0) {

            // EOF reached
            if (n == 0) {
                puts("EOF reached");
                break;
            }

            // Puts what received
            puts(recv_buf);
        }
    }
}
