#include "allheaders.h"

int main() {
    clock_t clock_start, clock_end;

    clock_start = clock();

    sleep(3);

    clock_end = clock();

    printf("CPU time:%f seconds", (double)(clock_end - clock_start) / 10);
}
