#include "allheaders.h"
#include "syn_attack_detector.h"

bpf_u_int32 local_ip_addr;

int main(int argc, char *argv[]) {
    pcap_if_t *all_devices_ptr, *device_ptr;

    char err_buf[100], *device_name, devices[100][100];
    int number = 1, n;

    puts("Find all the devices ...");

    // Find all the devices
    if (PCAP_ERROR == pcap_findalldevs(&all_devices_ptr, err_buf)) {
        puts(err_buf);
        err_sys("pcap_findalldevs");
    }

    // Print all the devices
    printf("Device number\t \tDevice name\n");

    for (device_ptr = all_devices_ptr; device_ptr != NULL; device_ptr = device_ptr->next) {
        printf("%7d %25s\n", number, device_ptr->name);

        // Copy name to devices array
        if (device_ptr->name != NULL) {
            strncpy(devices[number], device_ptr->name, strlen(device_ptr->name));
        }
        number++;
    }

    puts("Choose a device:");
    scanf("%d", &n);
    device_name = devices[n];
    printf("You choose the device \"%s\"\n", device_name);

    // Get ip of device
    // Can't use pcap_lookupnet, it only returns network address, such as ip "192.168.221.0",
    // netmask "255.255.255.0", use ioctl instead.
    //
    // if (PCAP_ERROR == pcap_lookupnet(device_name, (bpf_u_int32 *) &local_ip_addr, &local_ip_mask, err_buf))
    //     err_sys("pcap_lookupnet");

    int n_if;
    int sockfd;
    char buf[1024];
    struct sockaddr_in *sin_ptr;
    struct ifconf structifconf, *structifconf_ptr;

    structifconf_ptr = &structifconf;
    structifconf.ifc_len = sizeof(buf);
    structifconf.ifc_ifcu.ifcu_buf = buf;

    strncpy(structifconf.ifc_ifcu.ifcu_buf, device_name, strlen(device_name));
    sockfd = Socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);

    // Get info address for the hardware
    Ioctl(sockfd, SIOCGIFCONF, &structifconf);

    n_if = structifconf.ifc_len / sizeof(struct ifreq);

    // Make a loop, to find the device
    for (int i = 0; i < n_if; ++i) {
        if ( (strcmp(structifconf_ptr->ifc_ifcu.ifcu_req[i].ifr_ifrn.ifrn_name
                     , device_name)) == 0) {

            // Find device, save address
            sin_ptr = (struct sockaddr_in *)
                    &structifconf_ptr->ifc_ifcu.ifcu_req[i].ifr_ifru.ifru_addr;
            local_ip_addr = sin_ptr->sin_addr.s_addr;
            break;
        }
    }

    pcap_t *handle;
    handle = pcap_open_live(device_name, 65536, 0, 0, err_buf);

    if (handle == NULL) {
        err_sys("pcap_open_live");
    }

    // Zero attack_info
    memset(&attack_info, 0, sizeof(struct syn_attack_info_t) * MAX_PACKET);

    pcap_loop(handle, -1, process_packet, NULL);

    pcap_freealldevs(all_devices_ptr);
}