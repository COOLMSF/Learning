#include<stdio.h>
#include<string.h>
#include<stdlib.h>

#define N 4
#define MAX_LINE 1024

void str_sort(char **str_arr, size_t size);

int main(int argc, char *argv[])
{
	int i;
	char *str_arr[N];

	/*
	 * Alloc memory for string array.
	 */
	for (int j = 0; j < N; ++j) {
		str_arr[j] = (char *)malloc(MAX_LINE);
	}

	printf("Input %d strings.", N);
	for (i = 0; i < N; ++i) {
		scanf("%s", str_arr[i]);
	}

	puts("Before sort");
	for (i = 0; i < N; ++i) {
		printf("%s\n", str_arr[i]);
	}

	puts("After sort");
	char tmp[20];

	for (int i = 0; i < N; ++i) {
		if (strcmp(str_arr[i], str_arr[N-1-i]) < 0) {
			strcpy(tmp, str_arr[i]);
			strcpy(str_arr[i], str_arr[N-1-i]);
			strcpy(str_arr[N-1-i], tmp);
		}
	}
	for (i = 0; i < N; ++i) {
		printf("%s\n", str_arr[i]);
	}
}

/*
 * This is wrong, need to use char ***p, instead of char *str_arr[].
 */
void str_sort(char *str_arr[], size_t size)
{
	char tmp[20];

	for (int i = 0; i < size; ++i) {
		if (strcmp(str_arr[i], str_arr[N-1-i]) < 0) {
			strcpy(tmp, str_arr[i]);
			strcpy(str_arr[i], str_arr[N-1-i]);
			strcpy(str_arr[N-1-i], tmp);
		}
	}
}
