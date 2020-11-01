#include "allheaders.h"

void sig_handler(void) {
    puts("Signal handler called");
}

int main() {
    sigset_t sigset_new, sigset_old, sigset_pend;

    if (SIG_ERR == signal(SIGINT, (__sighandler_t) sig_handler))
        err(EXIT_FAILURE, "signal");

    sigfillset(&sigset_new);

    // Create signal mask, and backup current signal to sigset_old
    if (sigprocmask(SIG_BLOCK, &sigset_new, &sigset_old) < 0)
        err(EXIT_FAILURE, "sigprocmask");

    puts("All signal blocked");

    if (sigpending(&sigset_pend) < 0)
        err(EXIT_FAILURE, "sigsuspend");

    if (sigismember(&sigset_pend, SIGINT))
        puts("SIGINT Suspend");

    // Restore signal set, this is risky, use sigsuspend
    //if (sigprocmask(SIG_SETMASK, &sigset_old, NULL) < 0)
    //    MyError("sigprocmask restore");
    //puts("Signal SIGINT unblocked");

    sigsuspend(&sigset_old);
}
