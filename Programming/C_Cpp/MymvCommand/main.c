#include "allheaders.h"
#include "MymvCommand.h"

/*
 * This program is aim to replace mv command, to show progress
 * bar while moving file, it call "/bin/progress" waiting child and fork
 * another process to call "/bin/mv" command. It will only be called if the
 * destination file is larger than 50M, because if the file is too small, mv
 * command will be done in a very short time that "/bin/process" program can't
 * see it.
 * */

int main(int argc, char *argv[]) {

    if (argc < 3) {
        fprintf(stderr, "%s src dst\n", argv[0]);
        fprintf(stderr, "man mv to see usage\n");
        exit(EXIT_FAILURE);
    }

    char src[MAX_PATH_LEN];
    char dst[MAX_PATH_LEN];

    // Now we assume ./mymv src dst, but actually it's not, we should use option handler
    strcpy(src, argv[1]);
    strcpy(dst, argv[2]);

    // Src file must exist
    if (-1 == access(src, F_OK)) {
        perror("access");
        exit(EXIT_FAILURE);
    }

    // If dst file exist, overwrite?
    if (-1 != access(dst, F_OK)) {
        printf("Destination file \"%s\" already exists are you sure to overwrite?\n", dst);
        printf("This cannot be undone, enter 'Y' to overwrite!!!");

        if ('Y' != getchar()) {
            puts("User interrupted");
            exit(EXIT_FAILURE);
        }
    }

    size_t size_of_dir;

    // Get size of src directory, using my function,
    // we can also use pipe to call du -sh command without rewriting.
    // This function is borrow from stackoverflow with some bugs.

    size_of_dir = countDiskUsage(argv[1]);

    // We only show process bar if size of file is larger than 50M,
    // because with small file, call_mv function exit so fast, that
    // may not be called. This will cause the process bar will not
    // show sometimes.

    if (size_of_dir > 50000000) {
        printf("File size over 50M, show process bar\n");

        printf("Source file size:%zu\n", size_of_dir);

        // Show process bar
        call_progress();

        // Just past arguments to "/bin/mv"
        call_mv(argc, argv);

    } else {
        printf("Source file size:%zu\n", size_of_dir);
        call_mv(argc, argv);
    }

    printf("Done\n");
}