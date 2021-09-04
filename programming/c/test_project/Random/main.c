#include "allheaders.h"

long int random_int(void) {

}

int main() {
    for (int i = 0; i < 10; ++i) {

        /*
         * Note!!!
         * Here is a bug, because program will be finished within 1 seconds,
         * so t = time(NULL), t will always be the same.
         */

        // srandom(time(NULL) + i);
        // sleep(1);
        // srandom(time(NULL));
        // printf("%ld ", rand());

        clock_t start, end;

        start = clock();
        srandom(start);
        printf("%d ", rand());
        end = clock();
    }
}
