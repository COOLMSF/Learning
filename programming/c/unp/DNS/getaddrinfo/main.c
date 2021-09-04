#include "allheaders.h"

int main(int argc, char *argv[]) {

    if (argc != 2)
        err_quit("Usage:%s domain_name", argv[0]);

    char domain_name[64];
    strncpy(domain_name, argv[1], strlen(argv[1]));
    strncpy(domain_name + strlen(argv[1]), "\0", 1);

    struct addrinfo *res;
    struct addrinfo *ai_ptr;
    struct sockaddr_in *sin_ptr_v4;
    struct sockaddr_in6 *sin_ptr_v6;
    char ipaddr_present_v4[15];
    char ipaddr_present_v6[64];

    if ( (getaddrinfo(domain_name, NULL, NULL, &res)) != 0)
        err_sys("getaddrinfo");

    for (ai_ptr = res; ai_ptr != NULL; ai_ptr = ai_ptr->ai_next) {

        if (ai_ptr->ai_family == AF_INET) {

            sin_ptr_v4 = (struct sockaddr_in *) ai_ptr->ai_addr;
            Inet_ntop(AF_INET, &sin_ptr_v4->sin_addr, ipaddr_present_v4, sizeof(struct sockaddr_in));
            puts(ipaddr_present_v4);

        } if (ai_ptr->ai_family == AF_INET6) {

            sin_ptr_v6 = (struct sockaddr_in6 *) ai_ptr->ai_addr;
            Inet_ntop(AF_INET6, &sin_ptr_v6->sin6_addr, ipaddr_present_v6, sizeof(struct sockaddr_in6));
            puts(ipaddr_present_v6);
        }
    }
}
