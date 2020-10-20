#include <stdio.h>

void a(int), b(int);

int main() {
    a(1);
    b(2);
}

void a(int w) {
    printf("%d", w);
}

void b(int e) {
    printf("%d", e);
}