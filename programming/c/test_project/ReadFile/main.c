#include "allheaders.h"

int main (int argc, char *argv[]) {
	if (argc != 2)
		err_quit("usage: %s filename", argv[0]);

	FILE *fp;
	char buf[MAXLINE];

	if ( (fp = fopen(argv[1], "r")) < 0)
		err_sys("fopen");

	while (fgets(buf, MAXLINE, fp) > 0) {
		fputs(buf, stdout);
	}
}