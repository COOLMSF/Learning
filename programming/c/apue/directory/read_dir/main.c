#include "allheaders.h"

long int print_files_in_dir(const char * pathname);
size_t countDiskUsage(const char* pathname);

int main(int argc, char *argv[]) {
    if (argc < 2) {
        fprintf(stderr, "Usage:%s file", argv[0]);
        exit(EXIT_FAILURE);
    }

    printf("%zu", countDiskUsage(argv[1]));
    return 0;
}
