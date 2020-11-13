#include "allheaders.h"

struct info_t {

    // store ip address in network mode, 8 byte is enough
    unsigned long int ip_addr_network;

    // target domain name, support it later
    char domain_name[64];

    // ip address string mode
    char ip_addr_present[15];

    // port
    unsigned int port;
};

void scan(struct info_t *target_info, int start, int stop);

int
main(int argc, char *argv[]) {

    int start_port, stop_port;
    struct info_t target_info;

    bzero(&target_info, sizeof(target_info));

    if (argc < 2)
        err_quit("Usage:%s ip_addr/domain_name start_port stop_port", argv[0]);

    start_port = atoi(argv[2]);
    stop_port = atoi(argv[3]);

    // Copy ip address in structure
    strncpy(target_info.ip_addr_present, argv[1], strlen(argv[1]));
    // Make last element of ip string '\0'
    strncpy(target_info.ip_addr_present + strlen(argv[1]) + 1, "\0", 1);

    scan(&target_info, start_port, stop_port);
}

void
scan(struct info_t *target_info, int start, int stop) {

    int sockfd;
    struct sockaddr_in sin;

    bzero(&sin, sizeof(sin));

    // Set family
    sin.sin_family = AF_INET;
    // Convert present format into network format
    Inet_pton(AF_INET, (const char *) &target_info->ip_addr_present, (void *) &target_info->ip_addr_network);
    // Set ip
    memcpy(&sin.sin_addr.s_addr, &target_info->ip_addr_network, sizeof(sin.sin_addr.s_addr));

    // Loop to scan all the port
    for (int port = start; port <= stop; ++port) {

        sockfd = Socket(AF_INET, SOCK_STREAM, 0);

        // Set port
        sin.sin_port = htons(port);

        // Check port
        if ( connect(sockfd, (const struct sockaddr *) &sin, sizeof(struct sockaddr_in)) >= 0) {
            printf("port %d open\n", port);
        }

        close(sockfd);
    }
}
