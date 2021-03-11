#include <stdio.h>
#include <string.h>

int main() {
    char buf[] = "This is a test";

    puts(strstr(buf, " ") + 1);
}
