#include "allheaders.h"

void sig_handler(int );
int wstatus;
int i = 10;
int main() {
    pid_t pid;
    signal(SIGCHLD, sig_handler);

    if ( (pid = fork()) == 0) {
    } else if (pid > 0) {
        sleep(2);
        printf("%d", i);
    }
}

void
sig_handler(int sig) {
    i = i + 10;
}
