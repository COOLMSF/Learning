#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <signal.h>
#include <setjmp.h>
#include <pthread.h>

int i = 0;
void *retval1;
void *retval2;

void pthread_fun1(void) {
    for (int j = 0; j < 100; ++j) {
        i++;
    }
    pthread_exit(retval1);
}

void pthread_fun2(void) {
    for (int j = 0; j < 100; ++j) {
        i++;
    }

    pthread_exit(retval2);
}

int main() {
    pthread_t tid1;
    pthread_t tid2;

    // Create thread 1
    pthread_create(&tid1, NULL, (void *(*)(void *)) pthread_fun1, NULL);

    // wait for exit
    pthread_join(tid1, NULL);

    // Create thread 2
    pthread_create(&tid2, NULL, (void *(*)(void *)) pthread_fun2, NULL);

    // sleep(3);

    printf("%d\n", i);
}
