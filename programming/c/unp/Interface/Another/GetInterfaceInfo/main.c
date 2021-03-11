#include "allheaders.h"

#include <sys/socket.h>
#include <sys/ioctl.h>
#include <linux/if.h>
#include <netdb.h>
#include <stdio.h>
#include <string.h>

int main()
{
    struct ifreq s;
    int fd = Socket(AF_INET, SOCK_DGRAM, IPPROTO_IP);

    struct ifconf structifconf;

    strcpy(s.ifr_name, "wlp3s0");

    if (-1 == ioctl(fd, SIOCGIFADDR, &s)) {
        err_sys("ioctl");
    }

    // Store ip address
    char broadcast_addr[15];
    struct sockaddr_in *sa_in_ptr;

    // Inet_ntop(AF_INET, broadcast_addr, s.ifr_ifru.ifru_broadaddr.sa_data, sizeof(broadcast_addr));
    sa_in_ptr = (struct sockaddr_in *) &s.ifr_ifru;
    Inet_ntop(AF_INET, &sa_in_ptr->sin_addr.s_addr, broadcast_addr, sizeof(struct sockaddr_in));

    puts(broadcast_addr);
}

