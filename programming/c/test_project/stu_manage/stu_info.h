//
// Created by coolder on 3/8/21.
//
#include <stdio.h>

#ifndef STU_MANAGE_STU_INFO_H
#define STU_MANAGE_STU_INFO_H

#endif //STU_MANAGE_STU_INFO_H

#define MAX_ID_LEN 6
#define MAX_NAME_LEN 10
#define MAX_MAJOR_LEN 20
#define MAX_ITEM 10

struct stu_info {
    int age;
    char gender[5];
    char class_id[4];
    char id[MAX_ID_LEN];
    char name[MAX_NAME_LEN];
    char major[MAX_MAJOR_LEN];

    struct stu_info_op *op;
    // struct stu_info_op *op;
    struct stu_info *next;
};

// Student info operation
struct stu_info_op {
    void (*init)(void);
    int (*del)(char *id);
    int (*query)(char *id);
    int (*add)(struct stu_info info);
    int (*save_to_disk)(struct stu_info info);
};

// Functions of student info operations
void init();
int del(char *id, struct stu_info *stu_info_arr);
int query(char *id, struct stu_info *stu_info_arr);
int add(struct stu_info *info, struct stu_info *stu_info_arr);
void save_to_disk(struct stu_info *stu_info_arr, FILE *p);
