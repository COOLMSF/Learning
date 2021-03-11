#include<unistd.h>

void fun(void);

int
main(void) {
    fun();
}

void
fun(void) {
    write(1, "Hello", 10);
}
