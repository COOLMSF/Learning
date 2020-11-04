#include "allheaders.h"
#include "unp.h"

int main() {
    int sock_fd;
    struct sockaddr_in6 sockaddr_in6;
    struct sockaddr s;

    if ((sock_fd = socket(AF_INET6, SOCK_STREAM, 0)) == -1)
        err(EXIT_FAILURE, "socket");

    // Zero sockaddr_in6
    bzero(&sockaddr_in6, sizeof(sockaddr_in6));

    printf("%lu", sizeof(struct sockaddr_in6));

    sockaddr_in6.sin6_family = AF_INET6;

    if (bind(sock_fd, &sockaddr_in6, sizeof(sockaddr_in6)) == -1)
        err(EXIT_FAILURE, "bind");

}
