#include "allheaders.h"
#include "pcap/pcap.h"
#include <netinet/if_ether.h>


int main(int argc, char **argv) {
    char *device;
    pcap_if_t *device_list;
    char ip[13];
    char subnet_mask[13];
    bpf_u_int32 ip_raw; /* IP address as integer */
    bpf_u_int32 subnet_mask_raw; /* Subnet mask as integer */
    int lookup_return_code;
    char error_buffer[PCAP_ERRBUF_SIZE]; /* Size defined in pcap.h */
    struct in_addr address; /* Used for both ip & subnet */

    pcap_findalldevs(&device_list, error_buffer);

    pcap_if_t *dev_ptr;

    /* Find a device */
    for (dev_ptr = device_list; dev_ptr != NULL; dev_ptr = dev_ptr->next) {

        /* Get device info */
        lookup_return_code = pcap_lookupnet(
                dev_ptr->name,
                &ip_raw,
                &subnet_mask_raw,
                error_buffer
        );

        if (lookup_return_code == -1) {
            printf("%s\n", error_buffer);
            return 1;
        }

        /* Get ip in human readable form */
        address.s_addr = ip_raw;
        strcpy(ip, inet_ntoa(address));
        if (ip == NULL) {
            perror("inet_ntoa"); /* print error */
            return 1;
        }

        /* Get subnet mask in human readable form */
        address.s_addr = subnet_mask_raw;
        strcpy(subnet_mask, inet_ntoa(address));
        if (subnet_mask == NULL) {
            perror("inet_ntoa");
            return 1;
        }

        printf("Device: %s\n", dev_ptr->name);
        printf("IP address: %s\n", ip);
        printf("Subnet mask: %s\n", subnet_mask);

    }
    return 0;
}
