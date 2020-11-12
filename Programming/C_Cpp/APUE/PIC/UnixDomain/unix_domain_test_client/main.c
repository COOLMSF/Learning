#include "allheaders.h"

int main(int argc, char *argv[]) {

    if (argc != 2)
        err_quit("Usage:%s unix_domain_socket_path", argv[0]);

    int sockfd;
    struct sockaddr_un sa_un;

    sockfd = Socket(AF_LOCAL, SOCK_STREAM, 0);

    bzero(&sa_un, sizeof(sa_un));

    // Init sa_un
    sa_un.sun_family = AF_LOCAL;
    strncpy(sa_un.sun_path, argv[1], strlen(argv[1]));

    Connect(sockfd, (const struct sockaddr *) &sa_un, sizeof(sa_un));

    char buf[MAXLINE];
    while ( (fgets(buf, sizeof(buf), stdin)) != NULL) {
        Writen(sockfd, buf, strlen(buf));
    }

    if (errno)
        err_sys("fgets");

    close(sockfd);
}
