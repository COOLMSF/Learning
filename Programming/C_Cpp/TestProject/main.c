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
}
