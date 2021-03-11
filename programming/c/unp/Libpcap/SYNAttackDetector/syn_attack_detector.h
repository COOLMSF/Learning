//
// Created by coolder on 11/16/20.
//

#include "allheaders.h"

#ifndef SYNATTACKDETECTOR_SYN_ATTACK_DETECTOR_H
#define SYNATTACKDETECTOR_SYN_ATTACK_DETECTOR_H

#endif //SYNATTACKDETECTOR_SYN_ATTACK_DETECTOR_H

#define MAX_PACKET 100

// Struct that store SYN attack info
typedef struct syn_attack_info_t {

    tcp_seq th_seq;
    tcp_seq th_ack;
    uint8_t th_flags;

} syn_attack_info;

extern int total;
extern int n_syn_packet;
extern int n_syn_ack_packet;
extern syn_attack_info attack_info;
extern bpf_u_int32 local_ip_addr;

void print_usage();

void process_packet(u_char *args, const struct pcap_pkthdr *header, const u_char *buffer);

void collect_attack_info(const u_char *buffer);

void check_syn_attack(void);
