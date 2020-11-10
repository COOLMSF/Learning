#include "allheaders.h"

/*
 * Race condition between these two function, lock needed.
 */

struct Student {
    char name[10];
    char gender[10];
    int age;
};

struct Student student;
pthread_mutex_t mutex;

// void print_a(struct Student *student1) {
//     // Init student1
//     strncpy(student1->name, "coolder", 10);
//     student1->age = 22;
//     strncpy(student1->gender, "male", 10);
//
//     // Print info
//     printf("Name:%s\n", student1->name);
//     printf("Age:%d\n", student1->age);
//     printf("Gender:%s\n", student1->gender);
//
//     pthread_exit(NULL);
// }
//
// void print_b(struct Student *student1) {
//     strncpy(student1->name, "COOLMSF", 10);
//     student1->age = 18;
//     strncpy(student1->gender, "female", 10);
//
//     // Print info, if there is no race condition, everything will be fine, but
//     printf("Name:%s\n", student1->name);
//     printf("Age:%d\n", student1->age);
//     printf("Gender:%s\n", student1->gender);
//
//     pthread_exit(NULL);
// }

void print_a(struct Student *student1) {
    // Init student1
    pthread_mutex_lock(&mutex);

    strncpy(student1->name, "coolder", 10);
    student1->age = 22;
    strncpy(student1->gender, "male", 10);

    // Print info
    printf("Name:%s\n", student1->name);
    printf("Age:%d\n", student1->age);
    printf("Gender:%s\n", student1->gender);

    pthread_mutex_unlock(&mutex);

    pthread_exit(NULL);
}

void print_b(struct Student *student1) {
    pthread_mutex_lock(&mutex);
    strncpy(student1->name, "COOLMSF", 10);
    student1->age = 18;
    strncpy(student1->gender, "female", 10);

    // Print info, if there is no race condition, everything will be fine, but
    printf("Name:%s\n", student1->name);
    printf("Age:%d\n", student1->age);
    printf("Gender:%s\n", student1->gender);
    pthread_mutex_unlock(&mutex);

    pthread_exit(NULL);
}

pthread_mutex_t pthreadMutex;

int main() {
    int err;
    pthread_t tid1, tid2;

    pthread_mutex_init(&pthreadMutex, NULL);

    err = pthread_create(&tid1, NULL, (void *(*)(void *)) print_a, &student);
    if (0 != err)
        MyError("pthread_create");

    err = pthread_create(&tid2, NULL, (void *(*)(void *)) print_b, &student);
    if (0 != err)
        MyError("pthread_create");

    pthread_mutex_destroy(&mutex);

    sleep(2);
}
