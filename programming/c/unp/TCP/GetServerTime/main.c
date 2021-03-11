#include "allheaders.h"

#define SERVER_ADDR "127.0.0.1"

int main() {
    int socket_fd;
    struct sockaddr_in sa_in;

    if ((socket_fd = socket(AF_INET, SOCK_STREAM, 0)) == -1)
        err(EXIT_FAILURE, "socket");

    // Set family
    sa_in.sin_family = AF_INET;

    // Set port
    sa_in.sin_port = htons(1234);

    // Set address
    inet_pton(AF_INET, SERVER_ADDR, &sa_in.sin_addr.s_addr);

    if (connect(socket_fd, &sa_in, sizeof(sa_in)) == -1)
        err(EXIT_FAILURE, "connect");

    char time_buf[32];
    if (read(socket_fd, time_buf, sizeof(time_buf)) < 0)
        err(EXIT_FAILURE, "read");

    if (write(STDOUT_FILENO, time_buf, sizeof(time_buf)) < 0)
        err(EXIT_FAILURE, "write");

    close(socket_fd);
}
