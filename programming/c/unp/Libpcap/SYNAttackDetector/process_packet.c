//
// Created by coolder on 11/16/20.
//

#include "allheaders.h"
#include "syn_attack_detector.h"

int total = 0;

void
process_packet(u_char *args, const struct pcap_pkthdr *header, const u_char *buffer) {

    total++;

    struct iphdr *iphdr_ptr = (struct iphdr *) (buffer + sizeof(struct ethhdr));

    // Only check incoming TCP packet, IPv4
    if (iphdr_ptr->protocol == 6 && iphdr_ptr->version == 4
    && iphdr_ptr->daddr == local_ip_addr)
        collect_attack_info(buffer);

    check_syn_attack();
}
