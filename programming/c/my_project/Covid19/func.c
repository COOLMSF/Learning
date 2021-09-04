//
// Created by coolder on 4/1/21.
//
#include "user_info.h"
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

struct node_t *mk_node(struct user_info_t *user_info)
{
	struct node_t *new_node;

	// Alloc new node
	new_node = (struct node_t *) malloc(sizeof (struct node_t));
	if (!new_node)
		return NULL;

	// Alloc struct user_info
	// user_info = (struct user_info_t *) malloc(sizeof
	//	                                        (struct user_info_t));
	// if (!user_info)
	// 	return NULL;

	new_node->struct_user_info_ptr = user_info;


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

void show_usage(char *argv[])
{
	fprintf(stderr, "usage:%s -c data-structure-type('list' or 'tree')", argv[0]);
}

void show_menu()
{
	printf("1) Introduce user\n");
	printf("2) Introduce visit to venue\n");
	printf("3) Remove user\n");
	printf("4) Check which users have been in a particular place\n");
	printf("5) Save to file\n");
	printf("6) Retrieve data from file\n");
	printf("7) Show users\n");
	printf("8) Exit\n");
}

void save_to_disk(struct node_t *head)
{
	if (is_empty(head)) {
		printf("6) Retrieve file first!\n");
		exit(-1);
	}

	char filename[MAX_LEN];
	FILE *fp = NULL;
	struct node_t *p = head->next;

	printf("filename to save:");
	scanf("%s", filename);

	fp = fopen(filename, "w");
	if (fp == NULL) {
		perror("fopen");
		exit(-1);
	}

	while (p != NULL) {
		char buf[MAX_LEN];
		sprintf(buf, "%s, %s, %s", p->struct_user_info_ptr->name,
	  p->struct_user_info_ptr->user_desc, p->struct_user_info_ptr->venue);
		fwrite(buf, strlen(buf), 1, fp);
		fwrite("\n", 1, 1, fp);
		p = p->next;
	}
	printf("---------------------------------------\n");
	printf("Save file done\n");
	printf("---------------------------------------\n");
	fclose(fp);
}

// Interactive function
void introduce_user(struct node_t *head)
{
	if (is_empty(head)) {
		printf("6) Retrieve file first!\n");
		exit(-1);
	}

	char username[MAX_LEN];
	struct node_t *p = head->next;

	printf("User name:");
	scanf("%s", username);

	while (p != NULL) {
		if ((strcmp(p->struct_user_info_ptr->name, username) == 0)) {
			printf("---------------------------------------\n");
			printf("%s\n", p->struct_user_info_ptr->user_desc);
			printf("---------------------------------------\n");
		}
		p = p->next;
	}
}

void introduce_venue(struct node_t *head)
{
	if (is_empty(head)) {
		printf("6) Retrieve file first!\n");
		exit(-1);
	}

	struct node_t *p = head->next;
	char username[MAX_LEN];
	char venue[MAX_LEN];

	printf("Username:");
	scanf("%s", username);
	printf("Venue:");
	scanf("%s", venue);

	while (p != NULL) {
		if (strcmp(p->struct_user_info_ptr->name, username) == 0) {
			strcat(venue, " ");
			strcat(p->struct_user_info_ptr->venue, venue);
		}
		p = p->next;
	}
}

void remove_user(struct node_t * head)
{
	if (is_empty(head)) {
		printf("6) Retrieve file first!\n");
		exit(-1);
	}

	struct node_t *p = head->next;
	char username[MAX_LEN];
	printf("Username:");
	scanf("%s", username);

	if (!is_empty(head)) {
		while (p != NULL) {
			// user name found, delete it
			if (strcmp (p->struct_user_info_ptr->name, username) ==
			    0) {
				del_node (p, head);
				printf("---------------------------------------\n");
				printf("user deleted\n");
				printf("---------------------------------------\n");
				break;
			}
			p = p->next;
		}
	}
}

void at_place(struct node_t *head)
{
	if (is_empty(head)) {
		printf("6) Retrieve file first!\n");
		exit(-1);
	}

	struct node_t *p = head->next;
	char username[MAX_LEN];
	char venue[MAX_LEN];

	printf("Username:");
	scanf("%s", username);
	printf("Venue:");
	scanf("%s", venue);

	while (p != NULL) {
		if (strcmp(p->struct_user_info_ptr->name, username) == 0) {
			if (strstr(p->struct_user_info_ptr->venue, venue) != NULL) {
				printf("---------------------------------------\n");
				printf("have been in this place\n");
				printf("---------------------------------------\n");
			} else {
				printf("---------------------------------------\n");
				printf("haven't benn in this place\n");
				printf("---------------------------------------\n");
			}
		}
		p = p->next;
	}

}

void retrieve_data_from_file(struct node_t *head)
{
	char filename[MAX_LEN];
	char buffer[MAX_LEN];
	FILE *fp;

	printf("Path to data file:");
	scanf("%s", filename);
	if ((fp = fopen(filename, "r")) == NULL) {
		perror("fopen");
		exit(-1);
	}
        // -1 to allow room for NULL terminator for really long string
        while (fgets(buffer, MAX_LEN - 1, fp))
        {
	        struct user_info_t *i = malloc(sizeof (struct user_info_t));
	        struct node_t *new_node = NULL;
        	char name[MAX_LEN], user_desc[MAX_LEN], venue[MAX_LEN];

	        // Remove trailing newline
        	buffer[strcspn(buffer, "\n")] = 0;
        	sscanf(buffer, "%[^','], %[^','], %[^',']", i->name, i->user_desc, i->venue);
        	new_node = mk_node(i);
        	add_node(new_node, head);
        }
        printf("---------------------------------------\n");
        printf("Retrieve data done!\n");
	printf("---------------------------------------\n");
	fclose(fp);
}

void show_user(struct node_t *head)
{
	printf("---------------------------------------\n");
	if (!is_empty(head)) {
		struct node_t *p = head->next;
		while (p != NULL) {
			printf("Name:%s\n", p->struct_user_info_ptr->name);
			printf("User desc:%s\n", p->struct_user_info_ptr->user_desc);
			printf("Place that visit:%s\n", p->struct_user_info_ptr->venue);
			printf("\n");
			p = p->next;
		}
	} else {
		printf("---------------------------------------\n");
		printf("6) Retrieve data first!\n");
		printf("---------------------------------------\n");
	}
	printf("---------------------------------------\n");
}

int is_empty(struct node_t *head)
{
	if (head->next == NULL)
		return 1;
	else
		return 0;
}