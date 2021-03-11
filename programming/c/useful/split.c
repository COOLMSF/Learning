//
// Created by coolder on 10/14/20.
//

/*
 * Strok function in stdio.h will change buffer, I want to implement a
 * new one with operation on copied buffer.
 *
 * This function will make a copy of buffer and return a pointer array
 * that holds split strings.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_LEN_OF_STRING 255
#define MAX_LEN_OF_EACH_ELEMENT 30
#define MAX_ELEMENT 30

char **split (const char *string, const char *delim) {

    if (strlen(string) > MAX_LEN_OF_STRING) {
        fprintf(stderr, "String length out of bound.");
        exit(EXIT_FAILURE);
    }

    // Alloc size for backup buffer
    char *string_backup = malloc(MAX_LEN_OF_STRING);
    // Copy string to backup
    string_backup = strdup(string);

    // Alloc size of split strings buffer that return
    char **buf = (char **) malloc(MAX_ELEMENT * sizeof(char *));
    for (int i = 0; i < MAX_ELEMENT; ++i) {
        buf[i] = malloc(sizeof(char) * MAX_LEN_OF_EACH_ELEMENT);
    }

    char *split_string;
    split_string = strtok(string_backup, delim);

    // Store split strings to *buf[], I think here should use a linked list
    // rather than *buf[]
    int i = 0;
    while (split_string) {
        strcpy(buf[i++], split_string);
        split_string = strtok(NULL, delim);
    }

    free(string_backup);

    return buf;
}

//
//int
//main(void) {
//    char **buf = malloc(MAX_LEN_OF_EACH_ELEMENT * MAX_ELEMENT);
//    buf = split("coolder is the best hacker in the world", " ");
//
//    for (int i = 0; i < MAX_ELEMENT; ++i) {
//        puts(buf[i]);
//    }
//}