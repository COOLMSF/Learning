#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define LH 1 // left high
#define RH (-1) // right high
#define EH  0 // equal high

struct user_info_t {
    char name[100];
    char venue[100];
};

typedef struct TNode{
    char data[100];// data that structure hold
    int number;// counter
    int bf;// balance factir
    struct TNode *LeftChild;// left child
    struct TNode *RightChild;// right child
}TNode,*BTree;

/*
 * separate data and linked list node
 * It's more flexible to make structure clear, I think...
 */

struct node_t {
    struct user_info_t *user_ptr;
    struct node_t *next;
};

struct node_t *head;

struct user_bt {
    char name[100];
    char venue[100];
    struct user_bt *left;
    struct user_bt *right;
};

/*
 * Some struct for tree
 */
typedef struct BiTNode
{
    /*
     * Tree should contain data, left child and right child
     */
	int data;
	struct BiTNode *LeftChild, *RightChild;
} BiTNode, *BiTree;

struct node_t *init_node()
{
	// Alloc memory for head node
	head = (struct node_t *) malloc(sizeof (struct node_t));
	// This is the end
	head->next = NULL;
	return head;
}

/*
 * Check if a node is empty,
 * we can't insert or remove value when head is empty(NULL)
 */
int is_empty(void)
{
	if (head->next == NULL)
		return 1;
	else
		return 0;
}

/*
 * Delete a node
 *
 * Make a dialgram, this will be more clear
 */
int del_node(struct node_t *node)
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
			// Note here, don't forget free it!
			free(cur_p);

			// already removed, need to break;
			break;
		}
	}
	return 1;
}

/*
 * Make new node, by specify user information
 */
struct node_t *mk_node(struct user_info_t *user_info)
{
	struct node_t *new_node;

	// Alloc new node
	new_node = (struct node_t *) malloc(sizeof (struct node_t));
	// If alloc memory failed
	if (!new_node)
		return NULL;
	new_node->user_ptr = user_info;

	return new_node;
}

/*
 * Add new node after head
 */
struct node_t *add_node(struct node_t *node)
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

/*
 * Save linked list node to file
 */
void save_to_file_ll()
{
	if (is_empty()) {
		printf("6) Retrieve file first!\n");
		exit(-1);
	}

	char file[100];
	FILE *fp = NULL;
	struct node_t *p = head->next;

	printf("file to save:");
	scanf("%s", file);

	/*
	 * Open file as read
	 */
	fp = fopen(file, "w");
	if (fp == NULL) {
		perror("fopen");
		exit(-1);
	}

	while (p != NULL) {
		char buf[100];
		/*
		 * formatted print
		 */

		/*
		 * It can be shorten to fprintf(fp, "%s, %s", p->user.....)
		 */
		sprintf(buf, "%s, %s", p->user_ptr->name,
		        p->user_ptr->venue);
		fwrite(buf, strlen(buf), 1, fp);
		/*
		 * Write new line
		 */
		fwrite("\n", 1, 1, fp);
		p = p->next;
	}
	printf("***************************************\n");
	printf("Save file done\n");
	printf("***************************************\n");
	fclose(fp);
}

// Interactive function
void insert_user_ll()
{
	if (is_empty()) {
		printf("6) Retrieve file first!\n");
		exit(-1);
	}

	char username[100];
	struct node_t *new_node;
	// Alloc memory
	struct user_info_t *user_info = malloc(sizeof (struct user_info_t));

	// Ask for name
	printf("User name:");
	scanf("%s", username);
	// Make new node
	new_node = mk_node(user_info);

	// copy data
	strcpy(user_info->name, username);
	// link data
	new_node->user_ptr = user_info;
	add_node(new_node);
}

void insert_visit_ll()
{
	if (is_empty()) {
		printf("6) Retrieve file first!\n");
		exit(-1);
	}

	struct node_t *p = head->next;
	char username[100];
	char venue[100];

	// Ask for name
	printf("Username:");
	scanf("%s", username);
	// Ask for place
	printf("Venue:");
	scanf("%s", venue);

	while (p != NULL) {
		// Right username
		if (strcmp(p->user_ptr->name, username) == 0) {
			strcat(venue, " ");
			strcat(p->user_ptr->venue, venue);
		}
		p = p->next;
	}
}

void remove_user_ll()
{
	if (is_empty()) {
		printf("6) Retrieve file first!\n");
		exit(-1);
	}

	struct node_t *p = head->next;
	char username[100];
	printf("Username:");
	scanf("%s", username);

	if (!is_empty()) {
		while (p != NULL) {
			// user name found, delete it
			if (strcmp (p->user_ptr->name, username) ==
			    0) {
				del_node (p);
				printf("***************************************\n");
				printf("user deleted\n");
				printf("***************************************\n");
				break;
			}
			p = p->next;
		}
	}
}

void at_place()
{
	if (is_empty()) {
		printf("6) Retrieve file first!\n");
		exit(-1);
	}

	struct node_t *p = head->next;
	char username[100];
	char venue[100];

	printf("Username:");
	scanf("%s", username);
	printf("Venue:");
	scanf("%s", venue);

	while (p != NULL) {
		/*
		 * Find the correct username
		 */
		if (strcmp(p->user_ptr->name, username) == 0) {
			if (strstr(p->user_ptr->venue, venue) != NULL) {
				printf("***************************************\n");
				printf("have been in this place\n");
				printf("***************************************\n");
			} else {
				printf("***************************************\n");
				printf("haven't benn in this place\n");
				printf("***************************************\n");
			}
		}
		p = p->next;
	}

}

void read_from_file_ll()
{
	char file[100];
	char buffer[100];
	FILE *fp;

	printf("Path to data file:");
	scanf("%s", file);
	if ((fp = fopen(file, "r")) == NULL) {
		perror("fopen");
		exit(-1);
	}
	// -1 to allow room for NULL terminator for really long string
	while (fgets(buffer, 100 - 1, fp))
	{
		struct user_info_t *i = malloc(sizeof (struct user_info_t));
		struct node_t *new_node = NULL;

		// Remove trailing newline
		buffer[strcspn(buffer, "\n")] = 0;
		sscanf(buffer, "%[^','], %[^',']", i->name, i->venue);
		new_node = mk_node(i);
		add_node(new_node);
	}
	printf("***************************************\n");
	printf("Retrieve data done!\n");
	printf("***************************************\n");
	fclose(fp);
}

void show_user()
{
	printf("***************************************\n");
	if (!is_empty()) {
		struct node_t *p = head->next;
		while (p != NULL) {
			printf("Name:%s\n", p->user_ptr->name);
			printf("Place that visit:%s\n", p->user_ptr->venue);
			printf("\n");
			p = p->next;
		}
	} else {
		printf("***************************************\n");
		printf("6) Retrieve data first!\n");
		printf("***************************************\n");
	}
	printf("***************************************\n");
}

// Init tree
void InitBTree(BTree *T){
	(*T)=NULL;
}

// Right rotate tree
void R_Rotate(BTree *p){
	BTree T2;
	T2=(*p)->LeftChild;
	(*p)->LeftChild=T2->RightChild;
	T2->RightChild=(*p);
	*p=T2;
}

// Left rotate tree
void L_Rotate(BTree *p){
	BTree T2;
	T2=(*p)->RightChild;
	(*p)->RightChild=T2->LeftChild;
	T2->LeftChild=(*p);
	// Point to new node
	*p=T2;
}

void RightBalance(BTree *T){
	BTree RT,LT;
	RT=(*T)->RightChild;
	switch(RT->bf){
		case RH:
			(*T)->bf=RT->bf=EH;
			L_Rotate(T);
			break;
		case EH:
			(*T)->bf = -1;
			RT->bf = 1;
			L_Rotate(&(*T));
			break;
		case LH:
			LT=RT->LeftChild;
			switch(LT->bf)
			{
				case LH:(*T)->bf=EH;RT->bf=RH;break;
				case EH:(*T)->bf=EH;RT->bf=EH;break;
				case RH:(*T)->bf=LH;RT->bf=EH;break;
			}
			LT->bf=EH;
			R_Rotate(&(*T)->RightChild);
			L_Rotate(T);
	}
}

void LeftBalance(BTree *T){
	BTree LT,RT;
	LT=(*T)->LeftChild;
	switch(LT->bf){
		case LH:
			(*T)->bf=LT->bf=EH;
			// Why rotate?
			R_Rotate(T);
			break;
		case EH:
			(*T)->bf = 1;
			LT->bf = -1;
			R_Rotate(&(*T));
			break;
		case RH:
			RT=LT->RightChild;
			switch(RT->bf){
				/*
				 * Get all cases
				 */
				case LH:(*T)->bf=RH;LT->bf=EH; break;

				case EH:(*T)->bf=LT->bf=EH; break;
				case RH:(*T)->bf=EH;LT->bf=LH; break;
			}
			RT->bf=EH;
			L_Rotate(&(*T)->LeftChild);
			R_Rotate(T);
	}
}


// Some test here
void getData(BTree T){
	if(T!=NULL){
		getData(T->LeftChild);
		int i;
		for(i=0;i<T->number;i++){
			printf("%s    ",T->data);
		}
		getData(T->RightChild);
	}

}

void getData1(BTree T){
	if(T!=NULL){
		printf("***************************************\n");
		printf("%s    ",T->data);
		printf("***************************************\n");
		getData1(T->LeftChild);
		int i;
		for(i=0;i<T->number;i++){

		}
		getData1(T->RightChild);
	}

}
void  getData2( BTree T){
	if(T!=NULL){
		getData2(T->LeftChild);
		int i;
		for(i=0;i<T->number;i++){
		}
		getData2(T->RightChild);
		printf("***************************************\n");
		printf("%s    ",T->data);
		printf("***************************************\n");
	}

}

// Insert value of string, because we will use name as char *
int InsertVAL(BTree *T,char *key,int *taller){
	if(*T==NULL){// new node
		*T=(BTree)malloc(sizeof(TNode));
		strcpy((char *) &((*T)->data), key);
		(*T)->number=1;
		(*T)->bf=EH;
		(*T)->LeftChild=(*T)->RightChild=NULL;
		*taller=1;
	}else  if((*T)->data==key){
		(*T)->number=(*T)->number+1;
		*taller=0;
		return 0 ;
	}else if(key<(*T)->data){// scan left tree
		if(!InsertVAL(&(*T)->LeftChild,key,&*taller)) return 0;
		if(*taller){
			switch((*T)->bf){
				case LH:LeftBalance(&(*T));*taller=0; break;
				case EH: (*T)->bf=LH; *taller=1;break;
				case RH: (*T)->bf=EH; *taller=0;break;
			}
		}
	}else {
		if(!InsertVAL(&(*T)->RightChild,key,&*taller)) return 0;
		if(*taller){
			switch((*T)->bf){
				case LH: (*T)->bf=EH; *taller=0; break;
				case EH: (*T)->bf=RH; *taller=1; break;
				case RH:RightBalance(&(*T));*taller=0;break;
			}
		}
	}
	return 1;
}

// Delete node
/*
 * This is hard
 */
int DeleteNOde(BTree *T,char *data,int *taller){
	if((*T)==NULL||((strcmp((const char *) &(*T)->data, data) == 0)&& (*T)->number > 1)){
		(*T)->number=(*T)->number-1;
		return 0;
	}else if((*T)->data==data){
		if((*T)->LeftChild==NULL){
			BTree  p=(*T);
			(*T)=(*T)->RightChild;
			*taller=1;
			printf("***************************************\n");
			printf("%sDelete successful\n",data);
			printf("***************************************\n");
			free(p);
		}else if((*T)->RightChild==NULL){
			BTree p=(*T);
			(*T)=(*T)->LeftChild;
			*taller=1;
			free(p);
		}else{
			BTree p=(*T)->LeftChild;
			while(p->RightChild!=NULL){
				p=p->RightChild;
			}
			strcpy((char *) &(*T)->data, p->data);
			DeleteNOde(&(*T)->LeftChild,p->data,&*taller);
		}
	} else if(data<(*T)->data){
		if(!DeleteNOde(&(*T)->LeftChild,data,&*taller)){
			return 0;
		}
		if(*taller){
			switch((*T)->bf){
				case LH: (*T)->bf=EH,*taller=1; break;
				case EH: (*T)->bf=RH,*taller=0; break;
				case RH:
					if((*T)->RightChild->bf == 0)
					{
						*taller = 0;
					}
					else
					{
						*taller = 1;
					}
					// This part I am not very understand.
					RightBalance(&(*T)); break;
			}
		}
	}else{
		if(!DeleteNOde(&(*T)->RightChild,data,&*taller))
		{
			return 0;
		}
		if(*taller)
		{
			switch((*T)->bf)
			{
				case 1:
					if((*T)->LeftChild->bf == 0)
					{
						*taller = 0;
					}
					else
					{
						*taller= 1;
					}
					LeftBalance(&(*T));break;
				case 0:
					(*T)->bf = 1;
					*taller= 0;
					break;
				case -1:
					(*T)->bf = 0;
					*taller = 1;
					break;
			}
		}
	}
	return 1;
}

// Get depth of tree
void Depth(BTree *T,int level,int *haval){
	if((*T)!=NULL){
		if(level>*haval) *haval=level;
		Depth(&(*T)->LeftChild,level+1,&*haval);
		Depth(&(*T)->RightChild,level+1,&*haval);
	}
}

int Depth1(BTree T)
{
	if (T==NULL)
		return 0;
	else
	{
		int ld = Depth1(T->LeftChild);
		int rd = Depth1(T->RightChild);
		return 1 + (ld >rd ? ld : rd);
	}
}

int isBalance(BTree T)
{
	/*
	 * Check if its empty
	 */
	if (T==NULL)
		return 1;
	/*
	 * Get depth
	 */
	int dis = Depth1(T->LeftChild) - Depth1(T->RightChild);
	if (dis>1 || dis<-1 )
		return 0;
	else
		return isBalance(T->LeftChild) && isBalance(T->RightChild);
}

BTree T;
void insert_user_bt()
{
	int taller;
	char name[100];
	scanf("%s", name);
	InsertVAL(&T, name, &taller);
}

void remove_user_bt()
{
	int b;
	char username[100];
	scanf("%s", username);
	DeleteNOde(&T, username, &b);
}

void insert_visit_bt()
{
	for (;;) {
	}
}

void save_to_file_bt()
{
	for (;;) {
	}
}

void read_from_file_bt()
{
	for (;;) {
	}
}

void show_usage(char *argv[])
{
	printf("***************************************\n");
	printf("usage: %s -t bt or -t ll", argv[0]);
	printf("***************************************\n");
}


int main (int argc, char *argv[]) {
	/*
	 * Check artument, must be
	 */

	// mode 0 means linked node, mode 1 mean binary tree
	int mode = 0;
	if (argc != 3) {
		show_usage (argv);
		exit(-1);
	}

	/*
	 * Select a mode from command line argument,
	 * -t ll specify linked node list,
	 * -t bt specify binary tree.
	 */
	if (strcmp("-t", argv[1]) == 0) {

		/*
		 * linked list node
		 */
		if (strcmp(argv[2], "ll") == 0) {
			mode = 0;
		}
		/*
		 * binary tree
		 */
		if (strcmp(argv[2], "bt") == 0) {
			mode = 1;
		}
		/*
		 * other, fails
		 */
		else {
			show_usage (argv);
		}
	}

	/*
	 * Init structure
	 */
	InitBTree(&T);
	head = init_node();
	int option;

	printf("***************************************\n");
	printf("Welcome to the Covid app\n");
	printf("***************************************\n");

	for (;;) {
		show_menu();
		// printf("Input your choice:");
		scanf("%d", &option);

		// Choose option
		switch (option) {
			case 1:
				/*
				 * If linked list is chosen
				 */
				if (mode == 0) {
					insert_user_ll ();
					break;
				} else {
					insert_user_bt();
					break;
				}
			case 2:
				/*
				 * Same as above
				 */
				if (mode == 0) {
					insert_visit_ll ();
					break;
				} else {
					insert_visit_bt();
					break;
				}
			case 3:
				if (mode == 0) {
					remove_user_ll();
					break;
				} else {
					remove_user_bt();
					break;
				}
			case 4:
				at_place();
				break;
			case 5:
				if (mode == 0) {
					save_to_file_ll ();
					break;
				} else {
					save_to_file_ll();
					break;
				}
			case 6:
				if (mode == 0) {
				read_from_file_ll();
				break;
				} else {
					read_from_file_bt();
					break;
				}
			case 7:
				show_user();
				break;
			case 8:
				exit(0);
			default:
				printf("***************************************\n");
				printf ("unknown choice\n");
				printf("***************************************\n");
				exit (-1);
		}
	}
}
