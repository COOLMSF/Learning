#include<stdio.h>
#include<time.h>

int
main(void) {
    time_t time_sec;
    struct tm *tm;

    time_sec = time(NULL);
    tm = localtime(&time_sec);

    printf("%d", tm->tm_hour);
}
