#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void fun(void);

int main(int argc, char *argv[]) 
{
    char string[] = "Hello world this is coolder";
    char *buf;

    buf = strtok(string, " ");

    while (buf) {
        puts(buf);
        buf = strtok(NULL, " ");
    }

    puts(string);
}
