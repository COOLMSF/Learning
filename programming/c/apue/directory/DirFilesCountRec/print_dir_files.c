//
// Created by coolder on 10/19/20.
//
#include "allheaders.h"

void print_dir_files(char *dir_name) {
    DIR *dir_stream;
    if (NULL == (dir_stream = opendir(dir_name)))
        MyError("opendir");

    struct dirent *structdirent;

    while (NULL != (structdirent = readdir(dir_stream))) {

        // Skip "." and ".." files
        if (strcmp(structdirent->d_name, ".") == 0 || 0 == strcmp(structdirent->d_name, ".."))
            continue;

        if (structdirent->d_type == DT_DIR) {
            char dir_str[255] = { 0 };
            strcat(dir_str, dir_name);
            strcat(dir_str, "/");
            strcat(dir_str, structdirent->d_name);
            //printf("Name:%s\n", dir_str);
            print_dir_files(dir_str);
        }

        // Skip the directory name, or it will print all files in directory and the dir name
        //if (structdirent->d_type != DT_DIR)
        //    puts(structdirent->d_name);
    }

    closedir(dir_stream);
}

