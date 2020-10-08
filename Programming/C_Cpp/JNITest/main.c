#include <stdio.h>
#include "jni.h"

int main() {
    int i;

    JNI_CreateJavaVM();
    printf("Hello, World!\n");
    return 0;
}
