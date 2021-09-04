#include<unistd.h>

int
main(void) {
    execl("./a.out", "arg0", "arg1", "arg2", NULL);
}
