#include "allheaders.h"

int
main(int argc, char *argv[]) {
    int sockfd;
    size_t read_n;
    char buf[16];

    struct sockaddr_in *sa_in_ptr;
    struct sockaddr_storage sockaddr_storage;
    sa_in_ptr = (struct sockaddr_in *) &sockaddr_storage;

    sockfd = Socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);

    sa_in_ptr->sin_family = AF_INET;
    sa_in_ptr->sin_port = htons(1232);
    Inet_pton(AF_INET, "127.0.0.1", &sa_in_ptr->sin_addr.s_addr);

    Connect(sockfd, (const struct sockaddr *) sa_in_ptr, sizeof(sockaddr_storage));

    read_n = read(sockfd, buf, sizeof(buf));

    printf("read_n:%zu\nerrno:%d", read_n, errno);
}
