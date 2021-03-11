#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include<netdb.h>
#include<sys/socket.h>

int
main(int argc, char *argv[]) {

    struct hostent *host;

    // Pharse argument
    if (argc != 2) {
        fprintf(stderr, "%s hostname", argv[0]);
        _exit(-1);
    }

    // Gethoostbyname
    host = gethostbyname(argv[1]);

    // Handle error
    if (!host) {
        perror("gethostbyname");
        _exit(-1);
    }

    puts(host->h_name);

    puts("Done");
}