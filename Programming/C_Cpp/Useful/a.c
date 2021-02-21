#include<stdio.h>
#include<stdlib.h>

int main(int argc, char *argv[])
{
	char *buf[3];

	/*
	 * Alloc memory for string array
	 */

	for (int i = 0; i < 3; ++i) {
		buf[i] = (char *)malloc(20);
	}

	for (int i = 0; i < 3; ++i) {
		scanf("%s", buf[i]);
	}

	for (int i = 0; i < 3; i++) {
		printf("%s", buf[i]);
	}
}
