#include<stdio.h>
#include<unistd.h>
int
main(int argc, char *argv[]) {
        strncpy(argv[0], "hiddenprocessname", 20);
            puts("Hello");
                sleep(10);
                
}
