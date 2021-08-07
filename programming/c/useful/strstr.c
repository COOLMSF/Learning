#include <string.h>
#include <stdlib.h>

int main()
{
	char *str = "Hello world its me";
	char *substr = "world";

	char *p = strstr(str, substr);

	puts(p);
}
