#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "user_info.h"

struct node_t *head;

int main (int argc, char *argv[]) {
	head = init_node();

	char data_structure[MAX_LEN];
	char data_file[MAX_LEN];
	int input;

	// Check arguments
	if (argc != 3) {
		show_usage(argv);
		exit(-1);
	}
	if (!((strcmp(argv[1], "-c") == 0) && ((strcmp(argv[2], "list") == 0)
	|| (strcmp(argv[2], "tree") == 0)))) {
		show_usage(argv);
		exit(-1);
	}


	for (;;) {
		show_menu();
		// printf("Input your choice:");
		scanf("%d", &input);

		switch (input) {
			case 1:
				introduce_user(head);
				break;
			case 2:
				introduce_venue(head);
				break;
			case 3:
				remove_user(head);
				break;
			case 4:
				at_place(head);
				break;
			case 5:
				save_to_disk(head);
				break;
			case 6:
				retrieve_data_from_file(head);
				break;
			case 7:
				show_user(head);
				break;
			case 8:
				exit(0);
			default:
				printf ("Unlabeled choice\n");
				exit (-1);
		}
	}
}
