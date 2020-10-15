#include <glib-2.0/glib/glist.h>
#include <stdio.h>

void fun(void);

void print_data(char *data) {
    puts(data);
}

int main(int argc, char *argv[]) {
    GList *a = NULL;
    a = g_list_append(a, 123);

    g_list_foreach(a, print_data, a->data);
}
