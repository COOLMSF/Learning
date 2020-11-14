#include "allheaders.h"

jmp_buf env;

void sig_handler(int sig);

int main() {
    signal(SIGUSR1, sig_handler);

    setjmp(env);

    while (1) {
        puts("Hello");
        sleep(1);
    }

    end: puts("end");

}

void
sig_handler(int sig) {
    puts("Another hello");
}