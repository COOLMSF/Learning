//
// Created by coolder on 3/9/21.
//
#include "stu_info.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct struct_node *init_node()
{
	struct struct_node *head;

	// Alloc memory for head node
	head = (struct struct_node *) malloc(sizeof (struct struct_node));

	// This is head, we don't use it's value

	// This is the end
	head->next = NULL;

	return head;
}

struct struct_node *query_node_by_id(char *id, struct struct_node *head)
{
	struct struct_node *p = head;

	while (p != NULL) {
		p = p->next;
		if (strcmp(id, p->struct_stu_info_ptr->id) == 0)
			return p;
	}

	// Not found
	return NULL;
}

int print_data_node(struct struct_node *node)
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
int insert_node(struct struct_node *node0, struct struct_node *node1,
	struct struct_node *head)
{
	struct struct_node *cur_p = head;
	struct struct_node *prev_p = NULL;
	struct struct_node *next_p = NULL;

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

int del_node(struct struct_node *node, struct struct_node *head)
{
	struct struct_node *cur_p = head;
	struct struct_node *prev_p = NULL;
	struct struct_node *next_p = NULL;

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

struct struct_node *mk_node(struct struct_stu_info *stu_info)
{
	struct struct_node *new_node;

	// Alloc new node
	new_node = (struct struct_node *) malloc(sizeof (struct struct_node));
	if (!new_node)
		return NULL;

	// Alloc struct stu_info
	stu_info = (struct struct_stu_info *) malloc(sizeof
		(struct struct_stu_info));
	if (!stu_info)
		return NULL;

	new_node->struct_stu_info_ptr = stu_info;


	return new_node;
}

struct struct_node *add_node(struct struct_node *node, struct struct_node *head)
{
	// Scan all the list
	struct struct_node *tail = head;
	while (tail->next != NULL) {
		tail = tail->next;
	}

	// Now we get tail
	// Add node to head
	tail->next = node;
	node->next = NULL;

	return node;
}

int save_to_disk(struct struct_node *head, FILE *p)
{
	return 1;
}
