//
// Created by coolder on 11/13/20.
//
#include "allheaders.h"
#include "port_scanner.h"

int has_network_addr(struct info_t *target_info_ptr, in_addr_t network_addr) {

    for (int i = 0; i < MAX_ELEMENT; ++i) {

        // Has the same value
        if (target_info_ptr->ip_addr_network[i] == network_addr)
            return 1;
    }

    return 0;
}