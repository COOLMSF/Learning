#include <stdio.h>
#include "stu_info.h"
#include <stdlib.h>

int main()
{
	struct struct_stu_info *stu_info0 = NULL;
	struct struct_stu_info *stu_info1 = NULL;
	struct struct_stu_info *stu_info2 = NULL;
	struct struct_node *head = NULL;
	struct struct_node *new_node0, *new_node1, *new_node2;

	head = init_node();

	{
		puts("Make node0:");
		new_node0 = mk_node(stu_info0);
		// Store struct_stu_info
		puts ("Age:");
		scanf ("%s", new_node0->struct_stu_info_ptr->age);
		puts ("Name:");
		scanf ("%s", new_node0->struct_stu_info_ptr->name);
		puts ("Gender:");
		scanf ("%s", new_node0->struct_stu_info_ptr->gender);
		puts ("Major:");
		scanf ("%s", new_node0->struct_stu_info_ptr->major);
		puts ("ID:");
		scanf ("%s", new_node0->struct_stu_info_ptr->id);
		puts ("Class ID:");
		scanf ("%s", new_node0->struct_stu_info_ptr->class_id);
	}

	{
		puts("Make node1:");
		new_node1 = mk_node(stu_info1);
		// Store struct_stu_info
		puts ("Age:");
		scanf ("%s", new_node1->struct_stu_info_ptr->age);
		puts ("Name:");
		scanf ("%s", new_node1->struct_stu_info_ptr->name);
		puts ("Gender:");
		scanf ("%s", new_node1->struct_stu_info_ptr->gender);
		puts ("Major:");
		scanf ("%s", new_node1->struct_stu_info_ptr->major);
		puts ("ID:");
		scanf ("%s", new_node1->struct_stu_info_ptr->id);
		puts ("Class ID:");
		scanf ("%s", new_node1->struct_stu_info_ptr->class_id);
	}

	{
		puts("Make node2:");
		new_node2 = mk_node(stu_info2);
		// Store struct_stu_info
		puts ("Age:");
		scanf ("%s", new_node2->struct_stu_info_ptr->age);
		puts ("Name:");
		scanf ("%s", new_node2->struct_stu_info_ptr->name);
		puts ("Gender:");
		scanf ("%s", new_node2->struct_stu_info_ptr->gender);
		puts ("Major:");
		scanf ("%s", new_node2->struct_stu_info_ptr->major);
		puts ("ID:");
		scanf ("%s", new_node2->struct_stu_info_ptr->id);
		puts ("Class ID:");
		scanf ("%s", new_node2->struct_stu_info_ptr->class_id);
	}

	add_node(new_node0, head);
	add_node(new_node1, head);
	add_node(new_node2, head);

	struct struct_node *node_return;
	node_return = query_node_by_id("185", head);

	struct struct_node *p = head->next;
	while (p) {
		print_data_node(p);
		p = p->next;
	}
}
