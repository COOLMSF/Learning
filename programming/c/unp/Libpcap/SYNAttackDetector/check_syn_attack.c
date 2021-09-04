//
// Created by coolder on 11/16/20.
//

#include "allheaders.h"
#include "syn_attack_detector.h"

syn_attack_info attack_info;


void
check_syn_attack() {

    printf("%d syn packet found\n", n_syn_packet);
    printf("%d syn ack packet found\n", n_syn_ack_packet);

}