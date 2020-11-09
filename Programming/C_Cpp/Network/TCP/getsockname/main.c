#include "allheaders.h"

int main() {
    int sockfd;
    struct sockaddr_in sa_in;
    sockfd = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);

    if (sockfd == -1)
        err(EXIT_FAILURE, "socket");

    bzero(&sa_in, sizeof(sa_in));

    // Set family
    sa_in.sin_family = AF_INET;

    // Set port
    sa_in.sin_port = htons(1232);

    // Set ip
    if (inet_pton(AF_INET, "127.0.0.1", &sa_in.sin_addr.s_addr) == -1)
        err(EXIT_FAILURE, "inet_pton");

    if (connect(sockfd, &sa_in, sizeof(sa_in)) == -1)
        err(EXIT_FAILURE, "connect");

    // Write Something
    char msg[] = "Hello, from the other side.";
    Writen(sockfd, msg, sizeof(msg));

    // No address and port bind, so use getsockname to get them
    char ip_addr_buf[32] = { 0 };
    struct sockaddr_in sa_local;

    socklen_t socklen = sizeof(sa_local);

    bzero(&sa_local, sizeof(sa_local));

    if (getsockname(sockfd, (struct sockaddr *)&sa_local, &socklen) == -1)
        err(EXIT_FAILURE, "getsockname");

    // transfer binary ip address to human readable string
    if (inet_ntop(AF_INET, (struct sockaddr *)&sa_local.sin_addr, ip_addr_buf, sizeof(sa_local)) == NULL)
        err(EXIT_FAILURE, "inet_ntop");

    printf("IP address:%s\nPort number:%d\n", ip_addr_buf, sa_local.sin_port);

    close(sockfd);
}
