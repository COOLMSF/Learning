//
// Created by coolder on 10/18/20.
//
#include "allheaders.h"

int do_cp(int fd_dst, int fd_src, size_t size) {

    // Create buffer that can hold the whole src file
    char read_buf[size];

    //if (-1 == read(fd_src, read_buf, size))
    //    MyError("read buf from src file");

    read(fd_src, read_buf, size);

    if (-1 == write(fd_dst, read_buf, size))
        MyError("write to dst file");
}