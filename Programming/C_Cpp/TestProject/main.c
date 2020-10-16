#include <stdio.h>

#define MAX_STR_LEN 255

struct Student {
    char age;
    char name[MAX_STR_LEN];
    char gender[MAX_STR_LEN];
};

typedef struct Student stu;

void
print_data(stu student) {
    printf("Name:%s\n", student.name);
    printf("Gender:%s\n", student.gender);
    printf("Age:%d\n", student.age);
}

int main() {
    int count = 0;

    for (int i = 1; i < 10; ++i) {
        if (count % 2 == 0) {
            printf("\n");
        }
        printf("%d ", i);
        count++;
    }
}
