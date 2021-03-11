#include "allheaders.h"

int main() {

    time_t local_time;
    local_time = time(NULL);

    puts(ctime(&local_time));
}
