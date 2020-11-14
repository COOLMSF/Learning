#include "allheaders.h"
#include "port_scanner.h"

/*
 * It should use pthread, I will rewrite later. 2020.11.13
 */

int
main(int argc, char *argv[]) {

    int start_port, stop_port;
    struct info_t target_info;

    bzero(&target_info, sizeof(target_info));

    if (argc != 4)
        err_quit("Usage:%s ip_addr/domain_name start_port stop_port", argv[0]);

    start_port = atoi(argv[2]);
    stop_port = atoi(argv[3]);

    target_info.start_port = start_port;
    target_info.stop_port = stop_port;

    strncpy((char *) &target_info.domain_name, argv[1], strlen(argv[1]));

    // If domain name specify, find it ip address
    if (isalpha(argv[1][1]))
        resolve_domain_name(&target_info);
    else {
        Inet_pton(AF_INET, argv[1], target_info.ip_addr_network);
        target_info.n_ip = 1;
    }

    scan(&target_info);
}