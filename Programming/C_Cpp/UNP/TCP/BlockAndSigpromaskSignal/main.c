#include "allheaders.h"

void sig_handler(int );

int main() {

    char buf[10];

    // Install signal handler
    signal(SIGUSR1, sig_handler);

    fgets(buf, sizeof(buf), stdin);

    puts(buf);
}

void
sig_handler(int sig) {
    puts("SIGUSR1 received");
}
