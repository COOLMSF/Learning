#include <stdio.h>
#include <string.h>
#include "allheaders.h"

int main()
{
    struct ifreq s;
    int fd = Socket(AF_INET, SOCK_DGRAM, IPPROTO_IP);

    struct ifconf *structifconf_ptr;
    struct ifconf structifconf;

    structifconf_ptr = &structifconf;

    char buf[1024];
    structifconf.ifc_len = sizeof(buf);
    structifconf.ifc_ifcu.ifcu_buf = buf;

    if (-1 == ioctl(fd, SIOCGIFCONF, &structifconf)) {
        err_sys("ioctl");
    }

    int n_interfaces;

    n_interfaces = structifconf.ifc_len / sizeof(struct ifreq);

    for (int i = 0; i < n_interfaces; ++i) {
        char ipaddr[15];
        struct sockaddr_in *sin_ptr;

        printf("Interface Name:%s\n", structifconf_ptr->ifc_ifcu.ifcu_req[i].ifr_ifrn.ifrn_name);

        // Make struct sockaddr_in point to it
        sin_ptr = (struct sockaddr_in *) &structifconf_ptr->ifc_ifcu.ifcu_req[i].ifr_ifru.ifru_addr;

        Inet_ntop(AF_INET, &sin_ptr->sin_addr, ipaddr, sizeof(struct sockaddr_in));

        printf("Ip Address:%s\n\n", ipaddr);
    }

}
