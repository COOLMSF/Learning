#include "allheaders.h"
pthread_mutex_t mutex;

void fun(void) {
    pthread_mutex_lock(&mutex);
    sleep(1);
    pthread_mutex_lock(&mutex);
}

int main() {
    int err;
    pthread_t tid;

    pthread_mutex_init(&mutex, NULL);

    err = pthread_create(&tid, NULL, (void *(*)(void *)) fun, NULL);

    if (0 != err)
        MyError("pthread_create");

    pthread_mutex_destroy(&mutex);
}
