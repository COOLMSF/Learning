//
// Created by coolder on 4/1/21.
//
#include <stdio.h>

#define MAX_VENUE 10
#define MAX_LEN 256

struct user_info_t {
    char name[MAX_LEN];
    char user_desc[MAX_LEN * 10];
    char venue[MAX_VENUE];
};

struct node_t {
    struct user_info_t *struct_user_info_ptr;
    struct node_t *next;
};

// Functions of user info operations
struct node_t *init_node();
struct node_t *mk_node(struct user_info_t *user_info);
struct node_t *add_node(struct node_t *node, struct node_t *head);
int del_node(struct node_t *node, struct node_t *head);
// Insert node0 after node1
int insert_node(struct node_t *node0, struct node_t *node1,
                struct node_t *head);
struct node_t *query_node_by_id(char *id, struct node_t *head);
int print_data_node(struct node_t *node);
void save_to_disk(struct node_t *head);
void show_menu();
void show_usage(char *argv[]);

// interactive function
void introduce_user(struct node_t *head);
void introduce_venue(struct node_t *head);
void remove_user(struct node_t *head);
void at_place(struct node_t *head);
void retrieve_data_from_file(struct node_t *head);
void show_user(struct node_t *head);
int is_empty(struct node_t *head);
