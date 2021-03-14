//
// Created by coolder on 3/9/21.
//
#include "stu_info.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct node_t *init_node()
{
	struct node_t *head;

	// Alloc memory for head node
	head = (struct node_t *) malloc(sizeof (struct node_t));

	// This is head, we don't use it's value

	// This is the end
	head->next = NULL;

	return head;
}

struct node_t *query_node_by_id(char *id, struct node_t *head)
{
	struct node_t *p = head;

	while (p != NULL) {
		p = p->next;
		if (strcmp(id, p->struct_stu_info_ptr->id) == 0)
			return p;
	}

	// Not found
	return NULL;
}

int print_data_node(struct node_t *node)
{
	printf("Age:%s\n", node->struct_stu_info_ptr->age);
	printf("Name:%s\n", node->struct_stu_info_ptr->name);
	printf("Gender:%s\n", node->struct_stu_info_ptr->gender);
	printf("Major:%s\n", node->struct_stu_info_ptr->major);
	printf("ID:%s\n", node->struct_stu_info_ptr->id);
	printf("Class ID:%s\n", node->struct_stu_info_ptr->class_id);

	return 1;
}

// Insert node0 after node1
int insert_node(struct node_t *node0, struct node_t *node1,
	struct node_t *head)
{
	struct node_t *cur_p = head;
	struct node_t *prev_p = NULL;
	struct node_t *next_p = NULL;

	// Traverse the list
	while (cur_p != NULL) {
		prev_p = cur_p;
		cur_p = cur_p->next;
		next_p = cur_p->next;

		// Found node to insert
		if (node1 == cur_p) {
			cur_p->next = node0;
			node0->next = next_p;
			// Already insert, break;
			break;
		}
	}

	return 1;
}

int del_node(struct node_t *node, struct node_t *head)
{
	struct node_t *cur_p = head;
	struct node_t *prev_p = NULL;
	struct node_t *next_p = NULL;

	// Traverse the list
	while (cur_p != NULL) {
		prev_p = cur_p;
		cur_p = cur_p->next;
		next_p = cur_p->next;

		if (cur_p == node) {
			// Remove node
			prev_p->next = next_p;
			cur_p->next = NULL;
			free(cur_p);

			// already removed, need to break;
			break;
		}
	}
	return 1;
}

struct node_t *mk_node(struct stu_info_t *stu_info)
{
	struct node_t *new_node;

	// Alloc new node
	new_node = (struct node_t *) malloc(sizeof (struct node_t));
	if (!new_node)
		return NULL;

	// Alloc struct stu_info
	stu_info = (struct stu_info_t *) malloc(sizeof
		(struct stu_info_t));
	if (!stu_info)
		return NULL;

	new_node->struct_stu_info_ptr = stu_info;


	return new_node;
}

struct node_t *add_node(struct node_t *node, struct node_t *head)
{
	// Scan all the list
	struct node_t *tail = head;
	while (tail->next != NULL) {
		tail = tail->next;
	}

	// Now we get tail
	// Add node to head
	tail->next = node;
	node->next = NULL;

	return node;
}

int save_to_disk(struct node_t *head, FILE *p)
{
	return 1;
}
