#include "allheaders.h"

int main() {
    clock_t clock_start, clock_end;
    for (int i = 0; i < 10; ++i) {
        clock_start = clock();
        printf("CPU time:%ld seconds", clock_start);
    }
}
