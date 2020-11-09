#include "allheaders.h"

int main() {

    // struct hostent *structhostent;
    struct netent *structnetent;

    setnetent(1);

    while ((structnetent = getnetent()) != NULL) {
        puts(structnetent->n_name);
    }

    endnetent();
}
