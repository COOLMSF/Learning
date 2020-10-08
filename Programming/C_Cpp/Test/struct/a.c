#include<stdio.h>

struct student {
    int age;
    int num;
};

struct student stu1;
struct student *p;


int
main(void) {
    stu1.age = 22;
    stu1.num = 110;

    p = &stu1;

    // (*p) == stu1;
    

    printf("age of stu1 :%d\n", p->age);
    printf("number of stu1 %d\n", p->num);
}
