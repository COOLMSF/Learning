#include "allheaders.h"

int write_file0(void *file) {

    // Write file while race condition, file lock needed
    flockfile(file);

    if (! fwrite("Hello, ", 1, 7, (FILE *)file)) {
        perror("fwrite");
        exit(EXIT_FAILURE);
    }

    funlockfile(file);
}

int write_file1(void *file) {
    // Write file while race condition, file lock needed
    flockfile(file);

    if (!fwrite("world.\n", 1, 8, (FILE *)file)) {
        perror("fwrite");
        exit(EXIT_FAILURE);
    }

    funlockfile(file);
}

int main(int argc, char *argv[]) {

    if (argc != 2) {
        printf("Usage %s filename\n", argv[0]);
        exit(EXIT_FAILURE);
    }

    FILE *file;
    pthread_t tid0, tid1;

    if (NULL == ( file = fopen(argv[1], "w"))) {
        perror("fopen");
    }

    if (0 != pthread_create(&tid0, NULL, (void *(*)(void *)) write_file0, file)) {

        perror("pthread_create");
        exit(EXIT_FAILURE);

    }

    if (0 != pthread_create(&tid1, NULL, (void *(*)(void *)) write_file1, file)) {

        perror("pthread_create");
        exit(EXIT_FAILURE);

    }

    // Wait for the two pthread, or something will be wrong,
    // some threads may not been executed while main process exit and fclose(file)
    pthread_join(tid0, NULL);
    pthread_join(tid1, NULL);

    puts("Done");
}
