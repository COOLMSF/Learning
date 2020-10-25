#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <signal.h>
#include <setjmp.h>
#include <pthread.h>

pthread_mutex_t pthreadMutex;
void *retval1;
void *retval2;
int j = 0;

void pthread_fun1(void) {
    puts("fun1");

    for (int i = 0; i < 500; ++i) {
        printf("1");
    }

    puts("\n");
    pthread_exit(retval1);
}

void pthread_fun2(void) {
    puts("fun2");
    for (int i = 0; i < 500; ++i) {
        printf("2");
    }
    puts("\n");
    pthread_exit(retval2);
}

int main() {
    pthread_t tid1;
    pthread_t tid2;

    pthread_mutex_init(&pthreadMutex, NULL);

    pthread_create(&tid1, NULL, (void *(*)(void *)) pthread_fun1, NULL);
    pthread_create(&tid2, NULL, (void *(*)(void *)) pthread_fun2, NULL);

    sleep(2);
}