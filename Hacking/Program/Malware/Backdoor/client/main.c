#include "allheaders.h"

int main() {
    int sockfd;
    struct sockaddr_in structsockaddr_in;

    structsockaddr_in.sin_family = AF_INET;

    // Set address
    if (inet_pton(AF_INET, "127.0.0.1", &structsockaddr_in.sin_addr.s_addr) == -1)
        err(EXIT_FAILURE, "inet_pton address");

    // Set port
    structsockaddr_in.sin_port = htons(1234);

    if ((sockfd = socket(AF_INET, SOCK_STREAM, 0)) == -1)
        err(EXIT_FAILURE, "socket");

    //if (bind(sockfd, &structsockaddr_in, sizeof(structsockaddr_in)) == -1)
    //    err(EXIT_FAILURE, "bind");

    if (connect(sockfd, &structsockaddr_in, sizeof(structsockaddr_in)) == -1)
        err(EXIT_FAILURE, "connect");

    char *msg = "Hello, world";

    if (write(sockfd, msg, strlen(msg)) == -1)
        err(EXIT_FAILURE, "write");

    close(sockfd);
}