//
// Created by coolder on 10/13/20.
//

#ifndef ERRORHANDLER_MYERROR_H
#define ERRORHANDLER_MYERROR_H

#endif //ERRORHANDLER_MYERROR_H

#include <stdio.h>
#include <stdlib.h>

#define MyError(message) { \
perror(message);           \
fprintf(stderr, "\nError occurs!!!\nFileName:%s\nLine:%d\nDate:%s\nTime:%s\n", __FILE__, __LINE__, __DATE__, __TIME__); \
fprintf(stderr, "Core file generated, use coredumpctl dedebug to see more info ^_^.\n");                                 \
abort();                     \
}
