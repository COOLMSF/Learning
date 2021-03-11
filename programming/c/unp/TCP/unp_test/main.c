#include "allheaders.h"

int main() {
    int sockfd;
    struct sockaddr_in sa_in;

    sockfd = Socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);

    sa_in.sin_family = AF_INET;
    sa_in.sin_port = htons(1234);
    Inet_pton(AF_INET, "127.0.0.1", &sa_in.sin_addr.s_addr);

    Connect(sockfd, (const struct sockaddr *) &sa_in, sizeof(sa_in));

    char buf[32] = "Hello, from other side";
    Writen(sockfd, buf, sizeof(buf));
}