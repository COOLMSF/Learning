#include "allheaders.h"
#include <st

int main() {
    int flags;

    if ( (flags = fcntl(STDIN_FILENO, F_GETFL, 0) ) < 0)
        err_sys("fcntl");

    flags |= O_NONBLOCK;

    if (fcntl(STDIN_FILENO, F_SETFL, flags) < 0)
        err_sys("fcntl");

    char buf[10];

    fgets(buf, sizeof(buf), STDIN_FILENO);

    puts(buf);
}
