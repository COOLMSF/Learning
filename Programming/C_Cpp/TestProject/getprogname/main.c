#include "allheaders.h"
#include "bsd/stdlib.h"

int main() {
    printf("%ld", sizeof(struct sockaddr_in));
    printf("%ld", sizeof(struct sockaddr));
}