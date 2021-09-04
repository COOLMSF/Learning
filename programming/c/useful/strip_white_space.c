#include <stdio.h>
#include <string.h>
#include <ctype.h>

#define BUFSZ 100

int main(void)
{
	char buf[BUFSZ] = { 0 };
	char buf1[BUFSZ] = { 0 };

	puts("Input a string:");
	fgets(buf, BUFSZ, stdin);

	for (int i = 0, j = 0; i < BUFSZ;) {
		// if blank found, add the original buf index
		if (isblank(buf[i])) {
			i++;
			continue;
		}
		buf1[j] = buf[i];
		i++, j++;
	}

	puts(buf1);
}
