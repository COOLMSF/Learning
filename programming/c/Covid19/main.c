#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_LEN 256

struct user_info_t {
    char name[MAX_LEN];
    /*
     * int places[100];
     * int n_places_visited;
     *  Not very understand what does these two variables does,
     *  I use another method.
     */
    char venue[MAX_LEN];
};

/*
 * separate data and linked list node
 */

struct node_t {
    struct user_info_t *user_ptr;
    struct node_t *next;
};

struct node_t *head;

struct user_bt {
    char name[MAX_LEN];
    char venue[MAX_LEN];
    struct user_bt *left;
    struct user_bt *right;
};

/*
 * Some struct for tree
 */
typedef struct BiTNode
{
	int data;
	struct BiTNode *lchild, *rchild;
} BiTNode, *BiTree;

struct node_t *init_node()
{
	// Alloc memory for head node
	head = (struct node_t *) malloc(sizeof (struct node_t));

	// This is head, we don't use it's value

	// This is the end
	head->next = NULL;

	return head;
}

int is_empty(void)
{
	if (head->next == NULL)
		return 1;
	else
		return 0;
}

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

	new_node->user_ptr = user_info;


	return new_node;
}

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

void save_to_file_ll()
{
	if (is_empty()) {
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
		sprintf(buf, "%s, %s", p->user_ptr->name,
		        p->user_ptr->venue);
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
void insert_user_ll()
{
	if (is_empty()) {
		printf("6) Retrieve file first!\n");
		exit(-1);
	}

	char username[MAX_LEN];
	struct node_t *new_node;
	struct user_info_t *user_info = malloc(sizeof (struct user_info_t));

	printf("User name:");
	scanf("%s", username);
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
	char username[MAX_LEN];
	char venue[MAX_LEN];

	printf("Username:");
	scanf("%s", username);
	printf("Venue:");
	scanf("%s", venue);

	while (p != NULL) {
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
	char username[MAX_LEN];
	printf("Username:");
	scanf("%s", username);

	if (!is_empty()) {
		while (p != NULL) {
			// user name found, delete it
			if (strcmp (p->user_ptr->name, username) ==
			    0) {
				del_node (p);
				printf("---------------------------------------\n");
				printf("user deleted\n");
				printf("---------------------------------------\n");
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
	char username[MAX_LEN];
	char venue[MAX_LEN];

	printf("Username:");
	scanf("%s", username);
	printf("Venue:");
	scanf("%s", venue);

	while (p != NULL) {
		if (strcmp(p->user_ptr->name, username) == 0) {
			if (strstr(p->user_ptr->venue, venue) != NULL) {
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

void read_from_file_ll()
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

		// Remove trailing newline
		buffer[strcspn(buffer, "\n")] = 0;
		sscanf(buffer, "%[^','], %[^',']", i->name, i->venue);
		new_node = mk_node(i);
		add_node(new_node);
	}
	printf("---------------------------------------\n");
	printf("Retrieve data done!\n");
	printf("---------------------------------------\n");
	fclose(fp);
}

void show_user()
{
	printf("---------------------------------------\n");
	if (!is_empty()) {
		struct node_t *p = head->next;
		while (p != NULL) {
			printf("Name:%s\n", p->user_ptr->name);
			printf("Place that visit:%s\n", p->user_ptr->venue);
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

#define LH 1 // left high
#define RH (-1) // right high
#define EH  0 // equal high
typedef struct TNode{
    char data[MAX_LEN];// data that structure hold
    int number;// counter
    int bf;// balance factir
    struct TNode *lchild;// left child
    struct TNode *rchild;// right child
}TNode,*BTree;

// Init tree
void InitBTree(BTree *T){
	(*T)=NULL;
}

// Right rotate tree
void R_Rotate(BTree *p){
	BTree T2;
	T2=(*p)->lchild;
	(*p)->lchild=T2->rchild;
	T2->rchild=(*p);
	*p=T2;
}

// Left rotate tree
void L_Rotate(BTree *p){
	BTree T2;
	T2=(*p)->rchild;
	(*p)->rchild=T2->lchild;
	T2->lchild=(*p);
	// Point to new node
	*p=T2;
}


void LeftBalance(BTree *T){
	BTree LT,RT;
	LT=(*T)->lchild;
	switch(LT->bf){
		case LH:
			(*T)->bf=LT->bf=EH;
			R_Rotate(T);
			break;
		case EH:
			(*T)->bf = 1;
			LT->bf = -1;
			R_Rotate(&(*T));
			break;
		case RH:
			RT=LT->rchild;
			switch(RT->bf){
				case LH:(*T)->bf=RH;LT->bf=EH; break;

				case EH:(*T)->bf=LT->bf=EH; break;
				case RH:(*T)->bf=EH;LT->bf=LH; break;
			}
			RT->bf=EH;
			L_Rotate(&(*T)->lchild);
			R_Rotate(T);
	}
}

void RightBalance(BTree *T){
	BTree RT,LT;
	RT=(*T)->rchild;
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
			LT=RT->lchild;
			switch(LT->bf)
			{
				case LH:(*T)->bf=EH;RT->bf=RH;break;
				case EH:(*T)->bf=EH;RT->bf=EH;break;
				case RH:(*T)->bf=LH;RT->bf=EH;break;
			}
			LT->bf=EH;
			R_Rotate(&(*T)->rchild);
			L_Rotate(T);
	}
}

// Some test here
void getData(BTree T){
	if(T!=NULL){
		getData(T->lchild);
		int i;
		for(i=0;i<T->number;i++){
			printf("%s    ",T->data);
		}
		getData(T->rchild);
	}

}

void getData1(BTree T){
	if(T!=NULL){
		printf("%s    ",T->data);
		getData1(T->lchild);
		int i;
		for(i=0;i<T->number;i++){

		}
		getData1(T->rchild);
	}

}
void  getData2( BTree T){
	if(T!=NULL){
		getData2(T->lchild);
		int i;
		for(i=0;i<T->number;i++){
		}
		getData2(T->rchild);
		printf("%s    ",T->data);
	}

}

// Insert value of string, because we will use name as char *
int InsertVAL(BTree *T,char *key,int *taller){
	if(*T==NULL){// new node
		*T=(BTree)malloc(sizeof(TNode));
		strcpy((char *) &((*T)->data), key);
		(*T)->number=1;
		(*T)->bf=EH;
		(*T)->lchild=(*T)->rchild=NULL;
		*taller=1;
	}else  if((*T)->data==key){
		(*T)->number=(*T)->number+1;
		*taller=0;
		return 0 ;
	}else if(key<(*T)->data){// scan left tree
		if(!InsertVAL(&(*T)->lchild,key,&*taller)) return 0;
		if(*taller){
			switch((*T)->bf){
				case LH:LeftBalance(&(*T));*taller=0; break;
				case EH: (*T)->bf=LH; *taller=1;break;
				case RH: (*T)->bf=EH; *taller=0;break;
			}
		}
	}else {
		if(!InsertVAL(&(*T)->rchild,key,&*taller)) return 0;
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
int DeleteNOde(BTree *T,char *data,int *taller){
	if((*T)==NULL||((strcmp((const char *) &(*T)->data, data) == 0)&& (*T)->number > 1)){
		(*T)->number=(*T)->number-1;
		return 0;
	}else if((*T)->data==data){
		if((*T)->lchild==NULL){
			BTree  p=(*T);
			(*T)=(*T)->rchild;
			*taller=1;
			printf("%sDelete successful\n",data);
			free(p);
		}else if((*T)->rchild==NULL){
			BTree p=(*T);
			(*T)=(*T)->lchild;
			*taller=1;
			free(p);
		}else{
			BTree p=(*T)->lchild;
			while(p->rchild!=NULL){
				p=p->rchild;
			}
			strcpy((char *) &(*T)->data, p->data);
			DeleteNOde(&(*T)->lchild,p->data,&*taller);
		}
	} else if(data<(*T)->data){
		if(!DeleteNOde(&(*T)->lchild,data,&*taller)){
			return 0;
		}
		if(*taller){
			switch((*T)->bf){
				case LH: (*T)->bf=EH,*taller=1; break;
				case EH: (*T)->bf=RH,*taller=0; break;
				case RH:
					if((*T)->rchild->bf == 0)
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
		if(!DeleteNOde(&(*T)->rchild,data,&*taller))
		{
			return 0;
		}
		if(*taller)
		{
			switch((*T)->bf)
			{
				case 1:
					if((*T)->lchild->bf == 0)
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
		Depth(&(*T)->lchild,level+1,&*haval);
		Depth(&(*T)->rchild,level+1,&*haval);
	}
}

int Depth1(BTree T)
{
	if (T==NULL)
		return 0;
	else
	{
		int ld = Depth1(T->lchild);
		int rd = Depth1(T->rchild);
		return 1 + (ld >rd ? ld : rd);
	}
}

int isBalance(BTree T)
{
	if (T==NULL)
		return 1;
	int dis = Depth1(T->lchild) - Depth1(T->rchild);
	if (dis>1 || dis<-1 )
		return 0;
	else
		return isBalance(T->lchild) && isBalance(T->rchild);
}

BTree T;
void insert_user_bt()
{
	int taller;
	char name[MAX_LEN];
	scanf("%s", name);
	InsertVAL(&T, name, &taller);
}

void remove_user_bt(char *name)
{
	int b;
	DeleteNOde(&T, name, &b);
}

void insert_visit_bt()
{
}


int main (void) {
	int mode = 0;
	InitBTree(&T);

	head = init_node();
	int input;

	for (;;) {
		show_menu();
		// printf("Input your choice:");
		scanf("%d", &input);

		switch (input) {
			case 1:
				if (mode) {
					insert_user_ll ();
					break;
				} else {
					insert_user_bt();
				}
			case 2:
				insert_visit_ll();
				break;
			case 3:
				remove_user_ll();
				break;
			case 4:
				at_place();
				break;
			case 5:
				save_to_file_ll();
				break;
			case 6:
				read_from_file_ll();
				break;
			case 7:
				show_user();
				break;
			case 8:
				exit(0);
			default:
				printf ("chioce does not exist\n");
				exit (-1);
		}
	}
}

