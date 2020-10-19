#include "allheaders.h"

#define MAX_BUFFER 1024

void show_usage(void);
int do_cp(int fd_dst, int fd_src, size_t size);

int main(int argc, char *argv[]) {

    if (argc < 5)
        show_usage();

    static int verbose_flag;
    int c;
    char dst_filename[30], src_filename[30];

    while (1) {
        static struct option long_options[] = {
                { .name = "source", .flag = 0, .has_arg = required_argument, .val = 's'},
                { .name = "destination", .flag = 0, .has_arg = required_argument, .val = 'd'},
                { .name = "verbose", .flag = 0, .has_arg = no_argument, .val = 'v'}
        };

        int option_index = 0;
        c = getopt_long(argc, argv, "vs:d:", long_options, &option_index);

        if (-1 == c)
            break;

        switch (c) {
            case 's':
                strcpy(src_filename, optarg);
                break;
            case 'd':
                strcpy(dst_filename, optarg);
                break;
            case 'v':
                verbose_flag = true;
                break;
            default:
                show_usage();
        }
    }


    int fd_src, fd_dst;
    struct stat fd_src_stat;

    if (verbose_flag)
        printf("Copying \"%s\" to \"%s\"\n", src_filename, dst_filename);

    // Open src file
    if ((fd_src = open(src_filename, O_RDONLY)) < 0)
        MyError("open src file");

    // Get statistic of src file
    if (-1 == fstat(fd_src, &fd_src_stat))
        MyError("fstat src file");

    // if dst file does not exists, create it, do copy
    if (-1 == access(dst_filename, F_OK)) {

        // Create
        if (-1 == (fd_dst = open(dst_filename, O_WRONLY | O_APPEND | O_CREAT, 0644)))
            MyError("create dst file");

        // Do copy
        do_cp(fd_dst, fd_src, fd_src_stat.st_size);
    } else {

        // Open file on write mode
        if (-1 == (fd_dst = open(dst_filename, O_WRONLY)))
        MyError("create dst file");

        puts("File already exists, overwrite?(Y/N)");

        if ('Y' == getchar())
            do_cp(fd_dst, fd_src, fd_src_stat.st_size);
    }

    close(fd_src);
    close(fd_dst);
}