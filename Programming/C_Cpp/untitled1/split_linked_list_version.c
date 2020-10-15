//
// Created by coolder on 10/14/20.
//

/*
 * Glib linked list version of split
 */

#define MAX_STRING_LEN 255
#include "glib-2.0/glib/glist.h"
#include <stdio.h>
#include <string.h>

GList *split(const char *string, const char *delim) {

    if (strlen(string) > MAX_STRING_LEN) {
        fprintf(stderr, "String len out of bound");
        exit(EXIT_FAILURE);
    }

    // Alloc space and copy string
    char *string_backup = malloc(MAX_STRING_LEN * sizeof(char));
    string_backup = strdup(string);

    char *txt;
    GList *result_list = NULL;

    txt = strtok(string_backup, delim);

    while (txt) {
        result_list = g_list_append(result_list, txt);
        txt = strtok(NULL, delim);
    }

    free(string_backup);
    return result_list;
}

void print_data(char *data) {
    puts(data);
}


