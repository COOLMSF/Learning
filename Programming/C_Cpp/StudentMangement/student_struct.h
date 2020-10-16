//
// Created by coolder on 10/16/20.
//

#ifndef STUDENTMANGEMENT_STUDENT_STRUCT_H
#define STUDENTMANGEMENT_STUDENT_STRUCT_H

#endif //STUDENTMANGEMENT_STUDENT_STRUCT_H

#define MAX_LEN 0x10
#define MAX_SUBJECT 0x2

typedef struct Subject_t {
    char name[MAX_LEN];
    double score;
} Subject;

typedef struct Student_t {
    // General attribute
    int age;
    char name[MAX_LEN];
    char gender[MAX_LEN];

    // Attribute for student
    char id[MAX_LEN];
    Subject stu_subject[MAX_SUBJECT];
} Student;

void init_stu_info(Student *student, char *name, char *gender, int age \
                , char *id, Subject *stu_subject, int num_of_subject);
void print_stu_info(Student *student, int size);


