//
// Created by coolder on 11/16/20.
//

#include "allheaders.h"
#include "syn_attack_detector.h"

int n_syn_packet = 0;
int n_syn_ack_packet = 0;

void
collect_attack_info(const u_char *buffer) {

    struct tcphdr *tcphdr_ptr;

    tcphdr_ptr = (struct tcphdr *) (buffer + sizeof(struct ethhdr) + sizeof(struct iphdr));

        // Syn packet found
        if (tcphdr_ptr->th_flags == TH_SYN)
            n_syn_packet++;

        // Syn | ack packet found
        if (tcphdr_ptr->th_flags == (TH_SYN | TH_ACK))
            n_syn_ack_packet++;
}