//
// Created by coolder on 11/13/20.
//
#include "allheaders.h"
#include "port_scanner.h"

int
scan(struct info_t *target_info_ptr) {

    // Scan all ip address
    for (int i = 0; i < target_info_ptr->n_ip && target_info_ptr->ip_addr_network != NULL; ++i) {

        int sockfd;
        struct sockaddr_in sin;

        bzero(&sin, sizeof(sin));

        // Set family
        sin.sin_family = AF_INET;
        // Set IP
        sin.sin_addr.s_addr = target_info_ptr->ip_addr_network[i];

        // Loop and scan all the ports
        for (unsigned int port = target_info_ptr->start_port; port <= target_info_ptr->stop_port; ++port) {

            sockfd = Socket(AF_INET, SOCK_STREAM, 0);

            sin.sin_port = htons(port);

            alarm(2);
            // Check port
            if (connect(sockfd, (const struct sockaddr *) &sin, sizeof(struct sockaddr_in)) >= 0) {
                printf("port %d open\n", port);
            }

            close(sockfd);
        }
    }
}