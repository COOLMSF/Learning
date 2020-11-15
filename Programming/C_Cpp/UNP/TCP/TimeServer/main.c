#include "allheaders.h"

#define SERVER_ADDR "127.0.0.1"
#define SERVER_PORT 1234

int main() {
    int socket_fd;
    struct sockaddr_in sa_in;

    if ((socket_fd = socket(AF_INET, SOCK_STREAM, 0)) == -1)
        err(EXIT_FAILURE, "socket");

    // Set family
    sa_in.sin_family = AF_INET;

    // Set address
    inet_pton(AF_INET, SERVER_ADDR, &sa_in.sin_addr.s_addr);

    // Set port
    sa_in.sin_port = htons(SERVER_PORT);

    if (bind(socket_fd, &sa_in, sizeof(sa_in)) == -1)
        err(EXIT_FAILURE, "bind");

    if (listen(socket_fd, 1) == -1)
        err(EXIT_FAILURE, "listen");

    for (;;) {
        int client_socket_fd;
        char time_buf[32] = { 0 };
        FILE *fp;

        if ((fp = popen("date", "r")) == NULL)
            err(EXIT_FAILURE, "popen");

        if ((client_socket_fd = accept(socket_fd, NULL, NULL)) == -1)
            err(EXIT_FAILURE, "accept");

        while (fgets(time_buf, sizeof(time_buf), fp) != NULL) {
            if (write(client_socket_fd, time_buf, strlen(time_buf)) < 0)
                err(EXIT_FAILURE, "write");
        }
        close(client_socket_fd);
    }
}
