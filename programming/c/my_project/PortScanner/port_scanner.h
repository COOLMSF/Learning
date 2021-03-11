//
// Created by coolder on 11/13/20.
//

#ifndef PORTSCANNER_PORT_SCANNER_H
#define PORTSCANNER_PORT_SCANNER_H

#endif //PORTSCANNER_PORT_SCANNER_H

// Max ip address for domain name, a domain may have multiple address
// Use linked list will better
#define MAX_ELEMENT 10

struct info_t {

    // Target domain name, support it later
    char domain_name[64];

    // ip addresses that domain has
    int n_ip;

    // Store ip address in network mode, 8 byte is enough
    unsigned long int ip_addr_network[MAX_ELEMENT];

    // Ip address string mode
    char ip_addr_present[MAX_ELEMENT][15];

    // Port
    unsigned int start_port;
    unsigned int stop_port;
};

int scan(struct info_t *target_info);
int has_network_addr(struct info_t *target_info_ptr, in_addr_t network_addr);
int resolve_domain_name(struct info_t *target_info_ptr);
void sig_handler(int sig);