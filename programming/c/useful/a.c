#include <stdio.h>
#include "itoa.h"

int main(void)
{
	int a = 1234;
	char buf[10];

	for (int i = 0; i < 100; i++) {
		// use sprintf(i, "%d", buf) instead
		// itoa(i, get_num_len(i), buf);
		sprintf(buf, "%d", i);
		puts(buf);
	}

}
