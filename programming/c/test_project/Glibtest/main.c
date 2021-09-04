#include <glib-2.0/glib.h>
#include <glib-2.0/glib/glist.h>
#include <stdio.h>

void print_data(char *data);

int main(int argc, char **argv) {
 GList *list = NULL;

 list = g_list_append(list, "123");

    for (int i = 0; i < 10; ++i) {
        g_list_append(list, "AAA");
    }

 g_list_foreach(list, print_data, list->data);

 g_list_free(list);
 return 0;
}

void
print_data(char *data) {
    printf("%s\n", data);
}