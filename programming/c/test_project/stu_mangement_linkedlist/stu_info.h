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
#define MAX_STR 10
#define MAX_ITEM 10

struct struct_stu_info {
    char id[MAX_STR];
    char age[MAX_STR];
    char name[MAX_STR];
    char major[MAX_STR];
    char gender[MAX_STR];
    char class_id[MAX_STR];
};

struct struct_node {
    struct struct_stu_info *struct_stu_info_ptr;
    struct struct_node *next;
};

struct struct_stu_info_op {
    void (*init)(void);
    int (*del)(char *id);
    int (*query_node)(char *id);
    int (*add)(struct struct_stu_info info);
    int (*save_to_disk)(struct struct_stu_info info);
};

// Functions of student info operations
struct struct_node *init_node();
struct struct_node *mk_node(struct struct_stu_info *stu_info);
struct struct_node *add_node(struct struct_node *node, struct struct_node *head);
// Delete node0 after node1
int del_node(struct struct_node *node, struct struct_node *head);
// Insert node0 after node1
int insert_node(struct struct_node *node0, struct struct_node *node1,
	struct struct_node *head);
struct struct_node *query_node_by_id(char *id, struct struct_node *head);
int print_data_node(struct struct_node *node);
int save_to_disk(struct struct_node *head, FILE *p);
