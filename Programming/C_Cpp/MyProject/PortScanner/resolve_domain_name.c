//
// Created by coolder on 11/13/20.
//
#include "allheaders.h"
#include "port_scanner.h"

int resolve_domain_name(struct info_t *target_info_ptr) {
    struct addrinfo *res;
    struct addrinfo *ai_ptr;

    if (getaddrinfo(target_info_ptr->domain_name, NULL, NULL, &res) != 0)
        err_sys("getaddrinfo");

    // Resolve domain name, and store them in target_info
    int i = 0;
    for (ai_ptr = res; ai_ptr != NULL; ai_ptr = ai_ptr->ai_next) {

        struct sockaddr_in *sin_ptr = NULL;

        sin_ptr = (struct sockaddr_in *) ai_ptr->ai_addr;

        // Some addresses are the same in the target_info, don't save them
        if (!has_network_addr(target_info_ptr, sin_ptr->sin_addr.s_addr)) {

            memcpy((char *) &target_info_ptr->ip_addr_network[i], (const char *) &sin_ptr->sin_addr.s_addr,
                   sizeof(struct sockaddr_in));

            /*
             * Convert network address into present string address, note 15 is the size of
             * target_info_ptr->ip_addr_network[i], we can't use sizeof(target_info_ptr->
             * ip_addr_network), because it's a pointer, which has the same value on the same
             * machine. We can define a function to find how big it is. I just put 15 for convient.
             */

            Inet_ntop(AF_INET, (struct sockaddr_in *) &target_info_ptr->ip_addr_network[i],
                      target_info_ptr->ip_addr_present[i], 16);

            // Add ip number of the domain name
            target_info_ptr->n_ip++;
        }
        i++;
    }
}