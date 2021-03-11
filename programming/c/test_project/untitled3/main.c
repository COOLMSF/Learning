#include "allheaders.h"

int main() {
    struct sockaddr_in sin;
    sin.sin_family = AF_INET;
    sin.sin_port = htons(123);
    sin.sin_addr.s_addr = inet_addr("127.0.0.1");

    return 0;
}
