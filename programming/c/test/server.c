#include "allheaders.h"

#define PORT 3333
#define IP "127.0.0.1"
#define BUFSZ 1024

#define FIRST_SEND_BUF "send file please"

int recv_file(int conn);

int main()
{
	int sockfd;
	struct sockaddr_in sa_in;

	// char first_recv_buf[BUFSZ] = { 0 };

	sockfd = socket(AF_INET, SOCK_STREAM, 0);
	if (sockfd == -1) {
		perror("socket");
		exit(EXIT_FAILURE);
	}

	sa_in.sin_family = AF_INET;
	sa_in.sin_port = htons(PORT);

	if (inet_pton(AF_INET, IP, &sa_in.sin_addr) == -1) {
		perror("inet_pton");
		exit(EXIT_FAILURE);
	}

	if (bind(sockfd, &sa_in, sizeof(struct sockaddr_in)) == -1) {
		perror("bind");
		exit(EXIT_FAILURE);
	}

	if (listen(sockfd, 0) == -1) {
		perror("listen");
		exit(EXIT_FAILURE);
	}

	for (;;) {
		int conn;
		struct sockaddr_in client;
		socklen_t socklen;
		pid_t pid;

		socklen = sizeof(struct sockaddr_in);

		conn = accept(sockfd, &client, &socklen);
		if (conn == -1) {
			perror("accept");
			exit(EXIT_FAILURE);
		}

		pid = fork();
		if (pid == -1) {
			perror("fork");
			exit(EXIT_FAILURE);
		} else if (pid == 0) {
			char first_recv_buf[BUFSZ] = { 0 };
			char second_recv_buf[BUFSZ] = { 0 };

			while (1) {
				char buf[BUFSZ] = "send file please";
				if (recv(conn, first_recv_buf, BUFSZ, 0) != -1) {
					// send(conn, recv_buf, BUFSZ, 0);
					if (strstr(first_recv_buf, "I want send file") != NULL) {
						if (send(conn, buf, BUFSZ, 0) != -1) {
							if (recv(conn, second_recv_buf, BUFSZ, 0) != -1) {
								if (strstr(second_recv_buf, "I will send file") != NULL) {
									recv_file(conn);
								}
							}
						}
					}
				} else {
					fprintf(stderr, "protocol error");
				}
			}

		} else {
		}
	}
}

int recv_file(int conn)
{
}
