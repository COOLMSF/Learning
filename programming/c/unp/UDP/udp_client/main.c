#include "allheaders.h"

#define SERVER_ADDR "127.0.0.1"
#define SERVER_PORT 1234

int main() {
    int sockfd;
    char send_buf[1024] = "Hello, from the other side";
    struct sockaddr_in sa_server;
    socklen_t send_len = sizeof(sa_server);

    bzero(&sa_server, sizeof(sa_server));

    sa_server.sin_family = AF_INET;
    sa_server.sin_port = htons(SERVER_PORT);
    Inet_pton(AF_INET, SERVER_ADDR, &sa_server.sin_addr.s_addr);

    sockfd = Socket(AF_INET, SOCK_DGRAM, 0);

    Sendto(sockfd, send_buf, strlen(send_buf), 0, (const struct sockaddr *) &sa_server, send_len);
}
