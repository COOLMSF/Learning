#include "allheaders.h"
#include "split.h"

void
print_data(char *string) {
    printf("%s ", string);
}

int
main(void) {
    GList *list = NULL;

    list = split("1 2 3 4 4 5 5 6 6 7 7 7 1 2 2 However coolder is the best hacker", " ");

    g_list_foreach(list, (GFunc) print_data, list->data);

    free(list);
}