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

struct stu_info_t {
    char id[MAX_STR];
    char age[MAX_STR];
    char name[MAX_STR];
    char major[MAX_STR];
    char gender[MAX_STR];
    char class_id[MAX_STR];
};

struct node_t {
    struct stu_info_t *struct_stu_info_ptr;
    struct node_t *next;
};

struct stu_info_op_t {
    void (*init)(void);
    int (*del)(char *id);
    int (*query_node)(char *id);
    int (*add)(struct stu_info_t *info);
    int (*save_to_disk)(struct stu_info_t *info);
};

// Functions of student info operations
struct node_t *init_node();
struct node_t *mk_node(struct stu_info_t *stu_info);
struct node_t *add_node(struct node_t *node, struct node_t *head);
int del_node(struct node_t *node, struct node_t *head);
// Insert node0 after node1
int insert_node(struct node_t *node0, struct node_t *node1,
	struct node_t *head);
struct node_t *query_node_by_id(char *id, struct node_t *head);
int print_data_node(struct node_t *node);
int save_to_disk(struct node_t *head, FILE *p);
