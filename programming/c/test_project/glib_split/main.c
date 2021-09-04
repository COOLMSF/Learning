#include "allheaders.h"

int main() {
    gchar **split_list;
    struct sockaddr sa;

    split_list = g_strsplit("This is a test.", " ", 0);

    while (*split_list)
        puts(*split_list++);

    g_strfreev(split_list);
}
