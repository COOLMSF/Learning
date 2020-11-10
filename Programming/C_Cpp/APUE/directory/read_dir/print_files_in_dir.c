//
// created by coolder on 10/10/20.
//

#include "allheaders.h"

#define MAX_PATH_LENGTH 100

long int print_files_in_dir(const char * pathname) {

    if (!pathname) {
        fprintf(stderr, "NULL pathname found\n");
        exit(EXIT_FAILURE);
    }

    DIR *dp;
    char parent_dir_name[MAX_PATH_LENGTH] = "";
    struct dirent *structdirent;
    struct stat structstat;
    long int size = 0;

    if (NULL == (dp = opendir(pathname))) {
        perror("opendir");
        exit(EXIT_FAILURE);
    }

    while ((structdirent = readdir(dp)) != NULL) {
        strcpy(parent_dir_name, pathname);
        strcat(parent_dir_name, "/");
        strcat(parent_dir_name, structdirent->d_name);

        if (!strcmp(structdirent->d_name, ".") || !strcmp(structdirent->d_name, ".."))
            continue;

        if (structdirent->d_type == DT_DIR) {
            size += print_files_in_dir(parent_dir_name);
        } else {
            stat(parent_dir_name, &structstat);
            size += structstat.st_size;
        }
        // printf("%s ", parent_dir_name);
    }

    return size;
}