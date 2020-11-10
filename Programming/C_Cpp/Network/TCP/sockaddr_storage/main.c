#include "allheaders.h"

int main() {
    int sockfd;
    struct sockaddr_in *sockaddrInPointer;
    struct sockaddr_storage sockaddrStorage;

    struct sockaddr_in sa;
    sa.sin_addr.s_addr

    sockfd = Socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);

    // Prepare for struct
    bzero(&sockaddrStorage, sizeof(sockaddrStorage));

    sockaddrInPointer = (struct sockaddr_in *) &sockaddrStorage;

    sockaddrInPointer->sin_family = AF_INET;
    Inet_pton(AF_INET, "127.0.0.1", &sockaddrInPointer->sin_addr.s_addr);
    sockaddrInPointer->sin_port = htons(1232);

    Connect(sockfd, (const struct sockaddr *) sockaddrInPointer, sizeof(sockaddrStorage));

    Writen(sockfd, "Hello", 7);

    close(sockfd);
}
