#include <stdio.h>
#include "itoa.h"

int main(void)
{
	int a = 1234;
	char buf[10];

	for (int i = 0; i < 100; i++) {
		itoa(i, get_num_len(i), buf);
		puts(buf);
	}

}
