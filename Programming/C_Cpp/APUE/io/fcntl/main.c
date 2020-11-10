#include "allheaders.h"

int set_flag(int fd, int flags);
int del_flag(int fd, int flags);

int main(int argc, char *argv[]) {

    if (argc < 2) {
        fprintf(stderr, "a.out filename");
        MyError("arguments");
    }
    // Turn of write mode, can I print message to stdout?
    del_flag(STDOUT_FILENO, O_RDWR);

    puts("Helli");
//    int fd;
//    if ((fd = open(argv[1], O_WRONLY)) < 0)
//        MyError("fopen");
//
//
//    // We can chmod file
//    if (set_flag(fd, O_RDWR))
//        printf("O_RDWR flag set\n");
//
//    if (write(fd, "Some test", 10) < 0)
//        perror("write");
//
//    if (del_flag(fd, O_RDWR))
//        printf("O_RDWR flag delete\n");
//
//    if (write(fd, "Some test", 10) < 0)
//        perror("write");
//
//    close(fd);
}

int set_flag(int fd, int flags) {
    int var;

    if ((var = fcntl(fd, F_GETFD, flags)) < 0)
        MyError("fcntl get");

    var |= flags;

    if ((var = fcntl(fd, F_SETFD, var)) < 0)
        MyError("fcntl set");

    return true;
}

int del_flag(int fd, int flags) {
    int var;

    if ((var = fcntl(fd, F_GETFD, flags)) < 0)
    MyError("fcntl get");

    var &= ~flags;

    if ((var = fcntl(fd, F_SETFD, var)) < 0)
    MyError("fcntl set");

    return true;
}
