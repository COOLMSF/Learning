#include <stdio.h>
#include <stdlib.h>

#define MAX_LINE 100

int main(int argc, char *argv[])
{
	if (argc != 2) {
		fprintf(stderr, "a.out filename");
		exit(-1);
	}

	FILE *fp = NULL;
	
	if ((fp = fopen(argv[1], "r")) == NULL) {
		fprintf(stderr, "failed to open file");
		exit(-1);
	}

	char buf[MAX_LINE];
	fread(buf, MAX_LINE, 1, fp);
	printf("%s", buf);
	fclose(fp);
}
