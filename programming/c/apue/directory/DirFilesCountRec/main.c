#include "allheaders.h"

/*
 * This project count all files in which directory recursively.
 */

#define MAX_LEN_OF_DIR_NAME 255

void print_dir_files(char *dir_name);

int main(int argc, char *argv[]) {

    if (argc != 2) {
        fprintf(stderr, "Usage:%s dir\n", argv[0]);
        exit(EXIT_FAILURE);
    }

    char dir_name[MAX_LEN_OF_DIR_NAME];
    strncpy(dir_name, argv[1], MAX_LEN_OF_DIR_NAME);

    print_dir_files(dir_name);
}
