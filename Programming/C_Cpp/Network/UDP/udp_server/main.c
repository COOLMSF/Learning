#include "allheaders.h"

#define SERVER_PORT 1234

int main(int argc, char *argv[]) {
    int sockfd;
    struct sockaddr_in sa_in;

    bzero(&sa_in, sizeof(sa_in));

    sockfd = Socket(AF_INET, SOCK_DGRAM, 0);

    sa_in.sin_family = AF_INET;
    sa_in.sin_port = htons(SERVER_PORT);
    // sa_in.sin_addr.s_addr = htonl(INADDR_ANY);
    Inet_pton(AF_INET, "127.0.0.1", &sa_in.sin_addr.s_addr);

    Bind(sockfd, (const struct sockaddr *) &sa_in, sizeof(sa_in));

    for (;;) {
        char recv_buf[1024];
        unsigned int clilen;
        unsigned int recv_len;

        // Save data that client sent
        FILE *fp;

        fp = Fopen(argv[1], "w");

        recv_len = Recvfrom(sockfd, recv_buf, sizeof(recv_buf), 0, (struct sockaddr *) &sa_in, &clilen);
        printf("Receive buf:%s\n", recv_buf);

        if (fwrite(recv_buf, sizeof(recv_buf), 1, fp) < 0)
            err_sys("fwrite");

        if (recv_len == 0) {
            puts("EOF");
            fclose(fp);
        }
    }
}