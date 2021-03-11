//
// Created by coolder on 3/8/21.
//
#include "stu_info.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void *init(struct stu_info *stu_info_arr)
{
	stu_info_arr = NULL;

	return stu_info_arr;
}

// Release an enelemt
void release(struct stu_info *stu_info_arr)
{
	free(stu_info_arr);
}

// Release all element
void finish(struct stu_info *stu_info_arr)
{
	// Release memory
	free(stu_info_arr);
}

int del(char *id, struct stu_info *stu_info_arr)
{
	while(stu_info_arr != NULL) {
	}

	return 1;
}

int query(char *id, struct stu_info *stu_info_arr)
{
	return 1;
}

int add(struct stu_info *stu_info, struct stu_info *stu_info_arr)
{
	return 1;
}

int save_to_disk(struct stu_info *stu_info_arr, FILE *p)
{
	return 1;
}
