#include "allheaders.h"

int main (int argc, char *argv[])
{
	fd_set rset;
	char rbuf[MAXLINE];

	FD_ZERO(&rset);

	for (;;) {
		FD_SET(fileno(stdin), &rset);

		select(4, &rset, NULL, NULL, NULL);

		if (FD_ISSET(fileno(stdin), &rset)) {
			fgets(rbuf, MAXLINE, stdin);
			puts(rbuf);
		}
	}
}
