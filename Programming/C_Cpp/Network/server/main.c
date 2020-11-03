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

    int n;
    char buf[1024];

    for (;;) {
        struct sockaddr_in structsockaddr_in;
        socklen_t socklen = sizeof(structsockaddr_in);

        while ((n = read(accept(socket_fd, &structsockaddr_in, &socklen), buf, sizeof(buf))) > 0) {
            printf("Received from %s\n", inet_ntoa(structsockaddr_in.sin_addr));
            write(STDOUT_FILENO, buf, n);
        }

        if (n < 0)
            err(EXIT_FAILURE, "read");
    }
}