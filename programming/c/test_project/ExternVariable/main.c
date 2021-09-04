#include <stdio.h>
#include "var.h"

int main() {
    extern int a;
    printf("%d", a);
    fun();
}
