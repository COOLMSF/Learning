#include<string.h>
#include<unistd.h>

int
main(int argc, char *argv[]) {
    strncpy(argv[0], "YouCanNotFindMe", 16);
    sleep(10);
}
