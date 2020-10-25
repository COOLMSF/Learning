#include "allheaders.h"
int num = 0;

void fun1(void) {
    for (int i = 0; i < 100; ++i) {
        num++;
    }
}

void fun2(void) {
    for (int i = 0; i < 100; ++i) {
        num++;
    }
}

int main() {
    pthread_t tid1, tid2;

    pthread_create(&tid1, NULL, (void *(*)(void *)) fun1, NULL);
    pthread_create(&tid2, NULL, (void *(*)(void *)) fun2, NULL);

    printf("%d", num);
}
