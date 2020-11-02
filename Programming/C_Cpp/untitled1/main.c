#include "allheaders.h"
#include "test.h"

int main(int argc, char *argv[]) {
    char *env = getenv("PATH");
    char *buf;

    buf = strtok(env, ":");
    while (buf) {
        puts(buf);
        buf = strtok(NULL, ":");
    }

}