//
// Created by coolder on 10/16/20.
//
#include "allheaders.h"
#include "student_struct.h"

void print_stu_info(Student *student, int size) {
    for (int i = 0; i < size; ++i) {

        printf("Name:%s\n", (student + i) ->name);
        printf("Gender:%s\n", (student + i) ->gender);
        printf("Id:%s\n", (student + i) ->id);
        printf("Age:%d\n", (student + i) ->age);

        // Print Subject structure
        puts("--------------------");
        for (int j = 0; j < MAX_SUBJECT; ++j) {
            printf("Subject Name:%s Score:%f\n", student[i].stu_subject[j].name,
                   student[i].stu_subject[j].score);
        }
        puts("-------------------");
    }
}

void init_stu_info(Student *student, char *name, char *gender, int age \
                , char *id, Subject *stu_subject, int num_of_subject) {

                student->age = age;

                strncpy(student->name, name, MAX_LEN);
                strncpy(student->id, id, MAX_LEN);
                strncpy(student->gender, gender, MAX_LEN);

                memcpy(student->stu_subject, stu_subject, sizeof(struct Subject_t) * num_of_subject);
}
